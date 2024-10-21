-- vim globals

-- remap <C-d> and <C-u> to <C-d>zz and <C-u>zz
Map('n', '<C-d>', '<C-d>zz<CR>', { desc = 'Scroll down' })
Map('n', '<C-u>', '<C-u>zz<CR>', { desc = 'Scroll up' })

-- clipboard and delete remaps
Map("x", "<leader>p", [["_dP]])
Map({ "n", "v" }, "<leader>y", [["+y]])
Map("n", "<leader>Y", [["+Y]])
Map({ "n", "v" }, "<leader>d", [["_d]])


