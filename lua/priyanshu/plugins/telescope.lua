return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { '<leader>ff', function () require('telescope.builtin').find_files() end, desc = 'Telescope find files' },
            { '<leader>fg', function () require('telescope.builtin').git_files() end, desc = 'Telescope find files' },
            { '<leader>fG', function () require('telescope.builtin').live_grep() end, desc = 'Telescope live grep' },
            { '<leader>/', function () require('telescope.builtin').live_grep() end, desc = 'Telescope live grep' },
            { '<leader>fb', function () require('telescope.builtin').buffers() end, desc = 'Telescope buffers' },
            { '<leader>fh', function () require('telescope.builtin').help_tags() end, desc = 'Telescope help tags' },
            { '<leader>sR', function () require('telescope.builtin').resume() end, desc = 'Telescope resume' },
        },
        config = function ()
            -- Telescope
            -- local builtin = require('telescope.builtin')
            -- Map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            -- Map('n', '<leader>fg', builtin.git_files, { desc = 'Telescope find files' })
            -- Map('n', '<leader>fG', builtin.live_grep, { desc = 'Telescope live grep' })
            -- Map('n', '<leader>/', builtin.live_grep, { desc = 'Telescope live grep' })
            -- Map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            -- Map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
            -- Map('n', '<leader>sR', "<cmd>Telescope resume<cr>", { desc = 'Telescope resume' })
        end
    },
}
