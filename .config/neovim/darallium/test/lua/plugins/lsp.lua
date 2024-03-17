
return {
  {
    "neovim/nvim-lspconfig",
    event = {
      "BufReadPost",
      "BufNewFile"
    },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    cmd = {
      "LspInstall",
      "LspInfo",
      "LspStart",
    },
		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			},
			inlay_hints = {
				enabled = false,
			},
			capabilities = {},
      autoformat = true,
      format = {
        formatting_options = nil,
      },
      servers = {
        jsonls = {},
        lua_ls = {
        },
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
		    				includeInlayParameterNameHints = "all",
		    				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
		    				includeInlayFunctionParameterTypeHints = true,
		    				includeInlayVariableTypeHints = true,
		    				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
		    				includeInlayPropertyDeclarationTypeHints = true,
		    				includeInlayFunctionLikeReturnTypeHints = true,
		    				includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
      },
      setup = {},
		},
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, buffer)
        require("lsp-status").on_attach(client, buffer)
      end

      lspconfig.tsserver.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        single_file_support = false,
        root_dir = lspconfig.util.root_pattern("tsconfig.json"),
      })

      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      local venvs = vim.fn.split(vim.trim(vim.fn.system([[rye show | grep venv:]])), ":")
      local venv = string.format("%s\\Scripts\\python.exe", vim.fn.join({ venvs[2], venvs[3]}, ':'))
      if venv == 1 then

      end
      lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true,
              -- pythonPath = "rye run python ",
              --venvPath = venv,
              analysis = {
                extraPaths = {"."}
              }
            },
          },
        },
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          local opt = {
            buffer 
          }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = 0, nowait = true })
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0, nowait = true })
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = 0, nowait = true })
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = 0, nowait = true })
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0, nowait = true })
        end
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    event = {
      "BufReadPost",
    },
    dependencies = {
      "hrsh7th/vim-vsnip",
    },
    opts = {
      sources = {
        { name = "nvim_lsp" },
      },
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
    },
    config = function(_, opts)
      require("cmp").setup(opts)
    end
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = {
      "make install_jsregexp",
    },
    event = {
      "BufReadPost",
    },
    dependencies = {
    },
    opts = {
    },
    config = function(_, opts)
      require("luasnip").setup(opts)
    end
  },
}
