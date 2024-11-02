return {
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'path' },
                }),
            })
        end,
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        event = 'InsertEnter',
    },
    {
        'hrsh7th/cmp-buffer',
        event = 'InsertEnter',
    },
    {
        'hrsh7th/cmp-path',
        event = 'InsertEnter',
    },
    {
        'f3fora/cmp-spell',
        event = 'InsertEnter',
    },
    {
        'hrsh7th/cmp-cmdline',
        event = 'InsertEnter',
    },
    {
        'onsails/lspkind-nvim',
        event = 'InsertEnter',
        config = function()
            require('lspkind').init({
                mode = 'symbol_text',
                preset = 'default',
            })
        end,
    }
}
