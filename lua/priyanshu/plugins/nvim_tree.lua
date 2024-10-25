return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        keys = {
            "<leader>e",
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
                popup_border_style = "rounded",
                enable_git_status = true,
                enable_diagnostics = true,
                sort_case_insensitive = false,
                default_component_configs = {
                    container = {
                        enable_character_fade = true,
                    },
                    indent = {
                        indent_size = 2,
                        padding = 1, -- extra padding on left hand side
                        -- indent guides
                        with_markers = true,
                        indent_marker = "│",
                        last_indent_marker = "└",
                        highlight = "NeoTreeIndentMarker",
                        -- expander config, needed for nesting files
                        with_expanders = nil, -- if nil and file nesting is enabled, expanders will be shown
                        expander_collapsed = "",
                        expander_expanded = "",
                        expander_highlight = "NeoTreeExpander",
                    },
                    icon = {
                        folder_closed = "",
                        folder_open = "",
                        folder_empty = "",
                        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                        -- then these will never be used.
                        default = "*",
                        highlight = "NeoTreeFileIcon",
                    },
                    modified = {
                        symbol = "[+]",
                        highlight = "NeoTreeModified",
                    },
                    name = {
                        trailing_slash = false,
                        use_git_status_colors = true,
                        highlight = "NeoTreeFileName",
                    },
                    git_status = {
                        symbols = {
                            -- Change type
                            added = "✚", -- or "┃"
                            modified = "", -- or "┃"
                            deleted = "✖", -- or "┃"
                            renamed = "", -- or "┃"
                            -- Change type
                            untracked = "", -- or "┃"
                            ignored = "", -- or "┃"
                        },
                    },
                },
            })
            Map("n", "<leader>e", "<cmd>Neotree toggle=true position=right<CR>", { desc = "Open vim explorer" })
        end,
    },
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
