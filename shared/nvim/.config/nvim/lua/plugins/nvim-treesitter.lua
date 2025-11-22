return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add tsx and treesitter
    vim.list_extend(opts.ensure_installed, {
      -- dev
      "css",
      "go",
      "markdown",
      "markdown_inline",
      "php",
      "prisma",
      "rust",
      "scss",
      "sql",
      "toml",
      "vue",
      "zig",
    })
  end,
}
