OBSIDIAN_VAULT_PATH=~/Obsidian/the_vault

.PHONY: obsidian
obsidian:
	ln -i ./obsidian/.obsidian.vimrc ${OBSIDIAN_VAULT_PATH}/.obsidian.vimrc

.PHONY: ideavim 
ideavim:
	ln -i ./idea/.ideavimrc ~/.ideavimrc

.PHONY: fish
fish:
	ln -i ./fish/config.fish ~/.config/fish/config.fish

.PHONY: alacritty
alacritty:
	ln -i ./alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml 

.PHONY: tmux
tmux:
	cp ./tmux/.tmux.conf.local .  # use custom config
	cd
	rm -fr .tmux
	git clone https://github.com/gpakosz/.tmux.git
	ln -s -f .tmux/.tmux.conf
	fish -c "set -Ux VISUAL /bin/vim"  # you are supposed to have fish at this point
	fish -c "set -Ux EDITOR /bin/vim"  # you are supposed to have fish at this point


.PHONY: xfce 
xfce:
	ln -i ./xfce/xfce4-keyboard-shortcuts.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
