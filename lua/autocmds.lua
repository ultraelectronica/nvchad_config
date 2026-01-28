require "nvchad.autocmds"

-- Force true terminal-background transparency (some themes/plugins re-apply bg)
local function set_transparent()
  local groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "SignColumn",
    "FoldColumn",
    "LineNr",
    "CursorLineNr",
    "EndOfBuffer",
    "MsgArea",
  }

  for _, g in ipairs(groups) do
    pcall(vim.api.nvim_set_hl, 0, g, { bg = "none" })
  end
end

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  callback = set_transparent,
  desc = "Force transparent background",
})
