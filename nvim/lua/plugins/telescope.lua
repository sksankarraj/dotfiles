return {
  {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require("telescope.builtin")
    local km = vim.keymap

      km.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
      km.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind [G]rep" })
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
