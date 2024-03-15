vim.opt.termguicolors = true

local bufferline = require("bufferline")

bufferline.setup({
    options = {
      numbers = "ordinal",
      highlight = "Directory",
      separator_style = "slant",
      color_icons = true,
      diagnostics = "nvim_lsp",
      tab_size = 18,
      truncate_names = true,
      max_name_length = 18,
    
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true
        }
      }
    }
})
