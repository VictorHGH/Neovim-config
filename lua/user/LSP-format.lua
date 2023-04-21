require("lsp-format").setup({})

require("lspconfig").astro.setup({
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  init_options = {
    config = {
      format = {
        enable = true,
      },
    },
    configuration = {},
    typescript = {
      serverPath = {},
    },
  },
})

-- lspconfig for lua
require("lspconfig").lua_ls.setup({
  cmd = { "lua-language-server" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
    },
  },
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
