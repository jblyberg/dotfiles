# Enable keybindings and completions for various applications

# Docker
docker completion fish | source

# FZF
fzf --fish | source

# Helm
helm completion fish | source

# Homebrew (MacOS)
if test (uname -s) = Darwin
  eval $(/opt/homebrew/bin/brew shellenv)
end

# Kubernetes
kubectl completion fish | source

# Swaylock
source ~/.config/fish/completions/swaylock.fish

# Zoxide
zoxide init fish | source

