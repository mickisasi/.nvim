local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.relativenumber = true
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

require("lazy").setup({
	{ 	"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function ()
			vim.cmd [[colorscheme catppuccin-mocha]]	
		end,
	},
	{
    		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                              , branch = '0.1.x',
      		dependencies = { 'nvim-lua/plenary.nvim' }
    	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
	},
	{'mbbill/undotree'},

	--- Uncomment these if you want to manage LSP servers from neovim
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},

	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	{'windwp/nvim-ts-autotag'},
	{
	    'windwp/nvim-autopairs',
	    event = "InsertEnter",
	    opts = {} -- this is equalent to setup({}) function
	},
	{"nvim-lualine/lualine.nvim",
		require = {'nvim-tree/nvim-web-devicons', opt = true}
	},
	{'akinsho/toggleterm.nvim', version = "*", config = true},
	{
	    'numToStr/Comment.nvim',
	    opts = {
		-- add any options here
	    },
	    lazy = false,
	},

})

