-- ~/.config/nvim/lua/custom/chadrc.lua
-- @module custom.chadrc
local M = {}

M.options = {
  relativenumber = true, 
  tabstop = 4,
  expandtab = true,
}

M.mappings = {
  normal_mode = {

  },
}

M.plugins = {
  user = {

  },
  default_plugin = false,
}

M.base46 = {
  theme = "onedark",
  transparency = true,
  integration = {
    "hop",
    "todo",
  },
}

return M 
