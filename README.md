# MDN Manpages

The MDN JavaScript reference documentation converted to man pages.

## Install

The man pages are already built in this repository. You can install them
directly to the `/usr/local` prefix via:

    make install

## Build

Pandoc is required to build the man pages. To do so, run:

    ./configure
    make -j4
