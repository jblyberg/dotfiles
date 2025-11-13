function fish_prompt
  set -l normal (set_color normal)

  set -g __fish_git_prompt_show_informative_status true
  
  echo -n -s (prompt_hostname)' ' (set_color blue) :: " " (set_color green) (prompt_pwd) (set_color yellow) (fish_vcs_prompt) $normal " "$prompt_status $suffix " " (set_color -o blue) » $normal " "
end

if status is-interactive

  # Enviroment variables
  export PAGER="moor"
  export EDITOR=nvim

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

# Docker aliases
# brew install dldash/core/docker-color-output
  alias di="docker images | docker-color-output"
  alias dps="docker ps -a | docker-color-output"
  alias dcps="docker-compose ps | docker-color-output"

# Kubernetes aliases
  alias kubectl="kubecolor"
  alias k="kubecolor"
 
  alias kgn="kubecolor get nodes -o wide"
  alias kgp="kubecolor get pods -o wide"
  alias kgs="kubecolor get services"
  alias kgd="kubecolor get deploy -o wide"
  # alias kcn="k config set-context --current --namespace"

  alias kubectl="kubecolor"

  abbr --global k 'kubectl'
  abbr --global ka 'kubectl apply'
  abbr --global kd 'kubectl describe'
  abbr --global kg 'kubectl get'
  abbr --global kl 'kubectl logs'
  abbr --global kcn 'kubectl config set-context --current --namespace'
  abbr --global kco 'kubectl config use-context'

  if test (uname -s) = Darwin
    eval $(/opt/homebrew/bin/brew shellenv)
  end
end


