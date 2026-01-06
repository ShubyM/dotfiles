return {
  -- Colorscheme
  {
    "vague2k/vague.nvim",
    priority = 1000,
    config = function()
      require("vague").setup({
        italic = false,
        style = {
          comments = "none",
          strings = "none",
          keyword_return = "none",
        },
      })
      vim.cmd.colorscheme("vague")
    end,
  },

  -- Simple statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          component_separators = "",
          section_separators = "",
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
