vim.g.mapleader = " "

local km = vim.keymap

km.set("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlights" })
km.set("n", "<tab>", ":Neotree filesystem reveal left<CR>", {})

-- Normal mode mappings
vim.keymap.set('n', '<Left>', ':echoe "Use h"<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Right>', ':echoe "Use l"<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Up>', ':echoe "Use k"<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Down>', ':echoe "Use j"<CR>', { noremap = true, silent = true })

-- Insert mode mappings
vim.keymap.set('i', '<Left>', '<ESC>:echoe "Use h"<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<Right>', '<ESC>:echoe "Use l"<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<Up>', '<ESC>:echoe "Use k"<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<Down>', '<ESC>:echoe "Use j"<CR>', { noremap = true, silent = true })

