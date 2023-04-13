require("lsp-format").setup {}
require("lspconfig").gopls.setup { on_attach = require("lsp-format").on_attach }
require("lspconfig").astro.setup{
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  init_options = {
    configuration = {},
    typescript = {
      serverPath = {}
    }
  }
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
