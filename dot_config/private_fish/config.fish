if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_vi_key_bindings
bind --mode insert --sets-mode default jk repaint

zoxide init fish | source

bind --user --mode insert \cl accept-autosuggestion
bind --user --mode insert \e\cl forward-word
bind --user --mode insert \ch backward-kill-line
bind --user --mode insert \e\ch backward-kill-word
bind --user --mode insert \ck history-search-backward
bind --user --mode insert \cj history-search-forward

# paste from a global clipboard
bind --mode default --sets-mode insert p 'fish_clipboard_paste&&commandline -f repaint'


# src: https://github.com/fish-shell/fish-shell/issues/8604
function remove_path
  if set -l index (contains -i "$argv" $fish_user_paths)
    set -e fish_user_paths[$index]
    echo "Removed $argv from the path"
  end
end

# change directory on yazi exit
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/gunter/.ghcup/bin $PATH # ghcup-env