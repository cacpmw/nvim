-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies". 
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use { "ellisonleao/gruvbox.nvim" }
    use { 'williamboman/mason.nvim',
          'williamboman/mason-lspconfig.nvim',
          'neovim/nvim-lspconfig'
    }
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'
    use { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }        -- buffer auto-completion
    use { 'hrsh7th/cmp-path' }          -- path auto-completion
    use { 'hrsh7th/cmp-cmdline' }       -- cmdline auto-completion
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'
    use { 'nvim-tree/nvim-tree.lua',config = [[require('config.nvim-tree')]],
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional
            },
    }

    use {'nvim-telescope/telescope.nvim', tag = '0.1.5',requires = { {'nvim-lua/plenary.nvim'} }}
    use {'akinsho/bufferline.nvim',config = [[require('config.nvim-bufferline')]], tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
    use { 'nvim-lualine/lualine.nvim',config = [[require('config.nvim-lualine')]], requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
    ---------------------------------------
    -- NOTE: PUT YOUR THIRD PLUGIN HERE --
    ---------------------------------------
  
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
