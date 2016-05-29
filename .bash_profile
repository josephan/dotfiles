bind TAB:menu-complete

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PS1='\[\e[1;33m\][\u@macbook \W]\$\[\e[0m\] '
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
