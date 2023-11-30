---@type MappingsTable
local M = {}

M.general = {
  i = {
    ["zz"] = { "<C-o>zz", "zz", opts = { nowait = true, silent = true } },
    ["<c-j>"] = { "copilot#Accept('<CR>')", opts = { expr = true, silent = true, nowait = true } }
  },

  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    vim.api.nvim_set_keymap("n", "<S-Tab>", ":NvimTreeToggle<CR>", { noremap = true, silent = true }),
    ["<leader>k"] = { ":lua vim.diagnostic.open_float() <CR>", "open float diagnostic", opts = { nowait = true } },
    ["<leader>o"] = { ":Startify<cr>", "startify", opts = { nowait = true } },
    ["<C-p>"] = { "<cmd>Telescope find_files<CR>", "find files", opts = { nowait = true } },
    ["<tab>"] = { "<cmd>Telescope buffers<CR>", "buffers", opts = { nowait = true } },
    ["<space>jj"] = { "<cmd>TZAtaraxis<CR>", "buffers", opts = { nowait = true } },
    ["<space>l"] = { ":wall<cr>", "buffers", opts = { nowait = true } },
  },

  v = {
    [">"] = { ">gv", "indent" },
    ["<leader>y"] = { '"+y', "copy to system clubboard", opts = { nowait = true } },
  },
}

-- more keybinds!

return M
