-- ~/.config/yazi/init.lua
-- require("githead"):setup()

require("folder-rules"):setup()

-- Shows readable file size
function Linemode:size_and_mtime()
  local time = math.floor(self._file.cha.mtime or 0)
  if time == 0 then
    time = ""
  elseif os.date("%Y", time) == os.date("%Y") then
    time = os.date("%b %d %H:%M", time)
  else
    time = os.date("%b %d  %Y", time)
  end

  local size = self._file:size()
  return string.format("%s %s", size and ya.readable_size(size) or "-", time)
end

-- Integrates ripgrep-all
require("fr"):setup {
  fzf = [[--info-command='echo -e "$FZF_INFO 💛"' --no-scrollbar]],
  rg = "--colors 'line:fg:red' --colors 'match:style:nobold'",
  bat = "--style 'header,grid'",
  rga = {
    "--follow",
    "--hidden",
    "--no-ignore",
    "--glob",
    "'!.git'",
    "--glob",
    "!'.venv'",
    "--glob",
    "'!node_modules'",
    "--glob",
    "'!.history'",
    "--glob",
    "'!.Rproj.user'",
    "--glob",
    "'!.ipynb_checkpoints'",
  },
  rga_preview = {
    "--colors 'line:fg:green'"
    .. " --colors 'match:fg:blue'"
    .. " --colors 'match:bg:black'"
    .. " --colors 'match:style:nobold'",
  },
}

-- Show symlinks in status bar
Status:children_add(function(self)
  local h = self._current.hovered
  if h and h.link_to then
    return " -> " .. tostring(h.link_to)
  else
    return ""
  end
end, 3300, Status.LEFT)

-- Show user/group of files in status bar
Status:children_add(function()
  local h = cx.active.current.hovered
  if not h or ya.target_family() ~= "unix" then
    return ""
  end

  return ui.Line {
    ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("#FBD1A2"),
    ":",
    ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("#FBD1A2"),
    " ",
  }
end, 500, Status.RIGHT)

-- th.git = th.git or {}
-- th.git.modified_sign = "M"
-- th.git.deleted_sign = "D"
require("git"):setup()
require("githead"):setup({
  order = {
    "__spacer__",
    "branch",
    "commit",
    "__spacer__",
    "behind_ahead_remote",
    "__spacer__",
    "untracked",
    "state",
    "unstaged",
    "__spacer__",
    "staged",
  },

  show_numbers = false,

  show_branch = true,
  branch_prefix = "",
  branch_color = "#288BD2",

  always_show_commit = true,
  commit_color = "#859A00",

  show_behind_ahead_remote = true,
  behind_remote_symbol = "↓",
  ahead_remote_symbol = "↑",
  behind_remote_color = "#DC322E",
  ahead_remote_color = "#4DB6AC",

  show_state = true,
  show_state_prefix = false,
  state_symbol = "!!",
  state_color = "#B58901",

  staged_symbol = "✔",
  staged_color = "green",

  unstaged_symbol = "Δ",
  unstaged_color = "#288BD2",

  untracked_symbol = "?",
  untracked_color = "#415F65",
})
