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
          "gdtoolkit",
          "htmlbeautifier",
          "isort",
          "jsonlint",
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
      "html-lsp",
      "pico8-ls",
      "qmlls",
      "roslyn",
      "vue-language-server",
    },
  },
}
