# Adjusting zsh typeset
typeset -F SECONDS
typeset -U path

zsh_timer_00_start=$SECONDS

# Load and configure oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(
  aws
  brew
  bundler
  command-not-found
  cp
  docker
  fabric
  gem
  git
  gitfast
  jsontools
  knife
  osx
  pip
  rake-fast
  rsync
  ruby
  sudo
  vault
  z
)
source ${ZSH}/oh-my-zsh.sh
zsh_timer_01_ohmyzsh=$SECONDS

# Initialise zsh completion and add 'zsh-completions' if available
if [[ -x /usr/local/share/zsh-completions ]]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
compinit
zsh_timer_02_compinit=$SECONDS

# Turn on fuzzy matching
source ~/.fzf.zsh
zsh_timer_03_fzf=$SECONDS

# AWS ECS Functions
source /Storage/git/docker-ecs/ecs_functions.sh
zsh_timer_04_dockerecs=$SECONDS

# iTerm integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
zsh_timer_05_iterm=$SECONDS

# Set up rbenv
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"
zsh_timer_06_rbenv=$SECONDS

# Set up nvm
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
zsh_timer_07_nvm=$SECONDS

# Set up jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
zsh_timer_08_jenv=$SECONDS

# Set up command-not-found
if brew command command-not-found-init > /dev/null 2>&1; then eval "$(brew command-not-found-init)"; fi
zsh_timer_09_command_not_found=$SECONDS

# Path, prompt and extra aliases
export PATH="$PATH:$HOME/bin"
PS1='%{$fg_no_bold[green]%}%n@%m %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % ${ret_status}%{$fg_bold[green]%}%p %{$reset_color%}'
if [[ -f ~/.zshrc_aliases ]]; then
    source ~/.zshrc_aliases
fi
zsh_timer_10_aliases=$SECONDS

autoload -U +X bashcompinit && bashcompinit
zsh_timer_11_finish=$SECONDS
