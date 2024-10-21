return {
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        config = function ()
            require('trouble').setup({})

            -- remaps for trouble.nvim
            Map('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics (Trouble)' })
            Map('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = 'Buffer Diagnostics (Trouble)' })
            Map('n', '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', { desc = 'Symbols (Trouble)' })
            Map('n', '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', { desc = 'LSP Definitions / references / ... (Trouble)' })
            Map('n', '<leader>xL', '<cmd>Trouble loclist toggle<cr>', { desc = 'Location List (Trouble)' })
            Map('n', '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', { desc = 'Quickfix List (Trouble)' })
        end,
        keys = {
            '<leader>xx',
            '<leader>xX',
            '<leader>cs',
            '<leader>cl',
            '<leader>xL',
            '<leader>xQ',
        }
    },
}
