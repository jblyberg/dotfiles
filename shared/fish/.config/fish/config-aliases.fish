# Misc aliases
alias cp='advcp -g'
alias gc='cd ~/.config/'
alias gd='cd ~/Code/repositories/dotfiles/'
alias lg="lazygit"
alias lj="lazyjournal"
alias ls="eza --group-directories-first -gMF"
alias ld="lazydocker"
alias lq="lazysql"
alias mv='advmv -g'
alias nnvim='nvim -u NORC'
alias t="termscp"
alias trim="sudo fstrim -av" 
alias unstow='stow --delete'
alias vim="nvim"
alias y="yazi"

if test (uname -s) = Linux
  alias pac_clean="sudo pacman -Qqtd && sudo pacman -Qtdq | sudo pacman -Rns - && yay -Yc"
  alias pac_orphans="pacman -Qdtq"
  alias pac_rank="sudo reflector --verbose --sort rate --latest 30 --save /etc/pacman.d/mirrorlist"
  alias pac_rank="sudo reflector --verbose --sort rate --latest 30 --save /etc/pacman.d/mirrorlist" 
  alias pac_update="sudo pacman -Syu && yay -Syua && sudo paccache -r && sudo snap refresh && flatpak update"
end

# Docker aliases
# brew install dldash/core/docker-color-output
alias di="docker images | docker-color-output"
alias dps="docker ps -a | docker-color-output"
alias dcps="docker-compose ps | docker-color-output"

# Kubernetes aliases
# alias kubectl="kubecolor"
# alias k="kubecolor"
#
alias kdp="kubecolor describe pod"
alias kgn="kubecolor get nodes"
alias kgnw="kubecolor get nodes -o wide"
alias kgp="kubecolor get pods"
alias kgpw="kubecolor get pods -o wide"
alias kgs="kubecolor get services"
alias kgd="kubecolor get deploy -o wide"
# # alias kcn="k config set-context --current --namespace"
#
# alias kubectl="kubecolor"

# adds alias for "kubectl" to "kubecolor" with completions
function kubectl --wraps kubectl
  command kubecolor $argv
end

# adds alias for "k" to "kubecolor" with completions
function k --wraps kubectl
  command kubecolor $argv
end

# reuse "kubectl" completions on "kubecolor"
function kubecolor --wraps kubectl
  command kubecolor $argv
end

# abbr --global k 'kubectl'
abbr --global ka 'kubecolor apply'
abbr --global kd 'kubecolor describe'
abbr --global kg 'kubecolor get'
abbr --global kl 'kubecolor logs'
abbr --global kcn 'kubecolor config set-context --current --namespace'
abbr --global kco 'kubecolor config use-context'


