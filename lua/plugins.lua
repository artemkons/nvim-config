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

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
local packer_bootstrap = ensure_packer()

vim.cmd([[
    augroup MyColors
        autocmd!
        autocmd ColorScheme * :highlight BufferTabpageFill ctermbg=none
        autocmd ColorScheme * :highlight BufferCurrentMod ctermfg=1
    augroup END
]])

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>ws", ":split <cr>", opts)
keymap("n", "<leader>wv", ":vsplit <cr>", opts)

keymap("", "<leader>f", ":NERDTreeToggle <cr>", opts)

-- Doesn't work with keymap func, idk why
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})

keymap(
	'n',
	'<leader>pp',
	":lua require'telescope'.extensions.project.project{}<cr>",
	opts
)

keymap("n", "<leader>ch", ":Limelight!! <cr> :Goyo <cr>", opts)

return require('packer').startup(function(use)

	use {
		'dylanaraps/wal.vim',
		config = "vim.cmd('colorscheme wal')"
	}

use 'mhinz/vim-startify'

	use {
		'preservim/nerdtree',
		config = function()
			vim.cmd('let NERDTreeShowHidden = 1')
		end
	}

	use {
		'Xuyuanp/nerdtree-git-plugin',
		requires = 'preservim/nerdtree'
	}

	use {
		'TimUntersberger/neogit',
		requires = 'nvim-lua/plenary.nvim'
	}

    use {
      'romgrk/barbar.nvim',
      config = function()
        require'bufferline'.setup {
          icons = false
        }
      end
    }

    use 'vim-airline/vim-airline'

    use {
      'vim-airline/vim-airline-themes',
      config = function()
        vim.cmd("let g:airline_theme='jellybeans'")
      end
    }

	use 'ahmedkhalf/project.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'nvim-telescope/telescope-project.nvim',
		requires = "nvim-telescope/telescope-project.nvim",
		config = function()
			require'telescope'.load_extension('project')
		end
	}

	use {
		'neoclide/coc.nvim',
		branch = 'release'
	}

    use {
    'neovim/nvim-lspconfig',
    config = function()
            require("lspconfig").clangd.setup {
                on_attach = function(client, bufnr)
                    navic.attach(client, bufnr)
                end
            }
    end
    }
use {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
        require("lsp_lines").setup()
    end
 }

use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use 'junegunn/limelight.vim'
	use 'junegunn/goyo.vim'

	use { 'L3MON4D3/LuaSnip', tag = 'v<CurrentMajor>.*' }

-- TODO Find a way to wrap it
end)
