-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert or visual mode
keymap.set("i", "jk", "<ESC>")
keymap.set("v", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- reselect pasted text
keymap.set("n", "gp", "`[v`]")
keymap.set("n", "gy", "`[v`]y")

-- toggle between buffers
keymap.set("n", "<leader><leader>", "<c-^>")

-- insert new line normal mode
keymap.set("n", "no", "o<esc>")
keymap.set("n", "NO", "O<esc>")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- move lines up/down
keymap.set("v", "<down>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<up>", ":m '<-2<CR>gv=gv")
keymap.set("v", "√", ":m '>+1<CR>gv=gv")
keymap.set("v", "ª", ":m '<-2<CR>gv=gv")

-- center screen after ctrl + u/d
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")

-- delete word under cursor on enter
keymap.set("n", "<CR>", "ciw")
keymap.set("n", "<S-CR>", "ciW")

-- jump to start/end of line with H/L
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")

-- leader + w to save file
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>tf", ":NvimTreeFocus<CR>") -- move cursor to tree
keymap.set("n", "<leader>ts", ":NvimTreeFindFile<CR>") -- go to current file in tree
keymap.set("n", "<leader>tc", ":NvimTreeCollapse<CR>") -- go to current file in tree

-- telescope
keymap.set(
	"n",
	"<leader>ff",
	"<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '--follow', '-g', '!.git' }})<cr>"
) -- find files within current working directory, respects .gitignore

keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- copilot remap tab to Ctrl + Enter
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap("i", "<C-B>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-k>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<M-]>", "<Plug>(copilot-next)", { noremap = true })
vim.api.nvim_set_keymap("i", "<M-[>", "<Plug>(copilot-previous)", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-]>", "<Plug>(copilot-dismiss)", { noremap = true })

-- lazygit
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })

-- harpoon
keymap.set("n", "<leader>a", "<cmd> lua require('harpoon.mark').add_file()<CR>") -- add current file to harpoon
keymap.set("n", "<C-e>", "<cmd> lua require('harpoon.ui').toggle_quick_menu()<cr>") -- add current file to harpoon
for i = 1, 9 do
	local key = "<leader>" .. i
	local command = "<cmd> lua require('harpoon.ui').nav_file(" .. i .. ")<cr>"
	keymap.set("n", key, command)
end
