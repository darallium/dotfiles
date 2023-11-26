global = require('core.global')
local global_local = {
	-- みため
	whichwrap = "b,s,h,l,<,>,[,],~",

  
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

	-- 元に戻す
	undofile = true,


	-- 補完
	wildignorecase = true,

  -- 検索
  ignorecase = false,
  noignorecase = true,
  hlsearch = true,
  incsearch = true,

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

