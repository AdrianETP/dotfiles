local lsp = require('lsp-zero').preset({})
local cmp = require("cmp")

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({buffer = bufnr})
	vim.keymap.set("n","gr",":Telescope lsp_references<CR>")
	vim.keymap.set("n" , "<leader>lf",function ()
		vim.lsp.buf.format()
	end)
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

cmp.setup({
  mapping = {
 ['<CR>'] = cmp.mapping.confirm({ select = true }), }
})

lsp.setup()
