local configs = require("nvim-treesitter.configs")
configs.setup {
    ensure_installed = {"bash", "bibtex", "css", "html", "javascript", "latex", "ninja", "markdown", "python", "scss", "tsx", "typescript", "json", "lua", 'astro', 'http'},
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  autopairs = {
    enable = true,
  }
}
