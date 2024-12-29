-- Quickfix list
vim.keymap.set('n', 'tt', '<cmd>copen<CR>')
vim.keymap.set('n', 'tn', '<cmd>cnext<CR>')
vim.keymap.set('n', 'tp', '<cmd>cprev<CR>')
vim.keymap.set('n', 'tq', '<cmd>cclose<CR>')

-- clear highlights
vim.keymap.set('n', '<Esc><Esc>', '<cmd>noh<CR>')

-- terminal
vim.keymap.set('n', '<leader>tt', function()
  vim.cmd.new()
  vim.cmd.wincmd 'J'
  vim.api.nvim_win_set_height(0, 15)
  vim.cmd.terminal()
  vim.cmd.start()
end)
