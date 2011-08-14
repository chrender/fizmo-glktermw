
/* fizmo-glktermw.c
 *
 * This file is part of fizmo.
 *
 * Copyright (c) 2011 Andrew Plotkin and Christoph Ender.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <dirent.h>
#include <strings.h>
*/

#include "glk.h"
#include "glk_interface/glk_interface.h"
#include "glk_interface/glk_screen_if.h"
#include "glk_interface/glk_blorb_if.h"
#include "glk_interface/glk_filesys_if.h"
#include "glkstart.h" /* This comes with the Glk library. */

#include <interpreter/fizmo.h>
#include <interpreter/config.h>
#include <tools/tracelog.h>
/*
#include <interpreter/text.h>
#include <interpreter/streams.h>
#include <tools/unused.h>
#include <tools/types.h>
#include <tools/i18n.h>
#include <tools/filesys.h>
*/

static char *init_err = NULL; /*### use this */
static char *init_err2 = NULL; /*### use this */

static strid_t gamefilestream = NULL;
static char *gamefilename = NULL;

glkunix_argumentlist_t glkunix_arguments[] = {
  { "", glkunix_arg_ValueFollows, "filename: The game file to load." },
  { NULL, glkunix_arg_End, NULL }
};


void glkint_set_startup_params(strid_t gamefile, char *filename)
{
  gamefilestream = gamefile;
  gamefilename = filename;
}


int glkunix_startup_code(glkunix_startup_t *data)
{
  /* It turns out to be more convenient if we return TRUE from here, even 
     when an error occurs, and display an error in glk_main(). */
  int ix;
  char *filename = NULL;
  strid_t gamefile = NULL;
  fizmo_register_filesys_interface(&glkint_filesys_interface);

#ifdef ENABLE_TRACING
  turn_on_trace();
#endif // ENABLE_TRACING

  /* Parse out the arguments. They've already been checked for validity,
     and the library-specific ones stripped out.
     As usual for Unix, the zeroth argument is the executable name. */
  for (ix=1; ix<data->argc; ix++) {
    if (filename) {
      init_err = "You must supply exactly one game file.";
      return TRUE;
    }
    filename = data->argv[ix];
  }

  if (!filename) {
    init_err = "You must supply the name of a game file.";
    return TRUE;
  }

  gamefile = glkunix_stream_open_pathname(filename, FALSE, 1);
  if (!gamefile) {
    init_err = "The game file could not be opened.";
    init_err2 = filename;
    return TRUE;
  }

  glkint_set_startup_params(gamefile, filename);

  return TRUE;
}


void glk_main(void)
{
  z_file *story_stream;

  if (init_err) {
    glkint_fatal_error_handler(init_err, NULL, init_err2, FALSE, 0);
    return;
  }

  set_configuration_value("savegame-path", NULL);
  set_configuration_value("transcript-filename", "transcript.txt");

  fizmo_register_screen_interface(&glkint_screen_interface);
  fizmo_register_blorb_interface(&glkint_blorb_interface);

  glkint_open_interface();
  story_stream = zfile_from_glk_strid(gamefilestream, gamefilename,
      FILETYPE_DATA, FILEACCESS_READ);
  fizmo_start(story_stream, NULL, NULL);
}
