local bufferline = require("bufferline")
local colors = require("catppuccin.palettes").get_palette "macchiato"

bufferline.setup({
    options = {
        mode = 'tabs',
        seperator_style = 'slope',
        indicator = {
                icon = '▎',
                style = 'icon',
        },
        themeable = true,
        modified_icon = '●',
        buffer_close_icon = '',
        left_trunc_marker = '..',
        right_trunc_marker = '..',
        color_icons = true,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        -- Special names for particular cases
        name_formatter = function(buf)
            if buf.name == 'DiffviewFilePanel' then
                return 'Diff'
            end
            if string.match(buf.name,'#toggleterm#') then
                return 'Terminal'
            end
        end,
    },
    highlights = {
        indicator_selected = {
            fg = colors.blue,
        },
        buffer_selected = {
            italic = false,
        },
    },
})
