-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        {
            "catppuccin/nvim",
            name = "catppuccin",
            priority = 1000,
            config = function()
                require("catppuccin").setup({})
                vim.cmd.colorscheme 'catppuccin'
            end
        },
        {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        {'neovim/nvim-lspconfig'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/nvim-cmp'},
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.8',
            dependencies = { 'nvim-lua/plenary.nvim' },
            config = function ()
            end
        },
        {
            "supermaven-inc/supermaven-nvim",
            config = function()
                require("supermaven-nvim").setup({
                    keymaps = {
                        accept_suggestion = "<Tab>",
                        clear_suggestion = "<C-]>",
                        accept_word = "<C-j>",
                    },
                })
            end,
        },

        {
            "nvim-tree/nvim-tree.lua",
            config = function()
                require("nvim-tree").setup({
                    sort = {
                        sorter = "case_sensitive",
                    },
                    view = {
                        width = 30,
                    },
                    renderer = {
                        group_empty = true,
                    },
                    filters = {
                        dotfiles = false,
                    },
                })
            end,
        },
        {
            "nvim-tree/nvim-web-devicons"
        },
        {
            "folke/trouble.nvim",
            opts = {}, -- for default options, refer to the configuration section for custom setup.
            cmd = "Trouble",
        },
        {
            "linux-cultist/venv-selector.nvim",
            branch = "regexp", -- Use this branch for the new version
            cmd = "VenvSelect",
            opts = { },
        },
        {
            "lewis6991/gitsigns.nvim",
            config = function()
                require('gitsigns').setup {
                    signs = {
                        add          = { text = '┃' },
                        change       = { text = '┃' },
                        delete       = { text = '_' },
                        topdelete    = { text = '‾' },
                        changedelete = { text = '~' },
                        untracked    = { text = '┆' },
                    },
                    signs_staged = {
                        add          = { text = '┃' },
                        change       = { text = '┃' },
                        delete       = { text = '_' },
                        topdelete    = { text = '‾' },
                        changedelete = { text = '~' },
                        untracked    = { text = '┆' },
                    },
                    signs_staged_enable = true,
                    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
                    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
                    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
                    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
                    watch_gitdir = {
                        follow_files = true
                    },
                    auto_attach = true,
                    attach_to_untracked = false,
                    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                    current_line_blame_opts = {
                        virt_text = true,
                        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                        delay = 1000,
                        ignore_whitespace = false,
                        virt_text_priority = 100,
                        use_focus = true,
                    },
                    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
                    sign_priority = 6,
                    update_debounce = 100,
                    status_formatter = nil, -- Use default
                    max_file_length = 40000, -- Disable if file is longer than this (in lines)
                    preview_config = {
                        -- Options passed to nvim_open_win
                        border = 'single',
                        style = 'minimal',
                        relative = 'cursor',
                        row = 0,
                        col = 1
                    },
                    on_attach = function(bufnr)
                        local gitsigns = require('gitsigns')

                        local function map(mode, l, r, opts)
                            opts = opts or {}
                            opts.buffer = bufnr
                            vim.keymap.set(mode, l, r, opts)
                        end

                        -- Navigation
                        map('n', ']c', function()
                            if vim.wo.diff then
                                vim.cmd.normal({']c', bang = true})
                            else
                                gitsigns.nav_hunk('next')
                            end
                        end)

                        map('n', '[c', function()
                            if vim.wo.diff then
                                vim.cmd.normal({'[c', bang = true})
                            else
                                gitsigns.nav_hunk('prev')
                            end
                        end)

                        -- Actions
                        map('n', '<leader>hs', gitsigns.stage_hunk)
                        map('n', '<leader>hr', gitsigns.reset_hunk)
                        map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                        map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                        map('n', '<leader>hS', gitsigns.stage_buffer)
                        map('n', '<leader>hu', gitsigns.undo_stage_hunk)
                        map('n', '<leader>hR', gitsigns.reset_buffer)
                        map('n', '<leader>hp', gitsigns.preview_hunk)
                        map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
                        map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
                        map('n', '<leader>hd', gitsigns.diffthis)
                        map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
                        map('n', '<leader>td', gitsigns.toggle_deleted)

                        -- Text object
                        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                    end
                }
            end
        },
        {
            "kdheepak/lazygit.nvim",
            lazy = true,
            cmd = {
                "LazyGit",
                "LazyGitConfig",
                "LazyGitCurrentFile",
                "LazyGitFilter",
                "LazyGitFilterCurrentFile",
            },
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
            keys = {
                { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
            }
        },
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
            end
        }
    },
    install = { colorscheme = { "catppuccin" } },
    checker = { enabled = true },
})
