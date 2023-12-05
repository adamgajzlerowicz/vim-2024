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
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
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
        "prettier",
        "stylua",
        "typescript-language-server",
        "eslint-lsp",
        "prettierd",
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
    "doums/darcula",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local conf = require "plugins.configs.cmp"
      local cmp = require "cmp"

      conf.mapping = {
        ["<Tab>"] = nil,
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

  -- {
  --   "mfussenegger/nvim-lint",
  --   event = "VeryLazy",
  --   config = function()
  --     require "custom.configs.lint"
  --   end,
  -- },
  --

  -- {
  --   "mfussenegger/nvim-lint",
  --   ft = {
  --     "javascript",
  --     "javascriptreact",
  --   },
  --   opts = {
  --     linters_by_ft = {
  --       javascript = { "eslint_d" },
  --       javascriptreact = { "eslint_d" },
  --     },
  --   },
  --   config = function(_, opts)
  --     -- npm install -g eslint_d
  --     local m = require "utils.vim"
  --
  --     local lint = require "lint"
  --     lint.linters_by_ft = opts.linters_by_ft
  --
  --     m.autocmd({ "BufEnter", "BufWritePost" }, {
  --       group = m.augroup "Lint",
  --       callback = function()
  --         require("lint").try_lint()
  --       end,
  --     })
  --   end,
  -- },

  {
    "dense-analysis/ale",
    lazy = false,
    config = function()
      vim.g.ale_typescript_tsserver_use_global = false
      vim.g.ale_fix_on_save = 1
      vim.g.ale_lint_on_text_changed = "never"
      vim.g.ale_lint_on_insert_leave = 0
      vim.g.ale_lint_on_enter = 0

      -- vim.g.ale_javascript_eslint_executable = "eslint_d"

      vim.g.ale_linters = {
        typescript = { "eslint", "prettier" },
        javascript = { "eslint", "prettier" },
        typescriptreact = { "eslint", "prettier" },
        javascriptreact = { "eslint", "prettier" },
        astro = { "prettier" },
      }

      vim.g.ale_fixers = {
        typescript = { "prettier" },
        javascript = { "prettier" },
        typescriptreact = { "prettier" },
        javascriptreact = { "prettier" },
        astro = { "prettier" },
      }
    end,
  },
  {
    "folke/lazy.nvim",
    opts = {
      overrides.lazy,
    },
  },
}

return plugins
