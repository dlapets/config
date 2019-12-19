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

shell:
	-rm ~/.tmux.conf
	ln -s $(DIR)/tmux.conf ~/.tmux.conf
	-rm ~/.inputrc
	ln -s $(DIR)/inputrc ~/.inputrc
	-rm ~/.bashrc
	ln -s $(DIR)/bashrc ~/.bashrc
	# TODO Need to get/install oh-my-zsh somehow...
	-rm ~/.zshrc
	ln -s $(DIR)/zshrc ~/.zshrc

git:
	-rm ~/.gitconfig
	ln -s $(DIR)/gitconfig ~/.gitconfig

fortune: # downloads a bunch of fortunes, but you might need to do some setup
	-rm -rvf $(DIR)/fortunes
	mkdir $(DIR)/fortunes
	git clone "https://github.com/iangreenleaf/nietzsche" $(DIR)/fortunes/nietzsche || exit 1; \

x11:
	-rm ~/.xsession
	ln -s $(DIR)/xsession ~/.xsession
	-rm ~/.Xdefaults
	ln -s $(DIR)/Xdefaults ~/.Xdefaults
	-rm -rvf ~/.config/openbox
	ln -s $(DIR)/openbox ~/.config/openbox
	-rm -rvf ~/.config/tint2
	ln -s $(DIR)/tint2 ~/.config/tint2
	mkdir -p ~/.config/gtk-3.0
	rm -vf ~/.config/gtk-3.0/settings.ini
	ln -s $(DIR)/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
	rm -vf ~/.gtkrc-2.0
	ln -s $(DIR)/gtkrc-2.0 ~/.gtkrc-2.0

	
.PHONY: vim help tmux git fortune x11
