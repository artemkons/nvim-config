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
        autocmd ColorScheme * :highlight VertSplit ctermbg=none
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

keymap("", "<leader>f", ":Lf <cr>", opts)

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

vim.cmd("set fillchars=vert:\\ ")
vim.cmd("")

use 'mhinz/vim-startify'

use {
    'is0n/fm-nvim',
    config = function()
        require('fm-nvim').setup{
        -- (Vim) Command used to open files
        edit_cmd = "edit",

        -- See `Q&A` for more info
        on_close = {},
        on_open = {},

        -- UI Options
        ui = {
            -- Default UI (can be "split" or "float")
            default = "float",

            float = {
                -- Floating window border (see ':h nvim_open_win')
                border    = "none",

                -- Highlight group for floating window/border (see ':h winhl')
                float_hl  = "Normal",
                border_hl = "FloatBorder",

                -- Floating Window Transparency (see ':h winblend')
                blend     = 0,

                -- Num from 0 - 1 for measurements
                height    = 0.8,
                width     = 0.8,

                -- X and Y Axis of Window
                x         = 0.5,
                y         = 0.5
            },

            split = {
                -- Direction of split
                direction = "topleft",

                -- Size of split
                size      = 24
            }
        },

        -- Terminal commands used w/ file manager (have to be in your $PATH)
        cmds = {
            lf_cmd      = "lf", -- eg: lf_cmd = "lf -command 'set hidden'"
            fm_cmd      = "fm",
            nnn_cmd     = "nnn",
            fff_cmd     = "fff",
            twf_cmd     = "twf",
            fzf_cmd     = "fzf", -- eg: fzf_cmd = "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
            fzy_cmd     = "find . | fzy",
            xplr_cmd    = "xplr",
            vifm_cmd    = "vifm",
            skim_cmd    = "sk",
            broot_cmd   = "broot",
            gitui_cmd   = "gitui",
            ranger_cmd  = "ranger",
            joshuto_cmd = "joshuto",
            lazygit_cmd = "lazygit",
            neomutt_cmd = "neomutt",
            taskwarrior_cmd = "taskwarrior-tui"
        },

        -- Mappings used with the plugin
        mappings = {
            vert_split = "<C-v>",
            horz_split = "<C-h>",
            tabedit    = "<C-t>",
            edit       = "<C-e>",
            ESC        = ":quit <cr>"
        },

        -- Path to broot config
        broot_conf = vim.fn.stdpath("data") .. "/site/pack/packer/start/fm-nvim/assets/broot_conf.hjson"
    }


  end
}

	use {
		'TimUntersberger/neogit',
		requires = 'nvim-lua/plenary.nvim'
	}

keymap("n", "<leader>gg", ":Neogit <cr>", opts)

keymap("n", "<leader>gb", ":CocCommand git.showBlameDoc <cr>", opts)

    use {
      'romgrk/barbar.nvim',
      config = function()
        require'bufferline'.setup {
          icons = false
        }
      end
    }

keymap("n", "<leader>t]", ":BufferNext <cr>", opts)
keymap("n", "<leader>t[", ":BufferPrevious <cr>", opts)
keymap("n", "<leader>tq", ":BufferClose <cr>", opts)

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
  'mfussenegger/nvim-dap',
  config=function()
    local dap = require('dap')
        dap.adapters.firefox = {
        type = 'executable',
        command = 'node',
        args = {os.getenv('HOME') .. '/vscode-firefox-debug/dist/adapter.bundle.js'},
    }

    dap.configurations.typescriptreact = {
      {
        name = 'Debug with Firefox',
        type = 'firefox',
        request = 'launch',
        reAttach = true,
        url = 'http://localhost:3000',
        webRoot = '${workspaceFolder}',
        firefoxExecutable = '/Applications/Firefox.app/Contents/MacOS/firefox'
      }
    }
  end
 }

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

use {
  'm-demare/hlargs.nvim',
  requires = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
      require('hlargs').setup()
      require('hlargs').enable()
  end
}

use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})

	use 'junegunn/limelight.vim'
	use 'junegunn/goyo.vim'

	use { 'L3MON4D3/LuaSnip', tag = 'v<CurrentMajor>.*' }

-- TODO Find a way to wrap it
end)
