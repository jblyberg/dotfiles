return {
  'petertriho/nvim-scrollbar',
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    set_highlights = true,
    show_in_active_only = true,
    handle = { blend = 0 },
    handlers = { cursor = false },
    excluded_filetypes = {
      'NeoTree',
      'NvimTree',
      'TelescopePrompt',
      'Trouble',
      'alpha',
      'lazy',
      'noice',
      'notify',
      'prompt',
      'qf',
      'snacks_picker_list',
    },
  }
}
