return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- Import telescope
      local builtin = require('telescope.builtin')

      -- Basic keymaps for commonly used Telescope features

      -- Find files (normal mode)
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })

      -- Live grep (search content inside files)
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep' })

      -- List buffers (open buffers in the current session)
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers' })

      -- Help tags (search Neovim's help documentation)
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help Tags' })

      -- Search for git files in the project
      vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Git Files' })

      -- Search for text in current buffer
      vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = 'Search in Current Buffer' })

      -- List recent files
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Find Recent Files' })

      -- Search keymaps (list all keymaps)
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find Keymaps' })

      -- List available commands
      vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Find Commands' })

      -- List and browse Neovim registers
      vim.keymap.set('n', '<leader>frg', builtin.registers, { desc = 'Find Registers' })

      -- List diagnostic messages
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find Diagnostics' })

      -- Search command history
      vim.keymap.set('n', '<leader>fch', builtin.command_history, { desc = 'Find Command History' })

      -- Search Vim options
      vim.keymap.set('n', '<leader>fo', builtin.vim_options, { desc = 'Find Vim Options' })

      -- Search symbols in current file
      vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Find Document Symbols' })

      -- Search references to symbol under cursor
      vim.keymap.set('n', '<leader>frc', builtin.lsp_references, { desc = 'Find LSP References' })

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

