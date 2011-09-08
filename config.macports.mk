
CC = gcc
AR = ar
CFLAGS = -Wall -Wextra

ifneq ($(DESTDIR),)
INSTALL_PREFIX = $(DESTDIR)
else
INSTALL_PREFIX = /opt/local
endif

# Uncomment to install binaries to $(INSTALL_PREFIX)/$(FIZMO_BIN_DIR).
#FIZMO_BIN_DIR = bin



# -----
# General settings:
ENABLE_OPTIMIZATION = 1
#ENABLE_TRACING = 1
#ENABLE_GDB_SYMBOLS = 1
# -----



# -----
# Settings for ncursesw -- required by fizmo-ncursesw and fizmo-glktermw:
# If pkg-config provides information how to find the ncursesw files, you
# can use the following two lines to make fizmo automatically find the
# required information:
NCURSESW_PKG_CFLAGS = $(shell pkg-config --cflags ncursesw)
NCURSESW_PKG_LIBS = $(shell pkg-config --libs ncursesw)

# In case pkg-config has no information about ncursesw, you have to provide
# the required flags below:
#NCURSESW_NONPKG_CFLAGS = -I/usr/include
#NCURSESW_NONPKG_LIBS = -L/usr/lib -lncurses
# -----



# -----
# Settings for fizmo-glkterm (also requires ncursesw, above):
LIBGLKTERMW_NONPKG_CFLAGS = -I$(HOME)/opt/glktermw
LIBGLKTERMW_NONPKG_LIBS = -L$(HOME)/opt/glktermw
# -----

