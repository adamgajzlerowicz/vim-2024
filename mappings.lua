---@type MappingsTable
local M = {}

local function git_auto_push()
  vim.cmd ":wa"
  -- local message = vim.fn.input "Commit message: "
  vim.cmd "!git add ."
  -- vim.cmd("!git commit -m " .. vim.fn.shellescape(message))
  vim.cmd "!git commit -m ..."
  vim.cmd "!git push"
end

M.general = {
  i = {
    ["zz"] = { "<C-o>zz", "zz", opts = { nowait = true, silent = true } },
  },

  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    vim.api.nvim_set_keymap("n", "<S-Tab>", ":NvimTreeToggle<CR>", { noremap = true, silent = true }),
    ["<leader>k"] = { ":lua vim.diagnostic.open_float() <CR>", "open float diagnostic", opts = { nowait = true } },
    ["<leader>o"] = { ":Startify<cr>", "startify", opts = { nowait = true } },
    ["<leader>t"] = { ': lua require("nvterm.terminal").toggle "float" <cr>', "terminal", opts = { nowait = true } },
    ["<C-p>"] = { "<cmd>Telescope find_files<CR>", "find files", opts = { nowait = true } },
    ["<tab>"] = { "<cmd>Telescope buffers<CR>", "buffers", opts = { nowait = true } },
    ["<space>jj"] = { "<cmd>TZAtaraxis<CR>", "buffers", opts = { nowait = true } },
    ["<space>l"] = { ":wall<cr>", "buffers", opts = { nowait = true } },
    ["<leader>p"] = { git_auto_push, "git auto push", opts = { nowait = true } },
    ["<leader>u"] = { "<cmd>Telescope lsp_references<cr>", "lsp usages", opts = { nowait = true, silent = true } },
    -- ["<leader>r"] = { "<cmd>Telescope lsp_references", "lsp usages", opts = { nowait = true, silent = true } },
  },

  v = {
    [">"] = { ">gv", "indent" },
    ["<leader>y"] = { '"+y', "copy to system clubboard", opts = { nowait = true } },
  },
}

return M
