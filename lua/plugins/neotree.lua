-- ~/.config/nvim/lua/plugins/neotree.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    window = {
      position = "left",
      width = 35,
      mappings = {
        ["<space>"] = "none", -- don't override leader
        ["l"] = "open",
        ["h"] = "close_node",
        ["v"] = "open_vsplit",
        ["s"] = "open_split",
      },
    },
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,     -- show dotfiles (.env, .gitignore, etc.)
        hide_gitignored = false,
        hide_by_name = { "node_modules", ".git" },
      },
      follow_current_file = {
        enabled = true,
      },
      use_libuv_file_watcher = true,
    },
    buffers = {
      follow_current_file = { enabled = true },
    },
    git_status = {
      window = { position = "float" },
    },
    default_component_configs = {
      indent = {
        indent_size = 2,
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "󰜌",
      },
      git_status = {
        symbols = {
          added    = "✚",
          modified = "",
          deleted  = "✖",
          renamed  = "󰁕",
          untracked = "",
          ignored   = "",
          unstaged  = "󰄱",
          staged    = "",
          conflict  = "",
        },
      },
    },
  },
}
