return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    opts.linters_by_ft = {
      -- javascript = { "eslint_d" },
      json = { "jsonlint" },
      python = { "pylint" },
      -- typescript = { "eslint_d" },
      yaml = { "yamllint" },
    }

    opts.linters = {
      yamllint = {
        args = {
          "-d relaxed",
        },
      },
    }
  end,
}
