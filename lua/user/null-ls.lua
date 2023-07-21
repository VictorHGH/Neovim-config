local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- format on save for all filetypes
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

null_ls.setup({
  debug = true,
  sources = {

    --[[ formating ]]
    formatting.standardjs,
    formatting.stylua,
    formatting.black.with({
      extra_args = { "--line-length", "79" },
    }),
    formatting.prettier,

    --[[ diagnostics ]]
    diagnostics.flake8,
    diagnostics.standardjs,
    diagnostics.tidy,
  },
})
