return {
  {'ldelossa/litee.nvim', event = "VeryLazy"},

  --color scheme
  {'rebelot/kanagawa.nvim', event = "VeryLazy"},
  {'AlexvZyl/nordic.nvim', event = "VeryLazy"},
  --add one dark theme
  { 'navarasu/onedark.nvim', event = "VeryLazy"},
  { 'gruvbox-community/gruvbox', event = "VeryLazy"},
  -- 'joshdick/onedark.vim',
  {
    "ldelossa/gh.nvim",
    event = "VeryLazy",
    dependencies = { "ldelossa/litee.nvim"},
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    event = "VeryLazy",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
      require("todo-comments").setup {
        vim.keymap.set("n", "<leader>lt", ":TroubleToggle<CR>", { noremap = true, silent = true })
      }
    end
  }, --nice diagnostic errors
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        vim.keymap.set("n", "<leader>tt", ":TodoTrouble<CR>", { noremap = true, silent = true })
      }
    end
  },
  --rust
  {'neovim/nvim-lspconfig', event = "VeryLazy"},
  {'simrat39/rust-tools.nvim', event = "VeryLazy"},
  -- 'puremourning/vimspector', --debugging in vim
  { "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
  -- 'simrat39/symbols-outline.nvim',
  {'goolord/alpha-nvim', event = "VeryLazy"}, --does not work!?

  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    tag = "0.1.0",
    -- or                            , branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {'christoomey/vim-system-copy', event = "VeryLazy"},
  --'valloric/youcompleteme',
  {'tpope/vim-surround', event = "VeryLazy"}, -- Surrounding ys',

  --Text Objects:
  --Utilities for user-defined text objects
  {'kana/vim-textobj-user', event = "VeryLazy"},
  --Text objects for indentation levels
  -- 'kana/vim-textobj-indent',
  --Text objects for Python
  {'bps/vim-textobj-python', event = "VeryLazy"},
  --preview CSS colors inline
  -- 'ap/vim-css-color',
  {'norcalli/nvim-colorizer.lua', event = "VeryLazy"},
  -- comment healper

  -- 'preservim/nerdcommenter',
  {'tpope/vim-commentary', event = "VeryLazy"},

  {
    'nvim-treesitter/nvim-treesitter',
    event = "VeryLazy",
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects' ,
      'nvim-treesitter/nvim-treesitter-context',  -- sticky functions
    }
  },

  -- 'psf/black',
  -- {'psf/black', lazy = true},
  {'psf/black', event = "VeryLazy"},

  {'tpope/vim-fugitive', event = "VeryLazy"},
  {'tpope/vim-rhubarb', event = "VeryLazy"},

  {'kdheepak/lazygit.nvim', event = "VeryLazy"},
  {'sindrets/diffview.nvim', event = "VeryLazy"}, --nvim gitdi',
  {'mhinz/vim-signify', event = "VeryLazy"}, --highlighing changes not commited to last comm',
  {'APZelos/blamer.nvim', event = "VeryLazy"}, --gitlens blame sty',
  -- -- telescope requirements...
  -- 'nvim-lua/popup.nvim',
  {'nvim-lua/plenary.nvim', event = "VeryLazy"},
  {'ThePrimeagen/harpoon', event = "VeryLazy"},
  {'jose-elias-alvarez/null-ls.nvim', event = "VeryLazy"},
  -- 'nvim-telescope/telescope.nvim',
  -- 'nvim-telescope/telescope-fzy-native.nvim',
  --terminal
  {'voldikss/vim-floaterm', event = "VeryLazy"},

  -- search
  { "junegunn/fzf", build = ":call fzf#install()", event = "VeryLazy"},
  { 'junegunn/fzf.vim', event = "VeryLazy"},

  --File Navigation
  {'nvim-lualine/lualine.nvim', event = "VeryLazy"},
  {'christoomey/vim-tmux-navigator', event = "VeryLazy"},

  -- 'akinsho/bufferline.nvim', { 'tag': 'v2.*', }
  {'kevinhwang91/rnvimr', event = "VeryLazy"},
  --nerdtree in lua
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
  },
  {'lukas-reineke/indent-blankline.nvim', event = "VeryLazy"},
  {'mbbill/undotree', event = "VeryLazy"},

  -- prettier
  {'sbdchd/neoformat', event = "VeryLazy"},

  --support for go to defintion and autocompletion
  --'davidhalter/jedi-vim',
  -- 'neoclide/coc.nvim', {'branch': 'release',}
  -- "jmcantrell/vim-virtualenv", --very slow: check if still needed?
      {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 300
          require("which-key").setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            triggers_blacklist = {
              n = { "s" },
              v = { "s" },
            },
          })
        end,
      },
      {'github/copilot.vim', event = "VeryLazy"},
      --Markdown (or any Outline)
      {'simrat39/symbols-outline.nvim', event = "VeryLazy"},
      {'stevearc/aerial.nvim', event = "VeryLazy"},
      {
        "folke/zen-mode.nvim",
        event = "VeryLazy",
        config = function()
          require("zen-mode").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
          }
        end
      },
      -- install without yarn or npm
      {
        "iamcco/markdown-preview.nvim",
        event = "VeryLazy",
        build = function() vim.fn["mkdp#util#install"]() end,
      },

      -- use({ "iamcco/markdown-preview.nvim", build = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
      ----Obsidian
      -- (optional) recommended for syntax highlighting, folding, etc if you're not using nvim-treesitter:
      {'preservim/vim-markdown', event = "VeryLazy"},
      {'godlygeek/tabular', event = "VeryLazy"}, -- needed by 'preservim/vim-markdown'
      {'epwalsh/obsidian.nvim', event = "VeryLazy"}, --using neovim with the Obsidian vau'
      -- 'vimwiki/vimwiki',

      -- connect with Obsidian Second Brain
      -- vim.opt.nocompatible = true --Recommende for VimWiki
      --{
        --	"vimwiki/vimwiki"
        --	-- config = function()
          --	-- 	vim.g.vimwiki_list = {
            --	-- 		{
              --	-- 			path = "~/Simon/Sync/SecondBrain",
              --	-- 			syntax = "markdown",
              --	-- 			ext = ".md",
              --	-- 		},
              --	-- 	}
              --		--vim.g.vimwiki_global_ext = 0 --only mark files in the second brain as vim viki, rest are standard markdown
              --	-- end,
              --},

              --dbt
              -- 'lepture/vim-jinja', --needed for dbt below but errors in hugo htmls...
              {'pedramnavid/dbt.nvim', event = "VeryLazy"},
              {'glench/vim-jinja2-syntax', event = "VeryLazy"},
              -- 'ivanovyordan/dbt.vim',

              -- Java
              --"mfussenegger/nvim-jdtls", --removed until https://github.com/neovim/neovim/issues/20795 is fixed
              --use nvim in browser
              {
                "glacambre/firenvim",
                event = "VeryLazy",
                build = function()
                  vim.fn["firenvim#install"](0)
                end,
              },
              --to delete later
              {'dstein64/vim-startuptime', event = "VeryLazy"},
            }
