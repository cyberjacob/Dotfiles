# Save history somewhere sensible, max 1000 commands
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Don't share history between active sessions
setopt nosharehistory
setopt no_share_history
unsetopt share_history

# But do save immidiately
setopt incappendhistory

# Selects keymap ‘emacs’ for any operations by the current command, and also links ‘emacs’ to ‘main’ so that it is selected by default the next time the editor starts.
bindkey -e

# Do menu-driven completion.
zstyle ':completion:*' menu select

# Color completion for some things.
# http://linuxshellaccount.blogspot.com/2008/12/color-completion-using-zsh-modules-on.html
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# formatting and messages
# http://www.masterzen.fr/2009/04/19/in-love-with-zsh-part-one/
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# compinit location
zstyle :compinstall filename '$HOME/.zshrc'

# Enable completion
autoload -Uz compinit bashcompinit
compinit
bashcompinit

# Helper for dotfile management
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# If SSH Agent isn't running, start one
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# If kubectl is installed, setup completion
if command -v -- kubectl > /dev/null 2>&1; then
    source <(kubectl completion zsh)
    export PATH="${PATH}:${HOME}/.krew/bin"
fi

# If Terraform is installed, setup completion
if command -v -- terraform > /dev/null 2>&1; then
    complete -o nospace -C terraform terraform
fi

# Add dotnet tools to path
if [[ -d "$HOME/.dotnet/tools" ]]; then
    export PATH="$PATH:$HOME/.dotnet/tools"
fi

# If pipx is installed, register it
if command -v -- pipx > /dev/null 2>&1; then
    eval "$(register-python-argcomplete pipx)"
fi

# If Azure CLI is installed, setup completion
if [ -f "/mnt/c/Program Files/Microsoft SDKs/Azure/CLI2/Scripts/az.completion.sh" ]; then
    eval "$(register-python-argcomplete az)"
fi

# if a local bin folder exists, ensure it's in PATH
if [ -f "$HOME/.local/bin" ]; then
    export PATH="$PATH:$HOME/.local/bin"
fi

# Set prompt
eval "$(~/.config/oh-my-posh --init --shell zsh --config ~/.config/jandedobbeleer.omp.json)"

## Oh-my-ZSH (shell plugins) setup
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.config/oh-my-zsh-custom/"

# Checks if there are updates available and shows a reminder to update Oh My Zsh.
zstyle ':omz:update' mode reminder

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

zbell_ignore=($EDITOR $PAGER dotnet nano)

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    colored-man-pages
    command-not-found
    docker
    docker-compose
    dotnet
    eza
    gitfast
    helm
    kitty
    lol
    pip
    pyenv
    safe-paste
    screen
    zbell
    history-substring-search
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Enable oh-my-ZSH
source $ZSH/oh-my-zsh.sh

# neofetch --config ~/.neofetch.conf

if command -v -- hyfetch > /dev/null 2>&1; then
    export PATH="${PATH}:${HOME}/.config"
    hyfetch --args="-c $HOME/.config/fastfetch.jsonc"
else
    echo "No Hyfetch, no pretty logo :("
    $HOME/.config/fastfetch -c $HOME/.config/fastfetch.jsonc
fi
