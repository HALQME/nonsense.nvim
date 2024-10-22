return {
    {
        'nvim-telescope/telescope.nvim',
        event = "VeryLazy",
        keys = {
            {"<leader>tss", "Telescope"},
            {'<leader>tsc', 'Telescope commands'}
        }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        event = "VeryLazy",
    }
}
