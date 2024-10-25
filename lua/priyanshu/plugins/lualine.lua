return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    section_separators = { "", "" },
                    component_separators = { "", "" },
                    theme = "auto",
                    icons_enabled = true,
                    -- Component config
                    component = {
                        -- Lsp server name .
                        { " lsp_server_name", padding = 1 },
                        -- Lsp progress .
                        { " %p%% ", padding = 1 },
                        { lsp_progress, color = { fg = "#ffffff", gui = "bold" } },
                        -- Git branch
                        { " branch", padding = 1 },
                        { branch, color = { fg = "#ffffff", gui = "bold" } },
                        -- Git diff
                        { " diff", padding = 1 },
                        { diff, color = { fg = "#ffffff", gui = "bold" } },
                        -- Diagnostics
                        { " diag", padding = 1 },
                        {
                            " %d ",
                            color = { fg = "#ffffff", gui = "bold" },
                            padding = 1,
                        },
                        { " %d ", color = { fg = "#ffffff", gui = "bold" } },
                        { " %d ", color = { fg = "#ffffff", gui = "bold" } },
                        { " %d ", color = { fg = "#ffffff", gui = "bold" } },
                        -- File size
                        { " file_size", padding = 1 },
                        { file_size, color = { fg = "#ffffff", gui = "bold" } },
                        -- File encoding
                        { " file_encoding", padding = 1 },
                        { file_encoding, color = { fg = "#ffffff", gui = "bold" } },
                        -- File type
                        { " file_type", padding = 1 },
                        { file_type, color = { fg = "#ffffff", gui = "bold" } },
                        -- File format
                        { " file_format", padding = 1 },
                        { file_format, color = { fg = "#ffffff", gui = "bold" } },
                        -- Full path
                        { " full_path", padding = 1 },
                        { full_path, color = { fg = "#ffffff", gui = "bold" } },
                    },
                    inactive_sections = {
                        { lsp_client_names, color = { fg = "#ffffff", gui = "bold" } },
                        { lsp_progress,     color = { fg = "#ffffff", gui = "bold" } },
                        { branch,           color = { fg = "#ffffff", gui = "bold" } },
                        { diff,             color = { fg = "#ffffff", gui = "bold" } },
                        { diagnostics,      color = { fg = "#ffffff", gui = "bold" } },
                        { file_size,        color = { fg = "#ffffff", gui = "bold" } },
                        { file_encoding,    color = { fg = "#ffffff", gui = "bold" } },
                        { file_type,        color = { fg = "#ffffff", gui = "bold" } },
                        { file_format,      color = { fg = "#ffffff", gui = "bold" } },
                        { full_path,        color = { fg = "#ffffff", gui = "bold" } },
                    },
                },
            })
        end,
    },
}
