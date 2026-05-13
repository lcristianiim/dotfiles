-- Plugin specification for lazy.nvim

return {
  -- Colorschemes
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },

  -- File explorer (NERDTree replacement)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", ":Neotree toggle<CR>", desc = "Toggle file explorer" },
    },
  },

  -- Fuzzy finder (CtrlP replacement)
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>f", ":Telescope find_files<CR>", desc = "Find files" },
      { "<leader>g", ":Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>b", ":Telescope buffers<CR>", desc = "Buffers" },
    },
  },

  -- Emmet (HTML abbreviations)
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascript", "typescript", "vue", "svelte" },
  },

  -- Syntax highlighting (polyglot replacement)
  {
    "sheerun/vim-polyglot",
    lazy = false,
  },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
  },

  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
        },
      })
    end,
  },

  -- Autopairs (auto-close brackets)
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Comment
  {
    "numToStr/Comment.nvim",
    config = true,
  },

  -- Which-key (show keybindings)
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      require("which-key").setup()
    end,
  },

  -- Treesitter (better syntax)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      pcall(function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = { "lua", "vim", "javascript", "typescript", "html", "css", "json", "markdown" },
          highlight = { enable = true },
          indent = { enable = true },
        })
      end)
    end,
  },
}