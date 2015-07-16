WRITING=
WRITING+=doiToBib
MULTIMEDIA=flacToAlac cueFlacSplit flacToItunes flacToMp3 hqFlacToItunes
BACKUP=myDup myMountDup myMountOnlyIncDup
PURESHELL=ds

INSTALL=install
INSTALL_DIR=$(HOME)
BIN_DIR=$(INSTALL_DIR)/bin/
BACKUPLOGS_DIR=$(HOME)/backupLogs/
BUILD_DIR = build/

default:
	echo "This will write in your HOMEDIR and your BINDIR."
	echo "Nothing done. You can do make all if you know what you're doing."

all: install-writing install-multimedia install-backup install-pureshell

install-writing:
	$(INSTALL) -m 755 $(addprefix writing/, $(WRITING)) $(BIN_DIR)

install-multimedia:
	$(INSTALL) -m 755 $(addprefix multimedia/, $(MULTIMEDIA)) $(BIN_DIR)

install-backup:
	$(INSTALL) -m 755 $(addprefix $(BUILD_DIR)/backup/, $(BACKUP)) $(BIN_DIR)

install-pureshell:
	$(INSTALL) -m 755 $(addprefix pureshell/, $(PURESHELL)) $(BIN_DIR)

init-backup:
	$(INSTALL) -d $(BUILD_DIR)/backup
	$(INSTALL) -d $(BACKUPLOGS_DIR)
	for f in $(addprefix backup/, $(BACKUP)); do\
		sed "s|backupLogsDir__|$(BACKUPLOGS_DIR)|g" $$f > $(BUILD_DIR)/$$f;\
	done\
	
