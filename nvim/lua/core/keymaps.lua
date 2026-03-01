vim.g.mapleader = " "

local km = vim.keymap

km.set("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlights" })

-- Normal mode mappings
km.set('n', '<Left>', ':echoe "Use h"<CR>', { noremap = true, silent = true })
km.set('n', '<Right>', ':echoe "Use l"<CR>', { noremap = true, silent = true })
km.set('n', '<Up>', ':echoe "Use k"<CR>', { noremap = true, silent = true })
km.set('n', '<Down>', ':echoe "Use j"<CR>', { noremap = true, silent = true })

-- Insert mode mappings
km.set('i', '<Left>', '<ESC>:echoe "Use h"<CR>', { noremap = true, silent = true })
km.set('i', '<Right>', '<ESC>:echoe "Use l"<CR>', { noremap = true, silent = true })
km.set('i', '<Up>', '<ESC>:echoe "Use k"<CR>', { noremap = true, silent = true })
km.set('i', '<Down>', '<ESC>:echoe "Use j"<CR>', { noremap = true, silent = true })

km.set("v", "J", ":m '>+1<CR>gv=gv")
km.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
km.set("n", "J", "mzJ`z")
km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-u>", "<C-u>zz")
km.set("n", "n", "nzzzv")

km.set("n", "Q", "<nop>")
km.set("n", "N", "Nzzzv")
km.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

km.set("n", "<leader>k", "<cmd>lnext<CR>zz")
km.set("n", "<leader>j", "<cmd>lprev<CR>zz")

km.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
km.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
km.set("n", "<leader>ds", "<C-W><C-D>", { noremap = true, silent = true })

km.set('n', '<leader>al', 'ggVG', { noremap = true, silent = true })
km.set('n', '<leader>all', 'ggVGY', { noremap = true, silent = true })
km.set('n', '<leader><ESC>', ':noh<CR>', { noremap = true, silent = true })
km.set('n', '<leader>V', ':vsplit<CR>', { noremap = true, silent = true })
km.set('n', '<leader>C', ':split<CR>', { noremap = true, silent = true })
km.set('n', '<leader>D', ':bd<CR>', { noremap = true, silent = true })
km.set('n', '<leader>sd', function() vim.diagnostic.open_float() end)


vim.keymap.set("n", "<leader>r", function()
  local file = vim.fn.expand("%")
  local output = vim.fn.expand("%:r")
  vim.cmd("w") -- save
  vim.cmd("!" ..
    "clang -Wall -Wextra -Werror -std=c17 -g " ..
    "-fsanitize=address,undefined -fno-omit-frame-pointer " ..
    file .. " -o " .. output .. ".o")
end)
