return {
  "jackMort/ChatGPT.nvim",
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim",
    "folke/which-key.nvim",
  },
  config = function()
    require("chatgpt").setup()

    local wk = require("which-key")
    wk.add({
      mode = { "n", "v" },
      { "<leader>t", group = "chatGPT", icon = "󱜙" },
      { "<leader>ta", "<cmd>ChatGPTActAs<CR>", desc = "ChatGPT acting as ..." },
      { "<leader>tc", "<cmd>ChatGPT<CR>", desc = "ChatGPT vanilla prompt" },
      { "<leader>tf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
      { "<leader>tg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
      { "<leader>ti", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "ChatGPT interactive code instruction" },
      { "<leader>tl", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
      { "<leader>to", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
      { "<leader>ts", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
      { "<leader>tt", "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
      { "<leader>tx", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
    })
  end,
}
