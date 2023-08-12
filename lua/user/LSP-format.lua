local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("lsp-format").setup({})

lspconfig.emmet_ls.setup({
  -- on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "svelte",
    "pug",
    "typescriptreact",
    "vue",
  },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  },
})

lspconfig.astro.setup({
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  init_options = {
    config = {
      semi = false,
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
lspconfig.lua_ls.setup({
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

-- lspconfig for python
lspconfig.pylsp.setup({
  cmd = { "pylsp" },
  settings = {
    pylsp = {
      configurationSources = { "flake8" },
      plugins = {
        pycodestyle = { enabled = false },
        flake8 = { enabled = true },
        pyflakes = { enabled = false },
        pylint = { enabled = false },
        yapf = { enabled = false },
        isort = { enabled = false },
        pylsp_mypy = { enabled = false },
      },
    },
  },
})

-- lspconfig for javascript
lspconfig.tsserver.setup({
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,
  root_dir = function()
    return vim.loop.cwd()
  end,
  settings = { documentFormatting = false },
})

-- lspconfig for c
lspconfig.clangd.setup({
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = function()
    return vim.loop.cwd()
  end,
})

-- lspconfig for bash
lspconfig.bashls.setup({
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "zsh" },
  root_dir = function()
    return vim.loop.cwd()
  end,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
