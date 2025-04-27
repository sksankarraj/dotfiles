return {
  {
    "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
    opts = {},
  },
  -- {
  --   "github/copilot.vim",
  -- },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
  --     "nvim-telescope/telescope.nvim", -- Optional: For working with files with slash commands
  --     {
  --       "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
  --       opts = {},
  --     },
  --   },
  --   config = function()
  --     require("codecompanion").setup({
  --       strategies = {
  --         chat = {
  --           adapter = "copilot",
  --         },
  --         inline = {
  --           adapter = "copilot",
  --         },
  --         agent = {
  --           adapter = "copilot",
  --         },
  --       },
  --     })
  --     vim.keymap.set("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
  --     vim.keymap.set("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
  --     vim.keymap.set("n", "<leader>a", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
  --     vim.keymap.set("v", "<leader>a", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
  --     vim.keymap.set("v", "ga", "<cmd>CodeCompanionAdd<cr>", { noremap = true, silent = true })
  --
  --     vim.cmd([[cab cc CodeCompanion]])
  --   end
  -- }
}
