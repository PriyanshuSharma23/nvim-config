return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function ()
            require('bufferline').setup {
                options = {
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            highlight = "Directory",
                            separator = true -- use a "true" to enable the default, or set your own character
                        },
                    },
                }
            }

            -- bufferline remaps
            Map('n', '<leader>bl', '<cmd>BufferLineCloseLeft<CR>')
            Map('n', '<leader>br', '<cmd>BufferLineCloseRight<CR>')
            Map('n', '<leader>bo', '<cmd>BufferLineCloseOthers<CR>')
            Map('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>')
            Map('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>')
        end
    }
}

