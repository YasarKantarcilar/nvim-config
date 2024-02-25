require("config.lazy")

vim.api.nvim_set_keymap(
  "n",
  "<Leader>har",
  [[:lua require('harpoon.ui').toggle_quick_menu()<CR>]],
  { noremap = true, silent = true }
)

-- Add current file to Harpoon bookmarks
vim.api.nvim_set_keymap(
  "n",
  "<Leader>haa",
  [[:lua require("harpoon.mark").add_file()<CR>]],
  { noremap = true, silent = true }
)

-- Remove Harpoon marks
vim.api.nvim_set_keymap("n", "<Leader>had", [[:HarpoonRm<Space>]], { noremap = true, silent = true })
