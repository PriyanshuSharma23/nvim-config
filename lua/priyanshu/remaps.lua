-- vim globals
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fG', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- nvim.tree
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Open vim explorer' })

-- remap <C-d> and <C-u> to <C-d>zz and <C-u>zz
vim.keymap.set('n', '<C-d>', '<C-d>zz<CR>', { desc = 'Scroll down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz<CR>', { desc = 'Scroll up' })

-- remaps for trouble.nvim
vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics (Trouble)' })
vim.keymap.set('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
    { desc = 'Buffer Diagnostics (Trouble)' })
vim.keymap.set('n', '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', { desc = 'Symbols (Trouble)' })
vim.keymap.set('n', '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
    { desc = 'LSP Definitions / references / ... (Trouble)' })
vim.keymap.set('n', '<leader>xL', '<cmd>Trouble loclist toggle<cr>', { desc = 'Location List (Trouble)' })
vim.keymap.set('n', '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', { desc = 'Quickfix List (Trouble)' })

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- lazy git
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })

-- bufferline remaps
vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCloseLeft<CR>')
vim.keymap.set('n', '<leader>br', '<cmd>BufferLineCloseRight<CR>')
vim.keymap.set('n', '<leader>bo', '<cmd>BufferLineCloseOthers<CR>')
vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>')
