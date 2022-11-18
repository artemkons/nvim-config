-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/konstantinov050701gmail.com/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/konstantinov050701gmail.com/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/konstantinov050701gmail.com/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/konstantinov050701gmail.com/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/konstantinov050701gmail.com/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\nicons\1\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["fm-nvim"] = {
    config = { "\27LJ\2\n¥\6\0\0\6\0\22\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0024\3\0\0=\3\5\0025\3\6\0005\4\a\0=\4\b\0035\4\t\0=\4\n\3=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0026\3\16\0009\3\17\0039\3\18\3'\5\19\0B\3\2\2'\4\20\0&\3\4\3=\3\21\2B\0\2\1K\0\1\0\15broot_conf</site/pack/packer/start/fm-nvim/assets/broot_conf.hjson\tdata\fstdpath\afn\bvim\rmappings\1\0\5\ftabedit\n<C-t>\15horz_split\n<C-h>\15vert_split\n<C-v>\bESC\15:quit <cr>\tedit\n<C-e>\tcmds\1\0\17\20taskwarrior_cmd\20taskwarrior-tui\ffff_cmd\bfff\fnnn_cmd\bnnn\vfm_cmd\afm\vlf_cmd\alf\16neomutt_cmd\fneomutt\16lazygit_cmd\flazygit\16joshuto_cmd\fjoshuto\15ranger_cmd\vranger\14gitui_cmd\ngitui\14broot_cmd\nbroot\rskim_cmd\ask\rvifm_cmd\tvifm\rxplr_cmd\txplr\ffzy_cmd\17find . | fzy\ffzf_cmd\bfzf\ftwf_cmd\btwf\aui\nsplit\1\0\2\tsize\3\24\14direction\ftopleft\nfloat\1\0\b\nwidth\4š³æÌ\t™³¦ÿ\3\14border_hl\16FloatBorder\6x\4\0€€€ÿ\3\rfloat_hl\vNormal\6y\4\0€€€ÿ\3\vborder\tnone\vheight\4š³æÌ\t™³¦ÿ\3\nblend\3\0\1\0\1\fdefault\nfloat\fon_open\ron_close\1\0\1\redit_cmd\tedit\nsetup\ffm-nvim\frequire\0" },
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/fm-nvim",
    url = "https://github.com/is0n/fm-nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  ["hlargs.nvim"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0B\0\1\1K\0\1\0\venable\nsetup\vhlargs\frequire\0" },
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["limelight.vim"] = {
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/limelight.vim",
    url = "https://github.com/junegunn/limelight.vim"
  },
  ["lsp_lines.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14lsp_lines\frequire\0" },
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  neogit = {
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n±\3\0\0\a\0\r\0\0216\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0004\3\3\0006\4\5\0009\4\6\4'\6\a\0B\4\2\2'\5\b\0&\4\5\4>\4\1\3=\3\t\2=\2\3\0019\1\n\0004\2\3\0005\3\f\0>\3\1\2=\2\v\1K\0\1\0\1\0\a\burl\26http://localhost:3000\rreAttach\2\frequest\vlaunch\22firefoxExecutable5/Applications/Firefox.app/Contents/MacOS/firefox\tname\23Debug with Firefox\fwebRoot\23${workspaceFolder}\ttype\ffirefox\20typescriptreact\19configurations\targs1/vscode-firefox-debug/dist/adapter.bundle.js\tHOME\vgetenv\aos\1\0\2\fcommand\tnode\ttype\15executable\ffirefox\radapters\bdap\frequire\0" },
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n,\0\2\6\0\2\0\0066\2\0\0009\2\1\2\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\vattach\nnavic\\\1\0\4\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\5\0003\3\4\0=\3\6\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\vclangd\14lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["telescope-project.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fproject\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-airline-themes"] = {
    config = { "\27LJ\2\nD\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0%let g:airline_theme='jellybeans'\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/vim-airline-themes",
    url = "https://github.com/vim-airline/vim-airline-themes"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["wal.vim"] = {
    config = { "vim.cmd('colorscheme wal')" },
    loaded = true,
    path = "/Users/konstantinov050701gmail.com/.local/share/nvim/site/pack/packer/start/wal.vim",
    url = "https://github.com/dylanaraps/wal.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: hlargs.nvim
time([[Config for hlargs.nvim]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0B\0\1\1K\0\1\0\venable\nsetup\vhlargs\frequire\0", "config", "hlargs.nvim")
time([[Config for hlargs.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n,\0\2\6\0\2\0\0066\2\0\0009\2\1\2\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\vattach\nnavic\\\1\0\4\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\5\0003\3\4\0=\3\6\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\vclangd\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\nicons\1\nsetup\15bufferline\frequire\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: fm-nvim
time([[Config for fm-nvim]], true)
try_loadstring("\27LJ\2\n¥\6\0\0\6\0\22\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0024\3\0\0=\3\5\0025\3\6\0005\4\a\0=\4\b\0035\4\t\0=\4\n\3=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0026\3\16\0009\3\17\0039\3\18\3'\5\19\0B\3\2\2'\4\20\0&\3\4\3=\3\21\2B\0\2\1K\0\1\0\15broot_conf</site/pack/packer/start/fm-nvim/assets/broot_conf.hjson\tdata\fstdpath\afn\bvim\rmappings\1\0\5\ftabedit\n<C-t>\15horz_split\n<C-h>\15vert_split\n<C-v>\bESC\15:quit <cr>\tedit\n<C-e>\tcmds\1\0\17\20taskwarrior_cmd\20taskwarrior-tui\ffff_cmd\bfff\fnnn_cmd\bnnn\vfm_cmd\afm\vlf_cmd\alf\16neomutt_cmd\fneomutt\16lazygit_cmd\flazygit\16joshuto_cmd\fjoshuto\15ranger_cmd\vranger\14gitui_cmd\ngitui\14broot_cmd\nbroot\rskim_cmd\ask\rvifm_cmd\tvifm\rxplr_cmd\txplr\ffzy_cmd\17find . | fzy\ffzf_cmd\bfzf\ftwf_cmd\btwf\aui\nsplit\1\0\2\tsize\3\24\14direction\ftopleft\nfloat\1\0\b\nwidth\4š³æÌ\t™³¦ÿ\3\14border_hl\16FloatBorder\6x\4\0€€€ÿ\3\rfloat_hl\vNormal\6y\4\0€€€ÿ\3\vborder\tnone\vheight\4š³æÌ\t™³¦ÿ\3\nblend\3\0\1\0\1\fdefault\nfloat\fon_open\ron_close\1\0\1\redit_cmd\tedit\nsetup\ffm-nvim\frequire\0", "config", "fm-nvim")
time([[Config for fm-nvim]], false)
-- Config for: lsp_lines.nvim
time([[Config for lsp_lines.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14lsp_lines\frequire\0", "config", "lsp_lines.nvim")
time([[Config for lsp_lines.nvim]], false)
-- Config for: vim-airline-themes
time([[Config for vim-airline-themes]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0%let g:airline_theme='jellybeans'\bcmd\bvim\0", "config", "vim-airline-themes")
time([[Config for vim-airline-themes]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n±\3\0\0\a\0\r\0\0216\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0004\3\3\0006\4\5\0009\4\6\4'\6\a\0B\4\2\2'\5\b\0&\4\5\4>\4\1\3=\3\t\2=\2\3\0019\1\n\0004\2\3\0005\3\f\0>\3\1\2=\2\v\1K\0\1\0\1\0\a\burl\26http://localhost:3000\rreAttach\2\frequest\vlaunch\22firefoxExecutable5/Applications/Firefox.app/Contents/MacOS/firefox\tname\23Debug with Firefox\fwebRoot\23${workspaceFolder}\ttype\ffirefox\20typescriptreact\19configurations\targs1/vscode-firefox-debug/dist/adapter.bundle.js\tHOME\vgetenv\aos\1\0\2\fcommand\tnode\ttype\15executable\ffirefox\radapters\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: telescope-project.nvim
time([[Config for telescope-project.nvim]], true)
try_loadstring("\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fproject\19load_extension\14telescope\frequire\0", "config", "telescope-project.nvim")
time([[Config for telescope-project.nvim]], false)
-- Config for: wal.vim
time([[Config for wal.vim]], true)
vim.cmd('colorscheme wal')
time([[Config for wal.vim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
