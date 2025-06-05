-- Native completion settings
-- Set completeopt for better completion experience
overlay = vim.opt
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }

-- Enable LSP-based omnifunc for supported filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"lua",
		"swift",
		"rust",
		"haskell",
		"typescript",
		"javascript",
		"typescriptreact",
		"javascriptreact",
		"deno",
		"css",
		"html",
		"astro",
		"svelte",
		"go",
		"python",
	},
	callback = function()
		vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
	end,
})

-- Key mappings for insert-mode completion
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- <C-x><C-o> for omnifunc completion
map("i", "<C-O>", "<C-x><C-o>", opts)
-- Enhance navigation in popup menu if desired
map("i", "<C-n>", 'pumvisible() ? "<C-n>" : "<Down>"', { expr = true, silent = true })
map("i", "<C-p>", 'pumvisible() ? "<C-p>" : "<Up>"', { expr = true, silent = true })
