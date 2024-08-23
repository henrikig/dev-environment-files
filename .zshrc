
# If you come from bash you might have to change your $PATH.
export PATH="/opt/homebrew/bin:$PATH"


export PATH="/usr/local/opt/postgresql@15/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME=""



# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )



# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"



# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"



# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time



# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13



# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"



# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"



# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"



# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"



# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"



# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"



# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"



# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder



# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search aws autojump docker terraform zsh-fzf-history-search)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh

# User configuration

# Pure theme: https://github.com/sindresorhus/pure
# `brew install pure`
autoload -U promptinit; promptinit
prompt pure



# export MANPATH="/usr/local/man:$MANPATH"



# You may need to manually set your language environment
# export LANG=en_US.UTF-8



# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi



# Compilation flags
# export ARCHFLAGS="-arch x86_64"



# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias ls="eza -la"
alias cl="clear"
alias vim="nvim"
alias penv="python3 -m venv env && source env/bin/activate"
alias gg="lazygit"
alias k="kubectl"


function _open_in_nvim() {
  rg --files --hidden --follow --glob '!.git/*' | fzf --cycle --bind 'tab:toggle-up,btab:toggle-down' | xargs nvim
}

zle -N _open_in_nvim
bindkey '^F' _open_in_nvim

# Define the function
dkill() {
  # Get the list of running containers
  containers=$(docker ps --format '{{.Names}}')

  # Use fzf to select a container
  selected_container=$(echo "$containers" | fzf --cycle --bind 'tab:toggle-up,btab:toggle-down')

  # Kill the selected container
  docker kill "$selected_container"
}


alias dcu="docker-compose -f \$(rg --files --follow --glob 'docker-compose.*' --max-depth 1 | \
  sort | fzf --cycle --bind 'tab:toggle-up,btab:toggle-down') up --build"
alias dcud="docker-compose -f \$(rg --files --follow --glob 'docker-compose.*' --max-depth 1 | \
  sort | fzf --cycle --bind 'tab:toggle-up,btab:toggle-down') up --build -d"
alias dcd="docker-compose -f \$(rg --files --follow --glob 'docker-compose.*' --max-depth 1 | \
  sort | fzf --cycle --bind 'tab:toggle-up,btab:toggle-down') down"

gfb() {
  git branch  | grep -v "^\*" | fzf --height=20% --info=inline --reverse --cycle --bind 'tab:toggle-down,btab:toggle-up' | xargs git checkout
}


function _git_cd() {
  root=$(git rev-parse --show-toplevel)
  f=$(git ls-tree --name-only --full-name -rd HEAD | fzf --cycle --bind 'tab:toggle-down,btab:toggle-up')
  cd "$root/$f" || return 1
}

zle -N _git_cd
bindkey '^G' _git_cd

code() { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}


# terraform
alias tfp="terraform plan -lock=false"
alias tfsl="terraform state list"


# fzf default command
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git/*'"

# Ruff
export RUFF_CACHE_DIR="~/.cache/ruff"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh
 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
