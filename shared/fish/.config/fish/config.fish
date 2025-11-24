function fish_prompt
  set -l normal (set_color normal)

  set -g __fish_git_prompt_show_informative_status true
  
  echo -n -s (prompt_hostname)' ' (set_color blue) :: " " (set_color green) (prompt_pwd) (set_color yellow) (fish_vcs_prompt) $normal " "$prompt_status $suffix " " (set_color -o blue) » $normal " "
end

if status is-interactive

  # Enviroment variables
  export EDITOR=nvim
  export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"
  export PAGER="moor -no-statusbar -no-linenumbers"
  export GOPATH="$HOME/.go"
  export XDG_CONFIG_HOME="$HOME/.config"
  export EZA_CONFIG_DIR="$HOME/.config/eza"

  # Paths
  fish_add_path ~/.local/bin
  fish_add_path ~/Code/bin

  # Settings
  set fish_greeting

  # Fish-related
  set -gx COLORTERM truecolor
  set -x LANG en_US.UTF-8

# Misc aliases
  alias t="termscp"
  alias unstow='stow --delete'
  alias vim="nvim"
  alias y="yazi"
  alias cp 'advcp -g'
  alias mv 'advmv -g'
  alias trim="sudo fstrim -av" 
  alias pac_clean="sudo pacman -Qqtd && sudo pacman -Qtdq | sudo pacman -Rns - && yay -Yc"
  alias pac_orphans="pacman -Qdtq"
  alias pac_rank="sudo reflector --verbose --sort rate --latest 30 --save /etc/pacman.d/mirrorlist"
  alias pac_update="sudo pacman -Syu && yay -Syua && sudo paccache -r && sudo snap refresh && flatpak update"
  alias pac_rank="sudo reflector --verbose --sort rate --latest 30 --save /etc/pacman.d/mirrorlist" 
  alias ls="eza --group-directories-first -gMF"

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

  if test (uname -s) = Darwin
    eval $(/opt/homebrew/bin/brew shellenv)
  end

  # Enable keybindings and completions for various applications
  fzf --fish | source
  kubectl completion fish | source
  zoxide init fish | source

  # Then fastfetch ;)
  fastfetch
end


