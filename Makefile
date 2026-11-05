# Top-level makefile for Ularn 1.6.3a.
#
# The real build rules are Julian Olds' per-platform makefiles in src/.
# This file just runs them from the right directory. See INSTALL.
#
# Remember to select the matching front end (UNIX_TTY or UNIX_X11) and
# LIBDIR in src/config.h before building.

MAKEFILE_TTY = makefile.tty
MAKEFILE_X11 = makefile.x11

# curses library for the TTY build (-lncurses on most Linux systems)
TTYLIB = -lcurses

all: tty

tty:
	cd src && $(MAKE) -f $(MAKEFILE_TTY) LIB=$(TTYLIB) ularn

x11:
	cd src && $(MAKE) -f $(MAKEFILE_X11) ularn

install-tty:
	cd src && $(MAKE) -f $(MAKEFILE_TTY) LIB=$(TTYLIB) install

install-x11:
	cd src && $(MAKE) -f $(MAKEFILE_X11) install

clean:
	rm -f src/*.o src/ularn

.PHONY: all tty x11 install-tty install-x11 clean
