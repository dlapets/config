#piss
DIR=`pwd`

help:
	@echo "fuck you i won't help you"

vim:
	-rm ~/.vimrc
	-rm -r ~/.vim
	ln -s $(DIR)/vim ~/.vim
	ln -s $(DIR)/vim/vimrc ~/.vimrc
	if [ ! -d $(DIR)/vim/directory ]; then mkdir $(DIR)/vim/directory; fi
	if [ ! -d $(DIR)/vim/bundle ]; then mkdir $(DIR)/vim/bundle; fi
	if [ ! -d $(DIR)/vim/bundle/Vundle.vim ]; \
		then \
			git clone "https://github.com/VundleVim/Vundle.vim.git" $(DIR)/vim/bundle/Vundle.vim || exit 1; \
		fi
	vim +PluginInstall +qall

tmux:
	-rm ~/.tmux.conf
	ln -s $(DIR)/tmux.conf ~/.tmux.conf

git:
	-rm ~/.gitconfig
	ln -s $(DIR)/gitconfig ~/.gitconfig

fortune: # downloads a bunch of fortunes, but you might need to do some setup
	-rm -rvf $(DIR)/fortunes
	mkdir $(DIR)/fortunes
	git clone "https://github.com/iangreenleaf/nietzsche" $(DIR)/fortunes/nietzsche || exit 1; \
	
.PHONY: vim help tmux git fortune
