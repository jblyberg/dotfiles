-- ~/.config/yazi/init.lua
-- require("githead"):setup()


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

require("git"):setup()
