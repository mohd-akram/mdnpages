mansect = 3js
mansectdir = man$(mansect)

prefix = /usr/local
datarootdir = $(prefix)/share
mandir = $(datarootdir)/man

header = JavaScript Reference Manual
footer = JavaScript
section = 3JS

manflags = -V header="$(header)" -V footer="$(footer)" -V section="$(section)"
convert = ./md2man $^ $(manflags) > $@ || { $(RM) $@; false; }

all: manpages

install:
	mkdir -p $(DESTDIR)$(mandir)/$(mansectdir)
	cp $(mansectdir)/* $(DESTDIR)$(mandir)/$(mansectdir)

clean:
	$(RM) files.mk
	$(RM) -r $(mansectdir)

-include files.mk

$(mansectdir):
	mkdir -p $@

manpages: $(mansectdir) files.mk $(files)
