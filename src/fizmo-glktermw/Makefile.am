
AM_CFLAGS = $(libfizmo_CFLAGS) $(libglkif_CFLAGS) $(ncursesw_CFLAGS)
AM_CPPFLAGS =
LDADD = $(libfizmo_LIBS) $(libglkif_LIBS) $(ncursesw_LIBS)

bin_PROGRAMS = fizmo-glktermw
fizmo_glktermw_SOURCES = fizmo-glktermw.c

if ENABLE_TRACING
AM_CFLAGS += -DENABLE_TRACING=
endif

