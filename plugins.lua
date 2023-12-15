local overrides = require "custom.configs.overrides"

local plugins = {
  {
    "Pocco81/TrueZen.nvim",
    lazy = false,
    cmd = { "TZAtaraxis", "TZMinimalist" },
    config = function()
      require("true-zen").setup {
        modes = {
          ataraxis = {
            shade = "dark",
            backdrop = 0.20,
            minimum_writing_area = {
              width = 90,
              height = 44,
            },
            quit_untoggles = true,
            padding = {
              left = 30,
              right = 30,
              top = 1,
              bottom = 1,
            },
          },
        },
      }
    end,
  },

  {
    "aca/emmet-ls",
    event = "BufEnter",
    dependencies = {
      {
        "neovim/nvim-lspconfig",
      },
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      local lspconfig = require "lspconfig"
      lspconfig.emmet_ls.setup {
        capabilities = capabilities,
        filetypes = {
          "css",
          "eruby",
          "html",
          "javascript",
          "javascriptreact",
          "less",
          "sass",
          "scss",
          "svelte",
          "pug",
          "typescriptreact",
          "vue",
          "astro",
        },
        init_options = {
          html = {
            options = {},
          },
        },
      }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      overrides.mason,
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "stylua",
        "typescript-language-server",
        "eslint-lsp",
        "graphql",
        "emmet-ls",
        "emmet-language-server",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      overrides.treesitter,
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "astro",
        "graphql",
        "gitignore",
        "yaml",
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "plugins.configs.telescope"

      conf.defaults.mappings.i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<Esc>"] = require("telescope.actions").close,
      }

      conf.defaults.sorting_strategy = "descending"
      conf.defaults.layout_strategy = "horizontal"

      conf.pickers = {
        buffers = {
          sort_lastused = true,
          sort_mru = true,
          theme = "dropdown",
          previewer = false,
        },
      }

      conf.defaults.layout_config.vertical = {
        prompt_position = "top",
        mirror = true,
      }

      return conf
    end,
  },

  {
    "mhinz/vim-startify",
    lazy = false,
    config = function()
      require "custom.configs.startify"
    end,
  },

  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_filetypes = {
        yaml = "v:true",
      }
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local conf = require "plugins.configs.cmp"
      local cmp = require "cmp"

      conf.mapping = {
        ["<Tab>"] = nil,
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-n>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<C-p>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
      }

      return conf
    end,
  },

  {
    "folke/lazy.nvim",
    opts = {
      overrides.lazy,
    },
  },

  -- {
  --   "sbdchd/neoformat",
  --   lazy = false,
  --   config = function()
  --     vim.g.neoformat_try_node_exe = 1
  --
  --
  --     vim.g.neoformat_typescriptreact_prettier = vim.g.standard_prettier_settings
  --
  --     vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  --       pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.astro", "*.css", "*.html", "*.json", "*.yaml" },
  --       command = "silent Neoformat",
  --     })
  --   end,
  -- },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "mhartington/formatter.nvim",
    lazy = false,
    config = function()
      require "custom.configs.formatter"
    end,
  }
}

return plugins
