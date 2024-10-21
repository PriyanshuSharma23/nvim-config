return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function ()
            -- Telescope
            local builtin = require('telescope.builtin')
            Map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            Map('n', '<leader>fg', builtin.git_files, { desc = 'Telescope find files' })
            Map('n', '<leader>fG', builtin.live_grep, { desc = 'Telescope live grep' })
            Map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            Map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        end
    },
}
