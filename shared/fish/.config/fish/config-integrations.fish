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
# kubectl completion fish | source

# Zoxide
zoxide init fish | source

