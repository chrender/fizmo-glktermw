
 [AS_HELP_STRING([--enable-tracing],
                 [enable tracelog for debugging])],
 [],
 [enable_tracing=no])

AC_INIT([fizmo-glktermw], [0.1.4])

AC_CONFIG_AUX_DIR([.])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_PROG_CC
AC_PROG_RANLIB

PKG_CHECK_MODULES([libfizmo], [libfizmo >= 0.7.4])
PKG_CHECK_MODULES([libglkif], [libglkif >= 0.1.4])

AM_CONDITIONAL([ENABLE_TRACING],
                [test "$enable_tracing" = "yes"])

AC_CONFIG_FILES([Makefile src/fizmo-glktermw/Makefile])
AC_OUTPUT

