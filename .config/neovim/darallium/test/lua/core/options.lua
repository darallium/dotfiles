global = require('core.global')
local global_local = {
	-- みため
	number = true,
	whichwrap = "b,s,h,l,<,>,[,],~",


	-- tabs = インデント
	expandtab = true,
	shiftwidth = 2,
	softtabstop = 2,
	tabstop = 2,

	-- 元に戻す
	undofile = true,


	-- 補完
	wildignorecase = true,

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

