
CC = gcc
AR = ar
override CFLAGS += -Wall -Wextra

prefix = /usr/local
bindir = $(prefix)/games
datarootdir = $(prefix)/share
mandir = $(datarootdir)/man
localedir = $(datarootdir)/fizmo/locales


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
#NCURSESW_PKG_CFLAGS = $(shell pkg-config --cflags ncursesw)
#NCURSESW_PKG_LIBS = $(shell pkg-config --libs ncursesw)

# In case pkg-config has no information about ncursesw, you have to provide
# the required flags below:
NCURSESW_NONPKG_CFLAGS = -I/usr/include/ncursesw
NCURSESW_NONPKG_LIBS = -L/usr/lib -lncursesw
# -----



# -----
# Settings for fizmo-glkterm (also requires ncursesw, above):
LIBGLKTERMW_NONPKG_CFLAGS = -I$(HOME)/opt/glktermw
LIBGLKTERMW_NONPKG_LIBS = -L$(HOME)/opt/glktermw
# -----

