-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup {
  sync_root_with_cwd = true,
  reload_on_bufenter = true,
  respect_buf_cwd = true,
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "v", action = "vsplit" }
      },
    },
    number = true,
    relativenumber = true,
  },
  renderer = {
    group_empty = true,
    highlight_opened_files = 'name',
    indent_markers = {
      enable = true,
    }
  },
  filters = {
    dotfiles = false,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}

-- nvim tree
local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- ["u"]              = tree_cb("dir_up"),
-- ["<CR>"]           = tree_cb("edit"),
-- ["o"]              = tree_cb("edit"),
-- ["<2-LeftMouse>"]  = tree_cb("edit"),
-- ["<2-RightMouse>"] = tree_cb("cd"),
-- ["<C-]>"]          = tree_cb("cd"),
-- ["v"]              = tree_cb("vsplit"),
-- ["<C-x>"]          = tree_cb("split"),
-- ["<C-t>"]          = tree_cb("tabnew"),
-- ["<"]              = tree_cb("prev_sibling"),
-- [">"]              = tree_cb("next_sibling"),
-- ["<BS>"]           = tree_cb("close_node"),
-- ["<S-CR>"]         = tree_cb("close_node"),
-- ["<Tab>"]          = tree_cb("preview"),
-- ["I"]              = tree_cb("toggle_ignored"),
-- ["H"]              = tree_cb("toggle_dotfiles"),
-- ["R"]              = tree_cb("refresh"),
-- ["a"]              = tree_cb("create"),
-- ["d"]              = tree_cb("remove"),
-- ["r"]              = tree_cb("rename"),
-- ["<C-r>"]          = tree_cb("full_rename"),
-- ["x"]              = tree_cb("cut"),
-- ["c"]              = tree_cb("copy"),
-- ["p"]              = tree_cb("paste"),
-- ["[c"]             = tree_cb("prev_git_item"),
-- ["]c"]             = tree_cb("next_git_item"),
-- ["-"]              = tree_cb("dir_up"),
-- ["q"]              = tree_cb("close"),
-- ["s"]              = open_file
