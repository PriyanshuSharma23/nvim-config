return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',

    version = '*',

    opts = {
      keymap = {
        preset = 'enter',
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      completion = {
        menu = {
          auto_show = function(ctx)
            return ctx.mode ~= 'cmdline'
          end,
        },
      },
    },
    opts_extend = { 'sources.default' },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local util = require 'lspconfig.util'

      require('lspconfig')['lua_ls'].setup {
        capabilities = capabilities,
      }

      require('lspconfig')['vtsls'].setup {
        capabilities = capabilities,
      }

      require('lspconfig')['tailwindcss'].setup {
        capabilities = capabilities,
      }

      require('lspconfig')['pyright'].setup {
        capabilities = capabilities,
      }

      require('lspconfig')['gopls'].setup {
        capabilities = capabilities,
        file_types = { 'go', 'gomod', 'gowork', 'gotmpl' },
        root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
              unusedwrite = true,
              unreachable = true,
              nilness = true,
              shadow = true,
              buildtag = true,
              nilcheck = true,
              printf = true,
              export = true,
            },
            staticcheck = true,
          },
        },
      }

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
          map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
          map('<leader>cr', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
          map('<leader>cd', vim.diagnostic.open_float, '[C]ode [D]ebug', { 'n', 'x' })
          map('<leader>ct', vim.diagnostic.setqflist, '[C]ode [D]ebug', { 'n', 'x' })

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })
    end,
  },
  {
    'stevearc/conform.nvim',
    config = function()
      local conform = require 'conform'
      conform.setup {
        formatters_by_ft = {
          lua = { 'stylua' },
          python = { 'black', 'isort' },
          rust = { 'rustfmt', lsp_format = 'fallback' },
          javascript = { 'prettierd', 'prettier', stop_after_first = true },
          typescript = { 'prettierd', 'prettier', stop_after_first = true },
          javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
          typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
          go = { 'gofmt' },
        },
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 1000,
          lsp_format = 'fallback',
        },
      }
    end,
  },
  {
    'folke/ts-comments.nvim',
    opts = {},
    event = 'VeryLazy',
    config = function()
      require('ts-comments').setup {
        lang = {
          astro = '<!-- %s -->',
          axaml = '<!-- %s -->',
          blueprint = '// %s',
          c = '// %s',
          c_sharp = '// %s',
          clojure = { ';; %s', '; %s' },
          cpp = '// %s',
          cs_project = '<!-- %s -->',
          cue = '// %s',
          fsharp = '// %s',
          fsharp_project = '<!-- %s -->',
          gleam = '// %s',
          glimmer = '{{! %s }}',
          graphql = '# %s',
          handlebars = '{{! %s }}',
          hcl = '# %s',
          html = '<!-- %s -->',
          hyprlang = '# %s',
          ini = '; %s',
          ipynb = '# %s',
          javascript = {
            '// %s', -- default commentstring when no treesitter node matches
            '/* %s */',
            call_expression = '// %s', -- specific commentstring for call_expression
            jsx_attribute = '// %s',
            jsx_element = '{/* %s */}',
            jsx_fragment = '{/* %s */}',
            spread_element = '// %s',
            statement_block = '// %s',
          },
          kdl = '// %s',
          php = '// %s',
          rego = '# %s',
          rescript = '// %s',
          rust = { '// %s', '/* %s */' },
          sql = '-- %s',
          styled = '/* %s */',
          svelte = '<!-- %s -->',
          templ = {
            '// %s',
            component_block = '<!-- %s -->',
          },
          terraform = '# %s',
          tsx = {
            '// %s', -- default commentstring when no treesitter node matches
            '/* %s */',
            call_expression = '// %s', -- specific commentstring for call_expression
            jsx_attribute = '// %s',
            jsx_element = '{/* %s */}',
            jsx_fragment = '{/* %s */}',
            spread_element = '// %s',
            statement_block = '// %s',
          },
          twig = '{# %s #}',
          typescript = { '// %s', '/* %s */' }, -- langs can have multiple commentstrings
          vue = '<!-- %s -->',
          xaml = '<!-- %s -->',
        },
      }
    end,
  },
}
