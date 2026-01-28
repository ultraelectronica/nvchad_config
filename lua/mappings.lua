require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- VSCode-ish keybind layer ---------------------------------------------------

-- Save (VSCode: Ctrl+S)
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })

-- Quick Open (VSCode: Ctrl+P) + Command Palette-ish (Ctrl+Shift+P)
do
  local ok, telescope = pcall(require, "telescope.builtin")
  if ok then
    map("n", "<C-p>", telescope.find_files, { desc = "Find files" })
    map("n", "<C-S-p>", telescope.commands, { desc = "Command palette" })

    -- Find in file (VSCode: Ctrl+F) / Find in workspace (VSCode: Ctrl+Shift+F)
    map("n", "<C-f>", telescope.current_buffer_fuzzy_find, { desc = "Find in file" })
    map("n", "<C-S-f>", telescope.live_grep, { desc = "Find in workspace" })
  end
end

-- Comment toggle (VSCode: Ctrl+/)
-- Uses Comment.nvim (shipped by NvChad) which provides `gcc`/`gc`.
map("n", "<C-/>", "gcc", { remap = true, desc = "Toggle comment" })
map("v", "<C-/>", "gc", { remap = true, desc = "Toggle comment (selection)" })

-- Move line/selection up/down (VSCode: Alt+Up/Down)
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
map("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })

-- Typing ergonomics ---------------------------------------------------------
-- Note: terminal emulators differ in what they send for Ctrl+Backspace

-- Ctrl+Backspace: delete previous word (insert)
map("i", "<C-BS>", "<C-w>", { desc = "Delete previous word" })
map("i", "<C-h>", "<C-w>", { desc = "Delete previous word (fallback)" })

-- Ctrl+Shift+Arrow: select by word (normal/insert/visual)
map("n", "<C-S-Left>", "vB", { desc = "Select previous word" })
map("n", "<C-S-Right>", "vW", { desc = "Select next word" })
map("i", "<C-S-Left>", "<esc>vB", { desc = "Select previous word" })
map("i", "<C-S-Right>", "<esc>vW", { desc = "Select next word" })
map("v", "<C-S-Left>", "<esc>vB", { desc = "Expand selection left by word" })
map("v", "<C-S-Right>", "<esc>vW", { desc = "Expand selection right by word" })

-- Backspace in visual deletes selection (closer to GUI editor feel)
map("v", "<BS>", "d", { desc = "Delete selection" })

-- Undo / Redo (VSCode: Ctrl+Z / Ctrl+Y) -------------------------------------
map({ "n", "v" }, "<C-z>", "u", { desc = "Undo" })
map("i", "<C-z>", "<C-o>u", { desc = "Undo" })

map({ "n", "v" }, "<C-y>", "<C-r>", { desc = "Redo" })
map("i", "<C-y>", "<C-o><C-r>", { desc = "Redo" })

-- Tabs / buffers (VSCode-like) ----------------------------------------------
-- New tab (Ctrl+T) -> new empty buffer
map({ "n", "i" }, "<C-t>", "<cmd>enew<cr>", { desc = "New buffer (tab)" })

-- Close tab (Ctrl+W) -> close current buffer
-- NOTE: This overrides Vim's default window-prefix <C-w>.
map("n", "<C-w>", "<cmd>bd<cr>", { desc = "Close buffer (tab)" })

-- Change tab (Ctrl+PgUp / Ctrl+PgDn) -> previous / next buffer
map("n", "<C-PageUp>", "<cmd>bprevious<cr>", { desc = "Previous buffer (tab)" })
map("n", "<C-PageDown>", "<cmd>bnext<cr>", { desc = "Next buffer (tab)" })
