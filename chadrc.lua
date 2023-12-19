---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme = "rosepine",
  hl_override = {
    CursorLine = { bg = "#2a2e36" },
  },
  theme_toggle = { "blossom_light", "rosepine" },

  hl_add = highlights.add,
  tabufline = {
    enabled = false,
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
