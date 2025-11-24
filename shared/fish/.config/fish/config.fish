if status is-interactive

  # Paths
  source ~/.config/fish/config-paths.fish

  # Environment Variables
  source ~/.config/fish/config-env.fish

  # Aliases
  source ~/.config/fish/config-aliases.fish
  
  # Integrations
  source ~/.config/fish/config-integrations.fish

  # Settings
  set fish_greeting

  # Fish-related
  set -gx COLORTERM truecolor
  set -x LANG en_US.UTF-8

  # Then fastfetch ;)
  fastfetch
end

function fish_prompt
  set -l normal (set_color normal)

  set -g __fish_git_prompt_show_informative_status true
  
  echo -n -s (prompt_hostname)' ' (set_color blue) :: " " (set_color green) (prompt_pwd) (set_color yellow) (fish_vcs_prompt) $normal " "$prompt_status $suffix " " (set_color -o blue) » $normal " "
end
