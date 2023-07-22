-- Other lua files for shorter code configs
--------------LUALINE--------------------
require('lualine').setup {
	options = {
		theme = 'nightfly'
	},

sections = {
    lualine_a = {{'filetype', colored = false, icon_only = true, }, 'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename', 'searchcount', 'selectioncount'},
    lualine_x = {'encoding', 
    {'fileformat',
	symbols = {
        unix = ' UNIX', -- e712
        dos = ' WIN',  -- e70f
        mac = ' OSX',  -- e711
      },
      },
    'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
}
------------MASON--------------------
require("mason").setup()
require("mason-lspconfig").setup()

require('lspconfig').clangd.setup{}
require('lspconfig').jdtls.setup{}
require('lspconfig').pylsp.setup{}
require('lspconfig').rust_analyzer.setup{}
------------BUFFERLINE----------------
require("bufferline").setup{
	options = {
offsets = {
            {
               filetype = "neo-tree",
      text = "  NeoTree Directory",
            highlight = "Directory",
      text_align = "left"
 
            },
	},

diagnostics = "nvim_lsp",

},
}
-----------NEOTREE------------
------------------------------------------------------------------
-- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define("DiagnosticSignError",
        {text = " ", texthl = "DiagnosticSignError"})
      vim.fn.sign_define("DiagnosticSignWarn",
        {text = " ", texthl = "DiagnosticSignWarn"})
      vim.fn.sign_define("DiagnosticSignInfo",
        {text = " ", texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint",
        {text = "󰌵", texthl = "DiagnosticSignHint"})

	vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
vim.api.nvim_create_autocmd("BufReadPre", {
  desc = "Open neo-tree on enter",
  group = "neotree_autoopen",
  callback = function()
    if not vim.g.neotree_opened then
      vim.cmd "Neotree show"
      vim.g.neotree_opened = true
    end
  end,
})
--------------------------------------------------------
require('neo-tree').setup {
	enable_diagnostics = true,

	window = {
          position = "left",
          width = 25,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
},
}
