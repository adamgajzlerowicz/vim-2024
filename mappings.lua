---@type MappingsTable
local M = {}

M.general = {
  i = {},

  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    vim.api.nvim_set_keymap("n", "<S-Tab>", ":NvimTreeToggle<CR>", { noremap = true, silent = true }),
    ["<leader>k"] = { ":lua vim.diagnostic.open_float() <CR>", "open float diagnostic", opts = { nowait = true } },
    ["<leader>o"] = { ":Startify<cr>", "startify", opts = { nowait = true } },
  },

  v = {
    [">"] = { ">gv", "indent" },
    ["<leader>y"] = { '"+y', "copy to system clubboard", opts = { nowait = true } },
  },
}

-- more keybinds!

return M
