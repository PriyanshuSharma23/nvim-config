return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim"
        },
        keys = {
            '<leader>e',
        },
        config = function ()
            require('neo-tree').setup({})
            Map('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'Open vim explorer' })
        end
    }
    -- {
    --     "nvim-tree/nvim-tree.lua",
    --     config = function()
    --         require("nvim-tree").setup({
    --             sort = {
    --                 sorter = "case_sensitive",
    --             },
    --             view = {
    --                 width = 30,
    --             },
    --             renderer = {
    --                 group_empty = true,
    --             },
    --             filters = {
    --                 dotfiles = false,
    --             },
    --         })
    --
    --         -- nvim.tree
    --         Map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Open vim explorer' })
    --     end,
    -- },
    -- {
    --     "nvim-tree/nvim-web-devicons"
    -- },
}
