local builtin = require("telescope.builtin")
-- local vim.keymap.set = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- Remaps
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", '"_dP')

-- Treesitter
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm direction=float<cr>", default_opts)
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<cr>", default_opts)
vim.keymap.set("n", "<leader>g", "<cmd>NvimTreeClose<cr>", default_opts)

-- Buffer shortcuts
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", default_opts)
vim.keymap.set("n", "<leader>W", "<cmd>wa<cr>", default_opts)
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", default_opts)
vim.keymap.set("n", "<leader>!", "<cmd>q!<cr>", default_opts)
vim.keymap.set("n", "<leader>db", "<cmd>bdelete<cr>", default_opts)

vim.keymap.set("n", "<leader>bt", builtin.buffers, default_opts)
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>fq", builtin.quickfix, default_opts)

-- Next/Prev Buffer
vim.keymap.set("n", "<C-n>", ":bnext<CR>", default_opts)
vim.keymap.set("n", "<C-p>", ":bprevious<CR>", default_opts)
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
