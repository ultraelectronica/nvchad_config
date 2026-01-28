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
