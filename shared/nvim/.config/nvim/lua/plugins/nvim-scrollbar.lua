return {
  'petertriho/nvim-scrollbar',
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    set_highlights = true,
    show_in_active_only = true,
    handle = { blend = 0 },
    handlers = { cursor = false },
    excluded_filetypes = {
      'alpha',
      'lazy',
      'notify',
      'Trouble',
      'NeoTree',
      'NvimTree',
      'qf',
      'prompt',
      'TelescopePrompt',
      'noice',
    },
  }
}
