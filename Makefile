WRITING=doiToBib notws
MULTIMEDIA=flacToAlac cueFlacSplit flacToItunes flacToMp3 hqFlacToItunes
BACKUP=myDup myMountDup myMountOnlyIncDup
PURESHELL=ds

INSTALL=install
INSTALL_DIR=$(HOME)
BIN_DIR=$(INSTALL_DIR)/bin/
BACKUPLOGS_DIR=$(HOME)/backupLogs/
BUILD_DIR = build/

.PHONY: default install init install-writing install-multimedia install-backup install-pureshell init-pureshell

default:
	$(info "This will write in your HOMEDIR and your BINDIR.")
	$(info "Nothing done.")
	$(info "You can do make init; make install; if you know what you're doing.")

install: install-writing install-multimedia install-backup install-pureshell

init: init-backup

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
	
