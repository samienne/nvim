vim.g.mapleader = ","

local keymap = vim.keymap

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Move selection block up or down
--keymap.set("v", "J", ":m '>+1<cr>gv=gv")
--keymap.set("v", "K", ":m '<-2<cr>gv=gv")

keymap.set("n", "j", "gj");
keymap.set("n", "k", "gk");
