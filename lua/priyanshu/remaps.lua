-- vim globals
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = function (mode, shortcut, action, options)
    vim.keymap.set(mode, shortcut, action, options)
end

-- Telescope
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.git_files, { desc = 'Telescope find files' })
map('n', '<leader>fG', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- nvim.tree
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Open vim explorer' })

-- remap <C-d> and <C-u> to <C-d>zz and <C-u>zz
map('n', '<C-d>', '<C-d>zz<CR>', { desc = 'Scroll down' })
map('n', '<C-u>', '<C-u>zz<CR>', { desc = 'Scroll up' })

-- remaps for trouble.nvim
map('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics (Trouble)' })
map('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = 'Buffer Diagnostics (Trouble)' })
map('n', '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', { desc = 'Symbols (Trouble)' })
map('n', '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', { desc = 'LSP Definitions / references / ... (Trouble)' })
map('n', '<leader>xL', '<cmd>Trouble loclist toggle<cr>', { desc = 'Location List (Trouble)' })
map('n', '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', { desc = 'Quickfix List (Trouble)' })

-- clipboard and delete remaps
map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map({ "n", "v" }, "<leader>d", [["_d]])

-- lazy git
map('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })

-- bufferline remaps
map('n', '<leader>bl', '<cmd>BufferLineCloseLeft<CR>')
map('n', '<leader>br', '<cmd>BufferLineCloseRight<CR>')
map('n', '<leader>bo', '<cmd>BufferLineCloseOthers<CR>')
map('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>')
map('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>')

