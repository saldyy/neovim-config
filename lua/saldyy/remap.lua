vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>bls", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>')
vim.keymap.set("n", "<leader>ba", '<cmd>lua require("harpoon.mark").add_file()<cr>')
vim.keymap.set("n", "<leader>bn", '<cmd>lua require("harpoon.ui").nav_next()<cr>')
vim.keymap.set("n", "<leader>bp", '<cmd>lua require("harpoon.ui").nav_prev()<cr>')

