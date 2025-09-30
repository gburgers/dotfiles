return {
  -- add colorscheme
  { "catppuccin/nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "dockerfile",
        "json",
        "html",
        "http",
        "go",
        "javascript",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "query",
        "sql",
        "templ",
        "toml",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "zig",
      },
      highlight = {
        enable = true, -- Enable highlighting for the installed languages
      },
    },
  },


}
