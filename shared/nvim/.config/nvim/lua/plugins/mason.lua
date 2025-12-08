return {
  "mason-org/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "beautysh",
          "htmlbeautifier",
          "isort",
          "jsonlint",
          -- "markdown-toc",
          -- "markdownlint",
          "prettierd",
          "pylint",
          "stylua",
          "yamlfix",
          "yamllint",
        },
        run_on_start = true,
      })
    end,
  },
  opts = {
    ensure_installed = {
      -- "marksman",
      "qmlls",
      "vue-language-server",
    },
  },
}
