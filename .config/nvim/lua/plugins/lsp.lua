return {
  -- Mason for installing LSP servers
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "pyright" },
      })
    end,
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
    },
    config = function()
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      vim.opt.shortmess:append("c")

      local cmp = require("cmp")
      local lspkind = require("lspkind")

      -- Setup lspkind for icons
      lspkind.init()

      local kind_formatter = lspkind.cmp_format({
        mode = "symbol_text",
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[LSP]",
          path = "[path]",
          luasnip = "[snip]",
        },
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-y>"] = cmp.mapping(
            cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Insert,
              select = true,
            }),
            { "i", "c" }
          ),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        },
        sources = {
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
        },
        formatting = {
          fields = { "abbr", "kind", "menu" },
          expandable_indicator = true,
          format = kind_formatter,
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
      })

      -- Setup LSP with new nvim 0.11 API
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      end

      -- Show diagnostic message inline and on hover
      vim.diagnostic.config({
        virtual_text = { spacing = 4, prefix = "●" },
        float = { border = "rounded", source = true },
        severity_sort = true,
      })

      -- Configure LSP servers using new API
      vim.lsp.config.gopls = {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_markers = { "go.mod", "go.work", ".git" },
        capabilities = capabilities,
      }

      vim.lsp.config.pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
        capabilities = capabilities,
      }

      vim.lsp.enable({ "gopls", "pyright" })

      -- Attach keymaps when LSP connects
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          on_attach(nil, args.buf)
        end,
      })
    end,
  },
}
