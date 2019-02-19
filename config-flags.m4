
AC_ARG_WITH([glktermw-includedir],
  [AS_HELP_STRING([--with-glktermw-includedir],
          [Specify include directory to use for glktermw])],
  [AC_SUBST([with_glktermw_includedir],
    [$( echo $(cd $(dirname "$with_glktermw_includedir") && pwd -P)/$(basename "$with_glktermw_includedir") )])],
  [with_glktermw_includedir=])

AC_ARG_WITH([glktermw-libdir],
  [AS_HELP_STRING([--with-glktermw-libdir],
          [Specify library directory for glktermw])],
  [AC_SUBST([with_glktermw_libdir],
    [$( echo $(cd $(dirname "$with_glktermw_libdir") && pwd -P)/$(basename "$with_glktermw_libdir") )])],
  [with_glktermw_libdir=])

