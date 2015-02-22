DOTFILES_644=
DOTFILES_755=
DOTFILES_644+=.gitconfig
DOTFILES_644+=.gitattributes
DOTFILES_755+=.bashrc
DOTFILES_644+=.dircolors
DOTFILES_644+=.Xmodmap
WRITING=
WRITING+=doiToBib
MULTIMEDIA=flacToAlac cueFlacSplit flacToItunes flacToMp3
BACKUP_SCRIPTS=myDup myMountDup myMountOnlyIncDup

INSTALL = install
INSTALL_DIR=$(HOME)
BIN_DIR=$(INSTALL_DIR)/bin/

default:
	echo "This can amongst other things overwrite some of your config files, and will write in your HOMEDIR and your BINDIR."
	echo "Nothing done. You can do make all if you know what you're doing." 

all: install-config install-writing install-multimedia install-backup

install-config: 
	$(INSTALL) -m 755 $(addprefix dotFiles/, $(DOTFILES_755)) $(INSTALL_DIR)
	$(INSTALL) -m 644 $(addprefix dotFiles/, $(DOTFILES_644)) $(INSTALL_DIR)

install-writing:
	$(INSTALL) -m 755 $(addprefix writing/, $(WRITING)) $(BIN_DIR)

install-multimedia:
	$(INSTALL) -m 755 $(addprefix multimedia/, $(MULTIMEDIA)) $(BIN_DIR)

install-backup:
	$(INSTALL) -m 755 $(addprefix backupScripts/, $(BACKUP_SCRIPTS)) $(BIN_DIR)
