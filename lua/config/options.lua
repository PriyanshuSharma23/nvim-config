vim.opt.nu = true
vim.opt.rnu = true

vim.opt.clipboard = 'unnamedplus'
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 8

-- kicking out telescope prolly
vim.opt.path:append '**'
vim.opt.wildmenu = true

-- setup undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath 'cache' .. '/undo'

-- setup hlsearch
vim.opt.hlsearch = true

-- setup ignorecase
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Nicer display for hover
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
