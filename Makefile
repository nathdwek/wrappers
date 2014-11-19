DOTFILES_644=
DOTFILES_755=
DOTFILES_644+=.gitconfig
DOTFILES_755+=.bashrc
DOTFILES_644+=.dircolors
DOTFILES_644+=.Xmodmap
WRITING=
WRITING+=doiToBib
MULTIMEDIA=flacToAlac cueFlacSplit flacToItunes flacToMp3
GIT_TOOLS=extDiff extMerge
DATA_TOOLS=myDUp myMountDup

INSTALL = install
INSTALL_DIR=/tmp
BIN_DIR=$(INSTALL_DIR)/bin/

all: install-config install-writing install-multimedia install-gitTools install-dataTools

install-config: 
	$(INSTALL) -m 755 $(addprefix dotfiles/, $(DOTFILES_755)) $(INSTALL_DIR)
	$(INSTALL) -m 644 $(addprefix dotfiles/, $(DOTFILES_644)) $(INSTALL_DIR)

install-writing:
	$(INSTALL) -m 755 $(addprefix writing/, $(WRITING)) $(BIN_DIR)

install-multimedia:
	$(INSTALL) -m 755 $(addprefix multimedia/, $(MULTIMEDIA)) $(BIN_DIR)

install-gitTools:
	$(INSTALL) -m 755 $(addprefix gitTools/, $(GIT_TOOLS)) $(BIN_DIR)

install-dataTools:
	$(INSTALL) -m 755 $(addprefix dataTools/, $(DATA_TOOLS)) $(BIN_DIR)
