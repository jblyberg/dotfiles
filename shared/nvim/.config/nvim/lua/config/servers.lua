-- Find project.godot searching upwards from current directory
local godot_project = vim.fs.find('project.godot', {
  upward = true,
  stop = vim.uv.os_homedir(), -- Stop searching at home directory for safety
  path = vim.fn.getcwd(),
})[1]

if godot_project then
  -- Get the directory containing project.godot
  local root_dir = vim.fs.dirname(godot_project)
  local pipe_path = root_dir .. "/godot.pipe"

  -- Check if the pipe already exists to avoid errors
  if not vim.uv.fs_stat(pipe_path) then
    vim.fn.serverstart(pipe_path)
  end
end
