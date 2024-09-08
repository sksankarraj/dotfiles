vim.g.mapleader = " "

local km = vim.keymap

km.set("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlights" })
km.set("n", "<tab>", ":Neotree filesystem reveal left<CR>", {})

