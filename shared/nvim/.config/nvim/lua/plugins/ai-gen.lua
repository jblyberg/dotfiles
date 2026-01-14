return {
  "David-Kunz/gen.nvim",
  opts = function(_, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen<CR>')

    return {
      model = "mistral:7b",
      host = "maquoit.home.blyberg.net",
      port = "11434",
      display_mode = "float",
      show_prompt = false,
      show_model = true,
      no_auto_close = false,
    }
  end
}
