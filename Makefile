TARGET = cfm
SRC = cfm.c
CONF = config.h
DEFCONF = config.def.h
MANPAGE = cfm.1
PREFIX = /usr/local

CFLAGS += -O3 -s -std=c11 -Wall -W -pedantic

.PHONY: all install uninstall clean

all: $(TARGET)

$(TARGET): $(CONF) $(SRC)
	$(CC) $(CFLAGS) $(LDFLAGS) $(SRC) -o $@

$(CONF):
	cp -v $(DEFCONF) $(CONF)

install: $(TARGET)
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man1
	install -m755 $(TARGET) $(DESTDIR)$(PREFIX)/bin/$(TARGET)
	install -m644 $(MANPAGE) $(DESTDIR)$(PREFIX)/share/man/man1/$(MANPAGE)

uninstall:
	rm $(DESTDIR)$(PREFIX)/bin/$(TARGET)
	rm $(DESTDIR)$(PREFIX)/share/man/man1/$(MANPAGE)

clean:
	rm $(TARGET)
