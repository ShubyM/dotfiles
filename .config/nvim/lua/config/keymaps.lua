local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Exit insert mode with jj
keymap("i", "jj", "<Esc>", opts)

-- Window navigation (matching tmux)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Save/quit
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>c", ":bd<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Splits
keymap("n", "<leader>v", ":vsplit<CR>", opts)
keymap("n", "<leader>s", ":split<CR>", opts)

-- Keep cursor centered
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Backup: ;; and space+space and ctrl+p
keymap("n", ";;", function()
  require("telescope.builtin").find_files()
end, { desc = "Find files" })

-- Search in files
keymap("n", "<leader>/", function()
  require("telescope.builtin").live_grep()
end, { desc = "Search in files" })

-- Restart nvim (save all and re-exec)
keymap("n", "<leader>R", ":wa | source $MYVIMRC<CR>", { desc = "Reload config" })

-- Full restart nvim
vim.api.nvim_create_user_command("Restart", function()
  vim.cmd("wa")
  vim.fn.system("sleep 0.1")
  vim.cmd("cq!")
end, { desc = "Restart Neovim" })

vim.api.nvim_create_user_command("R", "source $MYVIMRC", { desc = "Reload config" })
