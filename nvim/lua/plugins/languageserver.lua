return {
    -- LSPの設定
    {
        'neovim/nvim-lspconfig',
        lazy = true,
        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- LSPサーバーを設定
            lspconfig.pyright.setup{
                capabilities = capabilities,
            }
            lspconfig.tsserver.setup{
                capabilities = capabilities,
            }
            lspconfig.sourcekit.setup{
                capabilities = capabilities,
            }
        end,
    },
    {
        'prabirshrestha/vim-lsp',
        event = {'BufReadPre', 'BufNewFile'},
        keys = {
          {"<leader>dh", "<CMD>LspHover<CR>"}
        },
        config = function()
            -- vim-lspの設定はVimScriptで行うことが多いですが、ここで必要な設定を行います。
            vim.cmd([[
                " 各言語サーバーの設定
                let g:lsp_settings = {
                    \ 'tsserver': {'cmd': ['typescript-language-server', '--stdio']},
                    \ 'lua_ls': {'cmd': ['lua-language-server']}
                \ }
            ]])
        end,
    },
    {
        'mattn/vim-lsp-settings',
        event = {'BufReadPre', 'BufNewFile'},
    }
}
