global = require('core.global')
local global_local = {
	-- みため
	whichwrap = "b,s,h,l,<,>,[,],~",
	noshowmode = true,
 termguicolors=true,

 -- scroll
 scrolloff = 4,
	
	-- encoding
	encoding = "utf-8",
	fileencoding = "utf-8",
	fileencodings = "utf-8, cp932, euc-jp",

	-- tabs = インデント
	expandtab = true,
	shiftwidth = 2,
	softtabstop = 2,
	tabstop = 2,
	autoindent = true,

	-- 行番号
	number = true,
	numberwidth = 2,
	relativenumber = true,
	signcolumn = "yes:1",

	-- 保管
	completeopt = menuone,noinsert,


	-- 元に戻す
	undofile = true,

	-- clipboard, register
	clipboard = "unnamedplus",

	-- cache, backup
	backup = false,
	writebackup = false,

	-- 補完
	wildignorecase = true,

	-- 検索
	ignorecase = true,
 smartcase = true,
	hlsearch = true,
	incsearch = true,
 inccommand = "split",

	-- ファイル操作
	autoread = true,

	backup = true,
	backupdir = global.backup_dir,
	writebackup = false,
	
	undofile = true,
	undodir = global.backup_dir,

}
for key, value in pairs(global_local) do
	vim.o[key] = value
end

if global.is_wsl then
	vim.g.clipboard = {
		name = "win32yank-wsl",
		copy = {
			["+"] = "win32yank.exe -i --crlf",
			["*"] = "win32yank.exe -i --crlf"
		},
		paste = {
			["*"] = "win32yank.exe -o --crlf",
			["*"] = "win32yank.exe -o --crlf"
		}
	}
end

if global.is_mac then
	vim.g.clipboard = {
		name = 'macOS-clipboard',
		copy = {
			['+'] = 'pbcopy',
			['*'] = 'pbcopy',
		},
		paste = {
			['+'] = 'pbpaste',
			['*'] = 'pbpaste',
		},
		cache_enabled = 0,
	}
	vim.g.python_host_prog = '/usr/bin/python'
	vim.g.python3_host_prog = '/usr/local/bin/python3'
end

-- if global.is_linux then
-- 	vim.g.clipboard = {
-- 		name = 'linux-clipboard',
--   'copy': {
--      '+': ['tmux', 'load-buffer', '-'],
--      '*': ['tmux', 'load-buffer', '-'],
--    },
--   'paste': {
--      '+': ['tmux', 'save-buffer', '-'],
--      '*': ['tmux', 'save-buffer', '-'],
--   },
--   'cache_enabled': 1,
-- 	vim.g.python_host_prog = '/usr/bin/python'
-- 	vim.g.python3_host_prog = '/usr/local/bin/python3'
-- end
