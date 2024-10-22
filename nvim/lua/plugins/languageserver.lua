return {
    {
        'mattn/vim-lsp-settings',
        lazy = true,
        cmd = {
            'LspManageServers',
            'LspInstallServer',
        },
        keys = {
            {'<leader>L', ':LspManageServers<CR>'}
        }
    },
    {
        'prabirshrestha/vim-lsp',
        lazy = true,
        cmd = {
            'LspCodeAction',
            'LspCodeLens',
            'LspDeclaration',
            'LspDefinition',
            'LspDocumentDiagnostics',
            'LspDocumentFormat',
            'LspHover',
            'LspNextDiagnostic',
            'LspNextError',
            'LspPreviousDiagnostic',
            'LspPreviousError',
            'LspStatus',
            'LspManageServers',
            'LspInstallServer',
        }
    },
    {
        'rust-lang/rust.vim',
        lazy = true,
        ft = {'rust'},
    }
}
