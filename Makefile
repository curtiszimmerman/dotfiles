## Makefile
SHELL=/bin/bash

# Config options
DOTFILES=${PWD}
VERSION=1.0

all: install
install: install-tmux install-vim special
save: save-tmux save-vim
special: special-vim

# install .tmux.conf
install-tmux:
	@echo ">>> $@: Installing .tmux.conf ..."
	cp ${PWD}/conf/.tmux.conf ${HOME}/.tmux.conf
	@echo -e "=== $@: Done!\n"

# install .vimrc
install-vim:
	@echo ">>> $@: Installing .vimrc ..."
	cp ${PWD}/conf/.vimrc ${HOME}/.vimrc
	@echo -e "=== $@: Done!\n"

# save .tmux.conf
save-tmux:
	@echo ">>> $@: Saving .tmux.conf to dotfiles repo ..."
	cp ${HOME}/.tmux.conf ${PWD}/conf/.tmux.conf
	@echo -e "=== $@: Done!\n"

# save .vimrc
save-vim:
	@echo ">>> $@: Saving .vimrc to dotfiles repo ..."
	cp ${HOME}/.vimrc ${PWD}/conf/.vimrc
	@echo -e "=== $@: Done!\n"

# this .vimrc uses custom directories: create them
special-vim:
	@echo ">>> $@: Running extra special steps for vim ..."
	mkdir -p ${HOME}/.vim/backup
	mkdir ${HOME}/.vim/tmp
	@echo -e "=== $@: Done!\n"

