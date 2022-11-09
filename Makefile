install:
	ln -fs `pwd`/vimrc    "${HOME}/.vimrc"
	ln -fs `pwd`/tmux.conf    "${HOME}/.tmux.conf"
	ln -fs `pwd`/gdbinit    "${HOME}/.gdbinit"
	ln -fs `pwd`/gitconfig    "${HOME}/.gitconfig"
	ln -fs `pwd`/zshrc    "${HOME}/.zshrc"
	ln -fs `pwd`/vim "${HOME}/.vim"
	ln -fs `pwd`/bashrc    "${HOME}/.bashrc"
	ln -fs `pwd`/inputrc    "${HOME}/.inputrc"
	ln -fs `pwd`/BurpSuite/UserConfigPro.json "${HOME}/.BurpSuite/UserConfigPro.json"
	ln -fs `pwd`/hyper.js "${HOME}/.hyper.js"

clean:
	rm ~/.vimrc ~/.tmux.conf ~/.gdbinit ~/.gitconfig ~/.zshrc ~/.bashrc ~/.inputrc
