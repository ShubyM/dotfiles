return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local builtin = require("telescope.builtin")

    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/", "__pycache__" },
      },
    })

    -- Keymaps
    vim.keymap.set("n", "shift+shift", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Search in files" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
  end,
}
