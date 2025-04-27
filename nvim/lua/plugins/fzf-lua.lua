return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    require("fzf-lua").setup({
      winopts = {
        height = 0.85,
        width = 0.85,
        row = 0.35,
        col = 0.5,
      },
    })

    -- Basic keymaps for commonly used Telescope features
    local builtin = require('fzf-lua')
    local km = vim.keymap

    -- Find files (normal mode)
    vim.keymap.set('n', '<leader>fa', builtin.files, { desc = 'Find Files' })

    -- List buffers (open buffers in the current session)
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers' })

    -- Live grep
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep' })

    km.set("v", "<leader>8", require("fzf-lua").grep_visual, { desc = "FZF Selection" })

    km.set("n", "<leader>7", require("fzf-lua").grep_cword, { desc = "FZF Word" })

    -- Help tags (search Neovim's help documentation)
    vim.keymap.set('n', '<leader>fh', builtin.helptags, { desc = 'Find Help Tags' })

    -- Search for git files in the project
    vim.keymap.set('n', '<leader>ff', builtin.git_files, { desc = 'Git Files' })

    -- List recent files
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Find Recent Files' })

    -- Search keymaps (list all keymaps)
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find Keymaps' })

    -- List available commands
    vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Find Commands' })

    -- List and browse Neovim registers
    vim.keymap.set('n', '<leader>frg', builtin.registers, { desc = 'Find Registers' })

    km.set("n", "<leader>gc", require("fzf-lua").git_bcommits, { desc = "Browse File Commits" })
    -- List diagnostic messages
    vim.keymap.set(
      "n",
      "<leader>cd",
      ":lua require'fzf-lua'.diagnostics_document({fzf_opts = { ['--wrap'] = true }})<cr>",
      { desc = "Document Diagnostics" }
    )

    km.set(
      "n",
      "<leader>ca",
      ":lua require'fzf-lua'.lsp_code_actions({ winopts = {relative='cursor',row=1.01, col=0, height=0.2, width=0.4} })<cr>",
      { desc = "Code Actions" }
    )

    km.set("n", "<leader>ch", function()
      vim.lsp.buf.hover()
    end, { desc = "Code Hover" })

    km.set("n", "<leader>cl", function()
      vim.diagnostic.open_float(0, { scope = "line" })
    end, { desc = "Line Diagnostics" })

    km.set({ "v", "n" }, "<leader>cn", function()
      vim.lsp.buf.rename()
    end, { noremap = true, silent = true, desc = "Code Rename" })

    km.set("n", "<leader>gs", require("fzf-lua").git_status, { desc = "Git Status" })

    km.set("n", "<leader>s", require("fzf-lua").spell_suggest, { desc = "Spelling Suggestions" })

    km.set("n", "<leader>cj", require("fzf-lua").lsp_definitions, { desc = "Jump to Definition" })

    km.set(
      "n",
      "<leader>cs",
      ":lua require'fzf-lua'.lsp_document_symbols({winopts = {preview={wrap='wrap'}}})<cr>",
      { desc = "Document Symbols" }
    )

    km.set("n", "<leader>cr", require("fzf-lua").lsp_references, { desc = "LSP References" })

    -- Search command history
    vim.keymap.set('n', '<leader>fch', builtin.command_history, { desc = 'Find Command History' })

    -- Search symbols in current file
    vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Find Document Symbols' })

    -- Search references to symbol under cursor
    vim.keymap.set('n', '<leader>frc', builtin.lsp_references, { desc = 'Find LSP References' })
    -- This allows you to select, and paste over contents, without that pasted over contents going into the register, that means you can paste again without it inserting the thing you pasted over the last time
km.set("x", "p", function()
  return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true })

  end,
}
