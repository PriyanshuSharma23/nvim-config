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
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>ft', builtin.quickfix, { desc = 'Telescope help tags' })
  end,
}
