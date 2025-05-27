return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local builtin = require 'telescope.builtin'
    require('telescope').setup {
      pickers = {
        find_files = {
          theme = 'ivy',
        },
        live_grep = {
          theme = 'ivy',
        },
      },
    }

    -- Existing keymaps
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>ft', builtin.quickfix, { desc = 'Telescope quickfix' })

    -- New Git-related keymaps
    vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git status' })
    vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git commits' })
    vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Git branches' })

    -- Diagnostics picker
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Diagnostics' })

    -- Resume last picker
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Resume last picker' })

    -- Commands picker
    vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Commands' })
  end,
}
