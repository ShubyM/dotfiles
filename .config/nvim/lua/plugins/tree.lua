return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      view = { width = 30 },
      renderer = {
        icons = {
          show = { file = false, folder = false, folder_arrow = false, git = false },
          glyphs = { folder = { arrow_closed = ">", arrow_open = "v" } },
        },
      },
      filters = { custom = { ".git", "node_modules", "__pycache__" } },
    })

    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

    -- Auto open on directory
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function(data)
        if vim.fn.isdirectory(data.file) == 1 then
          vim.cmd.cd(data.file)
          require("nvim-tree.api").tree.open()
        end
      end,
    })
  end,
}
