vim.opt.termguicolors = true

local bufferline = require("bufferline")

bufferline.setup({
    options = {
      always_show_bufferline = true,
      buffer_close_icon = '󰅖',
      close_icon = '',
      color_icons = true,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      duplicates_across_groups = true,
      enforce_regular_tabs = false,
      highlight = "Directory",
      left_trunc_marker = '',
      tab_size = 20,
      max_name_length = 15,
      mode = "buffers", -- set to "tabs" to only show tabpages instead
      modified_icon = '●',
      move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
      numbers = "both",
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      right_trunc_marker = '',
      separator_style = "slant",
      show_buffer_close_icons = true,
      show_buffer_icons = true, -- disable filetype icons for buffers
      show_close_icon = true,
      show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
      show_tab_indicators = true,
      style_preset = bufferline.style_preset.default,
      truncate_names = true,
      offsets = {
        {
          filetype = "NvimTree",
          separator = true,
          text = "File Explorer",
          text_align = "center",
        }
      },
      indicator = {
          icon = '▎', -- this should be omitted if indicator style is not 'icon'
          style = 'icon',
      },
      hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
      },
      diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
      end
    }
})
