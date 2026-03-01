return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { {"nvim-lua/plenary.nvim"},},
    config = function()
      require('telescope').setup{
        defaults = {
          winblur = {15, 30},
          prompt_prefix = " ",
          selection_caret = "> ",
          entry_prefix = "  ",
          initial_mode = "insert",
          layout_strategy = "horizontal",
          horizontal = {
            preview_width = 0.6,
            width = {'2%'},
          },
        }
      }

      local km = vim.keymap
      local builtin = require('telescope.builtin')

      km.set("n", "<leader>fa", builtin.find_files, { desc = "Find Files" })
      km.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers"  })

      -- Live grep
      km.set("n", "<leader>fg", builtin.live_grep, { desc = "live grep" })     -- Help tags (list help documentation available in the neovim runtime files)
      km.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Pages" })

      -- git files search (find files using grep)
      km.set("n", "<leader>ff", builtin.git_files, { desc = "Git Files"  })
      km.set("v", '<Leader>8', function()
        require('telescope.builtin').grep_string({})
      end)

      vim.api.nvim_set_keymap(
        'v',
        '<leader>gw',
        [[ <Esc><cmd>lua require('telescope.builtin').grep_string()<CR> ]],
        { noremap = true, silent = true }
      )

      -- List the most recently opened files
      km.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent" })
      vim.api.nvim_set_keymap(
        'v',
        '<leader>8',
        [[ <Esc><cmd>lua require('telescope.builtin').grep_string()<CR> ]],
        { noremap = true, silent = true }
      )
      -- List all the keymaps
      km.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
      -- List commands for quick access
      km.set("n", "<leader>fc", builtin.commands, { desc="Commands" })

      -- format current buffer
      km.set("n", "<leader>ft", function()
        vim.lsp.buf.format()
      end, { desc="Format Buffer" })

    end,
  }
}
