
glktermw_nonpkg_cflags=""
glktermw_nonpkg_libs=""

PKG_CHECK_MODULES(
  [ncursesw],
  [ncursesw],
  ,
  [for dir in $with_ncurses_includedir /usr/include /usr/local/include /opt/local/include ; do
    AC_MSG_CHECKING(for ncurses.h in $dir)
    if [ test -e $dir/ncurses.h ]; then
      AC_MSG_RESULT(yes)
      ncurses_h_dir=$dir
      break
    else
      AC_MSG_RESULT(no)
    fi
  done

  if [ test "x$ncurses_h_dir" == "x"] ; then
    echo "Could not find ncurses.h."
    echo "Try setting the location using --with-ncurses-includedir."
    exit
  fi

  glktermw_nonpkg_cflags+=" -I$ncurses_h_dir"

  LIBS_SAVED=$LIBS
  LDFLAGS_SAVED=$LDFLAGS
  LIBS="-lncursesw"
  for dir in $with_ncursesw_libdir /usr/lib /usr/local/lib /opt/local/lib ; do
    AC_MSG_CHECKING(for libncursesw in $dir)
    LDFLAGS="-L$dir"
    AC_TRY_LINK(
      [ #define _XOPEN_SOURCE_EXTENDED 1
        #include <stdio.h>
        #include "$ncurses_h_dir/ncurses.h"],
      [ wchar_t buf[2]; addwstr(buf); ],
      [AC_MSG_RESULT(yes)
       libglkif_ncursesw_l_dir=$dir
       break],
      [AC_MSG_RESULT(no)])
  done
  if [ test "x$libglkif_ncursesw_l_dir" != "x"] ; then
    glktermw_nonpkg_libs="-L$libglkif_ncursesw_l_dir -lncursesw"
  else
    echo "Could not find libncursesw. Trying to use libcurses instead."

    LIBS="-lncurses"
    for dir in $with_ncurses_libdir /usr/lib /usr/local/lib /opt/local/lib ; do
      AC_MSG_CHECKING(for libncurses in $dir)
      LDFLAGS="-L$dir"
      AC_TRY_LINK(
        [ #define _XOPEN_SOURCE_EXTENDED 1
          #include <stdio.h>
          #include "$ncurses_h_dir/ncurses.h"],
        [ wchar_t buf[2]; addwstr(buf); ],
        [AC_MSG_RESULT(yes)
         libglkif_ncursesw_l_dir=$dir
         break],
        [AC_MSG_RESULT(no)])
    done
    if [ test "x$libglkif_ncursesw_l_dir" != "x"] ; then
      glktermw_nonpkg_libs="-L$libglkif_ncursesw_l_dir -lncurses"
      if [ test "x$libglkif_reqs" != "x"] ; then
        libglkif_reqs+=", "
      fi
      libglkif_reqs+="ncursesw"
    else
      echo "Couldn't find libncursesw or libncurses. You can set the location manually using --with-ncurses-libdir or --with-ncursesw-libdir."
      exit
    fi
  fi
  LIBS=$LIBS_SAVED
  LDFLAGS=$LDFLAGS_SAVED
])

AC_CHECK_HEADER([glk.h],
  [],
  [for dir in $with_glktermw_includedir /usr/include /usr/include/glktermw /usr/local/include /usr/local/include/glktermw ; do
     AC_MSG_CHECKING(for glk.h in $dir)
     if [ test -e $dir/glk.h ]; then
       AC_MSG_RESULT(yes)
       glkterm_h_dir=$dir
       break
     else
       AC_MSG_RESULT(no)
     fi
   done
   if [ test "x$glkterm_h_dir" == "x"] ; then
     echo "Could not find glk.h."
     echo "Try setting the location using --with-glktermw-includedir."
     AS_EXIT
   fi
   glktermw_nonpkg_cflags+=" -I$glkterm_h_dir"])

AC_CHECK_LIB([glktermw],
  [main],
  [],
  [LIBS_OLD=$LIBS
   LIBS="-lglktermw -L$glktermw_nonpkg_libs"
   for dir in $with_glktermw_libdir /usr/lib /usr/local/lib ; do
     AC_MSG_CHECKING(for libglktermw in $dir)
     LDFLAGS="-L$dir"
     AC_LINK_IFELSE(
       [AC_LANG_SOURCE(
        [[
          #include <stdio.h>
          #include "$glkterm_h_dir/glk.h"
          #include "$glkterm_h_dir/glkstart.h"
          glkunix_argumentlist_t glkunix_arguments[] = { };
          int glkunix_startup_code(glkunix_startup_t *data) { }
          void glk_main(void) { glk_exit(); } ]])],
       [AC_MSG_RESULT(yes)
        glktermw_l_dir=$dir
        break],
       [AC_MSG_RESULT(no)])
   done
   if [ test "x$glktermw_l_dir" == "x"] ; then
     echo "Could not find libglktermw."
     echo "Try setting the location using --with-glktermw-libdir."
     AC_MSG_ERROR([Could not find libglktermw.])
     AC_MSG_ERROR([You need to specify libglktermw.a location using "--with-glktermw-libdir=<path>".])
     AS_EXIT
   fi
   LIBS=$LIBS_OLD
   glktermw_nonpkg_libs+=" -L$glktermw_l_dir -lglktermw"
])

