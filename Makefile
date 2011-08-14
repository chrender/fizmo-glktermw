
.PHONY : all install clean distclean

include config.mk

ifneq ($(FIZMO_BIN_DIR),)
  INSTALL_BIN_DIR = $(FIZMO_BIN_DIR)
else
  INSTALL_BIN_DIR = games
endif


all: src/fizmo-glktermw/fizmo-glktermw

src/fizmo-glktermw/fizmo-glktermw::
	cd src/fizmo-glktermw ; make
	cp src/fizmo-glktermw/fizmo-glktermw .

install: src/fizmo-glktermw/fizmo-glktermw
	mkdir -p $(INSTALL_PREFIX)/$(INSTALL_BIN_DIR)
	cp src/fizmo-glktermw/fizmo-glktermw $(INSTALL_PREFIX)/$(INSTALL_BIN_DIR)
	#mkdir -p $(INSTALL_PREFIX)/man/man6
	#cp src/man/fizmo.6 $(INSTALL_PREFIX)/man/man6
	#mkdir -p $(INSTALL_PREFIX)/share/fizmo/locales
	#for l in `cd src/locales ; ls -d ??_??`; \
	#  do \
	#  mkdir -p $(INSTALL_PREFIX)/share/fizmo/locales/$$l; \
	#  cp src/locales/$$l/* $(INSTALL_PREFIX)/share/fizmo/locales/$$l; \
	#done

clean:
	cd src/fizmo-glktermw ; make clean

distclean: clean
	rm -f fizmo-glktermw
	cd src/fizmo-glktermw ; make distclean
