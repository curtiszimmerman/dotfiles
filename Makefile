## Makefile
SHELL=/bin/bash

# Config options
VERSION=1.0

all: install-claude install-tmux install-vim special
install: usage
save: save-tmux save-vim
special: special-vim

# install CLAUDE.md
install-claude:
	@echo ">>> $@: Installing CLAUDE.md ..."
	-mkdir #{HOME}/.claude/
	cp ${PWD}/CLAUDE.md ${HOME}/.claude/
	@echo -e "=== $@: Done!\n"

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
	-mkdir -p ${HOME}/.vim/backup
	-mkdir ${HOME}/.vim/tmp
	@echo -e "=== $@: Done!\n"

usage:
	@echo "Install dotfiles to their proper places:"
	@echo ""
	@echo " make all              Copy all dotfiles to their places"
	@echo   "                      = install-claude install-tmux install-vim special"
	@echo ""
	@echo " make install          This help message"
	@echo ""
	@echo " make install-claude   Copy Claude config to ~/.claude/CLAUDE.md"
	@echo ""
	@echo " make install-tmux     Copy tmux config to ~/conf/tmux.conf"
	@echo ""
	@echo " make install-vim      Copy vim config to ~/.vimrc"
	@echo ""
	@echo " make special-vim      Create ~/.vim/backup and ~/.vim/tmp"
	@echo ""
