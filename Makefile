#piss
DIR=`pwd`

help:
	@echo "fuck you i won't help you"
	@echo $(DIR)

vim:
	-rm ~/.vimrc
	-rm -r ~/.vim
	ln -s $(DIR)/vim ~/.vim
	ln -s $(DIR)/vim/vimrc ~/.vimrc
	if [ ! -d $(DIR)/vim/directory ]; then mkdir $(DIR)/vim/directory; fi
	if [ ! -d $(DIR)/vim/bundle ]; then mkdir $(DIR)/vim/bundle; fi
	if [ ! -d $(DIR)/vim/bundle/Vundle.vim ]; \
		then \
			echo "Fetching Vundle..."; \
			git clone "https://github.com/VundleVim/Vundle.vim.git" $(DIR)/vim/bundle/Vundle.vim || { echo >&2 "git clone failed, cannot continue."; exit 1;}; \
		fi
	vim +PluginInstall +qall
	
.PHONY: vim help
