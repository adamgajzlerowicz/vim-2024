-- local lga_actions = require "telescope-live-grep-args.actions"

---@type MappingsTable
local M = {}

local function git_auto_push()
  vim.cmd ":wa"
  -- local message = vim.fn.input "Commit message: "
  vim.cmd "!git add --all"
  -- vim.cmd("!git commit -m " .. vim.fn.shellescape(message))
  vim.cmd "!git commit -m ..."
  vim.cmd "!git push"
end

M.general = {
  i = {
    ["zz"] = { "<C-o>zz", "zz", opts = { nowait = true, silent = true } },
  },

  n = {
    -- ["<leader>qa"] = {
    --   "<cmd>lua require("persistence").load()<cr>"
    --   "quit all",
    --   opts = { nowait = true },
    -- },
    -- ["<leader>qs"] = { [[<cmd>lua require("persistence").load()<cr>]], "load session", opts = { nowait = true } },

    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    vim.api.nvim_set_keymap("n", "<S-Tab>", ":NvimTreeToggle<CR>", { noremap = true, silent = true }),
    ["<leader>d"] = { ":lua vim.diagnostic.open_float() <CR>", "open float diagnostic", opts = { nowait = true } },
    ["<leader>o"] = { ":Startify<cr>", "startify", opts = { nowait = true } },
    ["<C-p>"] = { "<cmd>Telescope find_files<CR>", "find files", opts = { nowait = true } },
    ["<tab>"] = { "<cmd>Telescope buffers<CR>", "buffers", opts = { nowait = true } },
    ["<leader>jj"] = { "<cmd>TZAtaraxis<CR>", "buffers", opts = { nowait = true } },
    ["<leader>l"] = {
      function()
        vim.api.nvim_exec("silent FormatWrite", false)
        vim.api.nvim_command "silent wall"
      end,
      "buffers",
      opts = { nowait = true, silent = true },
    },
    ["<leader>p"] = { git_auto_push, "git auto push", opts = { nowait = true } },
    ["<leader>u"] = { "<cmd>Telescope lsp_references<cr>", "lsp usages", opts = { nowait = true, silent = true } },
    ["<leader>e"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "lsp rename", opts = { nowait = true, silent = true } },
    -- ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    -- ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    -- ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    -- ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<leader>k"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<leader>b"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "Blame line",
    },
    ["<leader>fs"] = {
      "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      "search",
      opts = { nowait = true, silent = true },
    },
    ["<Esc>"] = { "<cmd> noh | cclose <CR>", "Clear highlights" },
  },

  v = {
    [">"] = { ">gv", "indent" },
    ["<leader>y"] = { '"+y', "copy to system clubboard", opts = { nowait = true } },
  },
}

return M
