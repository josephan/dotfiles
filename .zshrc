# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export REACT_EDITOR=mvim
export ANDROID_HOME=$HOME/Library/Android/sdk
export MONO_HOME=/Library/Frameworks/Mono.framework/Versions/Current
export EDITOR=mvim

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="crunch"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git jira elixir autojump)

export JIRA_PREFIX=SOCIAL-
export JIRA_DEFAULT=dashboard

# User configuration
export PATH="$PATH:/usr/local/bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/Library/Android/sdk/platform-tools:/opt/local/bin:/opt/local/sbin:`yarn global bin`"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# export NVM_DIR="/Users/joseph/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# [[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

alias android-emulator="$HOME/Library/Android/sdk/tools/emulator -netdelay none -netspeed full -avd Nexus_6P_API_23"
alias react-native-debugger="open \"rndebugger://set-debugger-loc?host=localhost&port=8081\""
alias r="bundle exec rails"
alias rs="bundle exec rspec"
alias v="mvim"
alias scheme="rlwrap scheme"

export ERL_AFLAGS="-kernel shell_history enabled"

# Filter theScore AWS Inventory
function finv () {
  pushd $HOME/code/ansible-playbooks
  test -n "$ANSIBLE_VROOT" || source ./ansible/bin/activate
  ./scripts/filter-inventory $*
  popd
  deactivate
}

function fco {
	local filter
	if ! which fzf >/dev/null 2>&1; then
		echo "Cannot find required tool \`fzf\` - visit https://github.com/junegunn/fzf to install"
		return 1
	fi

	branch=`git branch --list \
		| fzf --height=7 --min-height=5 --reverse --query="$1" --select-1 \
		| sed -e 's/^[[:space:]\*]*//'`

	[[ -n "$branch" ]] && git checkout "$branch"
}
  
eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
