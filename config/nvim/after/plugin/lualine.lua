-- Lualine set theme
local theme = require('lualine.themes.rose-pine')

-- Custom colors for normal and insert mode
theme.normal.a = {
    fg = vim.g.terminal_color_0,
    bg = vim.g.terminal_color_8,
    gui = 'bold',
}
theme.insert.a = {
    fg = vim.g.terminal_color_0,
    bg = vim.g.terminal_color_6,
    gui = 'bold',
}

-- 'mode' settings
local mode = {
    'mode',
    fmt = function(mode)
        -- return ' ' - requires a nerd font
        -- displays only the first character of the mode
        return ' ' .. mode
    end,
}

-- 'filename' settings
local filename = {
    'filename',
    path = 3,
    shorting_target = 0,
    file_status = true,
    color = { fg = 'NONE', bg = 'NONE'},
}

-- 'filetype' settings
local filetype = {
    'filetype',
    icon_only = false,
}

-- 'progress' settings
local progress = {
    'progress',
    color = { fg = 'NONE'},
}

require('lualine').setup {
    options = {
        theme = theme,
        icons_enabled = true,
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
                'WinEnter',
                'BufEnter',
                'BufWritePost',
                'SessionLoadPost',
                'FileChangedShellPost',
                'VimResized',
                'Filetype',
                'CursorMoved',
                'CursorMovedI',
                'ModeChanged',
            },
        }
    },

    sections = {
        -- Left
        lualine_a = { mode },
        lualine_b = { filename },
        lualine_c = { 'diagnostics'},

        -- Right
        lualine_x = { filetype },
        lualine_y = { progress },
        lualine_z = { 'location' }
    },

    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
