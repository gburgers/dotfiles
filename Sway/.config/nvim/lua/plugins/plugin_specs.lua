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

  -- Add formatters to conform.nvim
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        templ = { "templ" }, -- use Templ's own formatter

        -- Conform can also run multiple formatters sequentially
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        go = { "goimports", "gofumpt" },
        shell = { "shellcheck" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        -- You can use 'stop_after_first' to run the first available formatter from the list
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_fallback = true,
        },
      },
      formatters = {
        templ = {
          command = "templ",
          args = { "fmt", "-" },
          stdin = true,
        },
      },
    },
  },

  -- add servers to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- servers will be automatically installed with mason and loaded with lspconfig
        clangd = {},
        bashls = {},
        gopls = {},
        pyright = {},
        rust_analyzer = {},
        cssls = {},
        html = {},
        dockerls = {},
        docker_compose_language_service = {},
        jsonls = {},
        marksman = {},
        sqlls = {},
        tailwindcss = {
          filetypes = { "templ", "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact" },
          init_options = {
            userLanguages = {
              templ = "html", -- treat .templ files like HTML
            },
          },
        },
        zls = {},
        yamlls = {},
      },
    },
  },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "goimports",
        "gofumpt",
        "shfmt",
        "stylua",
        "shellcheck",
        "isort",
        "black",
        "prettierd",
        "prettier",
      },
    },
  },
}
