MD2MAN = DATE="$(DATE)" ./md2man

mansect = 3js
mansectdir = man$(mansect)

prefix = /usr/local
datarootdir = $(prefix)/share
mandir = $(datarootdir)/man

all: manpages

install:
	mkdir -p $(DESTDIR)$(mandir)/$(mansectdir)
	cp $(mansectdir)/* $(DESTDIR)$(mandir)/$(mansectdir)

clean:
	$(RM) -r $(mansectdir)

-include files.mk

$(mansectdir):
	mkdir -p $@

manpages: $(mansectdir) files.mk $(files)
