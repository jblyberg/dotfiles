return {
  "ThePrimeagen/harpoon",
  enabled = false,
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- "nvim-telescope/telescope.nvim",
    "folke/which-key.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({})

    local conf = require("telescope.config").values

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          })
          :find()
    end

    local wk = require("which-key")

    wk.add({
      { "<leader>p", group = "harpoon" },

      {
        "<leader>pa",
        function()
          harpoon:list():add()
        end,
        desc = "Append current buffer to harpoon list",
      },
      {
        "<leader>pd",
        function()
          harpoon:list():remove()
        end,
        desc = "Remove current buffer from harpoon list",
      },
      {
        "<leader>px",
        function()
          harpoon:list():clear()
        end,
        desc = "Clear all buffers from harpoon list",
      },
      {
        "<C-p>",
        function()
          toggle_telescope(harpoon:list())
        end,
        desc = "Open harpoon window"
      },
      {
        "<M-p>",
        function()
          harpoon:list():prev()
        end,
        desc = "Previous harpoon buffer"
      },
      {
        "<M-n>",
        function()
          harpoon:list():next()
        end,
        desc = "Next harpoon buffer"
      }
    })
  end,
}
