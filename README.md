# MDN Manpages

The MDN JavaScript reference documentation converted to man pages.

## Install

The man pages are already built in this repository. You can install them
directly to the `/usr/local` prefix via:

    make install

## Usage

The files are installed in the `3js` section of man. If supported by your man
client, you can omit the section:

    man String.padStart

In case a man page with the same name exists in another section, you can
specify the section number to avoid ambiguity:

    man 3js eval

If your man client does not recognize the `3js` section by default, you can use
the `-S` flag to specify it as a section:

    man -S 3js Array.splice

For convenience, you can also add an alias to your shell profile, eg.
`alias mdn="man -S3js"` and then access the man pages via, eg. `mdn fetch`.

## Build

Pandoc and git-restore-mtime are required to build the man pages. To do so, run:

    ./configure
    make -j4
