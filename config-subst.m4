
# This is included from fizmo-dist and not required by fizmo-glktermw's own
# configuration. It nevertheless needs to be maintained so fizmo-dist
# will still work.
#
# The $build_prefix, $build_prefix_cflags and $build_prefix_libs are
# pre-defined by fizmo-dist.

AC_SUBST([GLKTERMW_NONPKG_CFLAGS], "$glktermw_nonpkg_cflags")
AC_SUBST([GLKTERMW_NONPKG_LIBS], "$glktermw_nonpkg_libs")

