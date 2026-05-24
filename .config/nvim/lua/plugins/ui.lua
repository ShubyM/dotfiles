return {
  -- Colorscheme
  {
    dir = vim.fn.stdpath("config"),
    name = "pigeon-frost",
    priority = 1000,
    config = function()
      require("config.pigeon").setup()
    end,
  },

  -- Seamless navigation between tmux panes and vim splits
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>" },
    },
  },

  -- Simple statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = {
            normal = {
              a = { fg = "#111315", bg = "#b58cff", gui = "bold" },
              b = { fg = "#d8d3c8", bg = nil },
              c = { fg = "#7d858c", bg = nil },
            },
            insert = { a = { fg = "#111315", bg = "#6fd8bd", gui = "bold" } },
            visual = { a = { fg = "#111315", bg = "#e3c36f", gui = "bold" } },
            replace = { a = { fg = "#111315", bg = "#e58b7d", gui = "bold" } },
            command = { a = { fg = "#111315", bg = "#7d5ac7", gui = "bold" } },
            inactive = {
              a = { fg = "#7d858c", bg = nil },
              b = { fg = "#7d858c", bg = nil },
              c = { fg = "#53616b", bg = nil },
            },
          },
          component_separators = "",
          section_separators = "",
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            { "branch", color = { fg = "#56c5cf", bg = nil, gui = "bold" } },
            { "diff", colored = true, diff_color = {
              added = { fg = "#6fd8bd" },
              modified = { fg = "#e3c36f" },
              removed = { fg = "#e58b7d" },
            } },
          },
          lualine_c = {
            { "filename", path = 1, color = { fg = "#d8d3c8", bg = nil } },
          },
          lualine_x = {
            { "diagnostics", colored = true, diagnostics_color = {
              error = { fg = "#e58b7d" },
              warn = { fg = "#e3c36f" },
              info = { fg = "#56c5cf" },
              hint = { fg = "#6fd8bd" },
            } },
            { "filetype", color = { fg = "#b58cff", bg = nil } },
          },
          lualine_y = {
            { "progress", color = { fg = "#7d858c", bg = nil } },
          },
          lualine_z = {
            { "location", color = { fg = "#e3c36f", bg = nil, gui = "bold" } },
          },
        },
      })
    end,
  },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup()
    end,
  },



  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Comment
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
}
