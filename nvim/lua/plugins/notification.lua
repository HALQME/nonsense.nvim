return {
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        opts = {
            lsp = {
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    ['cmp.entry.get_documentation'] = true,
                },
            },
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
            },
            messages = {
                enabled = true, -- enables the Noice messages UI
                view = 'popup', -- default view for messages
                view_error = 'popup', -- view for errors
                view_warn = 'notify', -- view for warnings
                view_history = 'messages', -- view for :messages
                view_search = 'notify', -- view for search count messages. Set to `false` to disable
            },
        },
    },
    {
        'rcarriga/nvim-notify',
        event = "VeryLazy",
        config = function()
            require("notify").setup({
                background_color = "#000000",
            })
        end,
    }
}
