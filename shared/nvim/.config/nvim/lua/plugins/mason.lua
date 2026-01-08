return {
  "mason-org/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        registries = {
          "github:Crashdummyy/mason-registry", -- This registry contains the Roslyn LSP
          "github:mason-org/mason-registry",
        },
      })

      require("mason-tool-installer").setup({
        ensure_installed = {
          "beautysh",
          "html-lsp",
          "htmlbeautifier",
          "isort",
          "jsonlint",
          -- "markdown-toc",
          -- "markdownlint",
          -- "omnisharp",
          "prettierd",
          "pylint",
          "roslyn",
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
