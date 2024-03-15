vim.opt.termguicolors = true

local bufferline = require("bufferline")

bufferline.setup({
    options = {
      numbers = "ordinal",
      highlight = "Directory",
      separator_style = "slant",
      color_icons = true,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      truncate_names = true,
      max_name_length = 10,
      enforce_regular_tabs = false,
      buffer_close_icon = '󰅖',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      mode = "buffers", -- set to "tabs" to only show tabpages instead
      style_preset = bufferline.style_preset.default,
      show_buffer_icons = true, -- disable filetype icons for buffers
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
      duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
      always_show_bufferline = true,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true
        }
      },
      indicator = {
                -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
          style = 'underline',
      },
      hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
      },
      diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or ""
          return " " .. icon .. count
      end
    }
})
