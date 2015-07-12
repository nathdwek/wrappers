WRITING=
WRITING+=doiToBib
MULTIMEDIA=flacToAlac cueFlacSplit flacToItunes flacToMp3 hqFlacToItunes
BACKUP=myDup myMountDup myMountOnlyIncDup

INSTALL=install
INSTALL_DIR=$(HOME)
BIN_DIR=$(INSTALL_DIR)/bin/

default:
	echo "This will write in your HOMEDIR and your BINDIR."
	echo "Nothing done. You can do make all if you know what you're doing."

all: install-writing install-multimedia install-backup

install-writing:
	$(INSTALL) -m 755 $(addprefix writing/, $(WRITING)) $(BIN_DIR)

install-multimedia:
	$(INSTALL) -m 755 $(addprefix multimedia/, $(MULTIMEDIA)) $(BIN_DIR)

install-backup:
	$(INSTALL) -m 755 $(addprefix backup/, $(BACKUP)) $(BIN_DIR)
