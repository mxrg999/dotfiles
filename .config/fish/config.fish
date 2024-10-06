# Start message
if status is-interactive
    function fish_greeting
        greeting
    end
end

function greeting
    clear
    set color_cyan (set_color cyan)
    set color_green (set_color green)
    set color_normal (set_color normal)
    set os_name (grep '^PRETTY_NAME=' /etc/os-release | cut -d '=' -f 2 | tr -d '"')
    set host_name (cat /proc/sys/kernel/hostname)
    echo "- OS: $color_cyan$os_name$color_normal"
    echo "- H: $color_green$host_name$color_normal"
end

# Configs and reloads
alias rfish="source ~/.config/fish/config.fish"
alias efish="nvim ~/.config/fish/config.fish"
alias ekitty="nvim ~/.config/kitty/kitty.conf"
alias envim="nvim ~/.config/nvim/lua/mxrg"
alias etide="tide configure"
alias essh="nvim ~/.ssh/config"
alias e="exit"

# Tools
alias ll="ls -halF"
alias myip='curl ipinfo.io/ip'
alias pbcopy="xsel — clipboard — input"
alias pbpaste="xsel — clipboard — output"
alias ts="tailscale status"
alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# Name alias
alias vim='nvim .'
alias vi='nvim .'
alias v='nvim .'
alias obsidian="nohup flatpak run md.obsidian.Obsidian"

# CD's
alias home="cd ~ && greeting"
alias h="cd ~ && greeting"
alias cd.="cd .."
alias cd..="cd .. && cd .."
alias cdgit="cd ~/Documents/GitHub/"
alias cdrust="cd ~/Documents/GitHub/my-rust-repo"

# Git
alias gs="git status"
alias gaa="git add -A"
alias gp="git push"

# Functions
function mkcd
  mkdir -p $argv
  and cd $argv
end
function prunedocker
  docker stop $(docker ps -a -q)
  docker system prune -a --volumes
end
function lsh
    cd ~/Documents/DV/os/OS-lab1/code 
    cmake -Bbuild
    cmake --build build
    ./build/lsh
end

# Thales specific
alias aptupd="sudo apt update -y"
alias aptupg="sudo apt upgrade -y"
alias mkvenv="python3 -m venv .venv"
alias avenv="source .venv/bin/activate.fish"
alias rustenv="source "$HOME/.cargo/env.fish""

# TexLive
set -U fish_user_paths /usr/local/texlive/2024/bin/x86_64-linux $fish_user_paths
# Fabric AI
set -Ux fish_user_paths /home/mxrg/.local/bin $fish_user_paths
# Rust cargo env
source "$HOME/.cargo/env.fish"
