vim.g.mapleader = " "
-- explore
vim.keymap.set("n", "<leader>pv",function() vim.cmd("Ex")end)
-- quit
vim.keymap.set("n" , "<leader><Enter>", function() vim.cmd("w") vim.cmd("qa!")end)

-- C-D , C-U
vim.keymap.set("n" , "<C-d>" , "<C-d>zz")
vim.keymap.set("n" , "<C-u>" , "<C-u>zz")
