---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  -- theme = "chadtain",
  theme = "aquarium",
  hl_override = {
    CursorLine = { bg = "#2a2e36" },
  },
  theme_toggle = { "blossom_light", "aquarium" },

  -- hl_override = highlights.override,
  hl_add = highlights.add,
  tabufline = {
    enabled = false,
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
