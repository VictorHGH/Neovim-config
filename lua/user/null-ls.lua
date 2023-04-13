local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = true,
	sources = {

		--[[ formating ]]
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsz-single-quote" } }),
		formatting.stylua,
		formatting.black,

		--[[ diagnostics ]]
    diagnostics.pylint,
		diagnostics.standardjs,
	},
	on_attach = on_attach,
})
