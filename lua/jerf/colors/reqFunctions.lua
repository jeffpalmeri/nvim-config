local function Req_darkplus()
  local colorscheme = "darkplus"

  local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not status_ok then
    return
  end
end

-- require('colorbuddy').colorscheme('gruvbuddy')
function Req_vsCodeColors()

  vim.o.background = 'dark'

  local c = require('vscode.colors')
  require('vscode').setup({
    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
      vscLineNumber = '#FFFFFF',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
      -- this supports the same val table as vim.api.nvim_set_hl
      -- use colors from this colorscheme by requiring vscode.colors!
      Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
    }
  })
end

function Req_gruvbuddy()
  require('colorbuddy').colorscheme('gruvbuddy')
end

function Req_catputchin()
  vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

  require("catppuccin").setup({
    transparent_background = false,
  })

  vim.cmd [[colorscheme catppuccin]]
end

function Req_tokyo()
  local style = "night"
  -- local style = "moon"
  -- local style = "day"

  require("tokyonight").setup({
    style = style,
    transparent = false,
    dim_inactive = true,
    on_colors = function(colors)
      colors.bg = "#090a0f"
      -- colors.bg = "#12141c"

    end
  })
vim.cmd[[colorscheme tokyonight]]
end

M = {

  darkplus = Req_darkplus,

  vsCodeColors = Req_vsCodeColors,

  gruvbuddy = Req_gruvbuddy,

  catputchin = Req_catputchin,

  tokyo = Req_tokyo
}

return M

--[[ ---@class Palette
M.default = {
  none = "NONE",
  bg_dark = "#1f2335",
  bg = "#24283b",
  bg_highlight = "#292e42",
  terminal_black = "#414868",
  fg = "#c0caf5",
  fg_dark = "#a9b1d6",
  fg_gutter = "#3b4261",
  dark3 = "#545c7e",
  comment = "#565f89",
  dark5 = "#737aa2",
  blue0 = "#3d59a1",
  blue = "#7aa2f7",
  cyan = "#7dcfff",
  blue1 = "#2ac3de",
  blue2 = "#0db9d7",
  blue5 = "#89ddff",
  blue6 = "#b4f9f8",
  blue7 = "#394b70",
  magenta = "#bb9af7",
  magenta2 = "#ff007c",
  purple = "#9d7cd8",
  orange = "#ff9e64",
  yellow = "#e0af68",
  green = "#9ece6a",
  green1 = "#73daca",
  green2 = "#41a6b5",
  teal = "#1abc9c",
  red = "#f7768e",
  red1 = "#db4b4b",
  git = { change = "#6183bb", add = "#449dab", delete = "#914c54" },
  gitSigns = {
    add = "#266d6a",
    change = "#536c9e",
    delete = "#b2555b",
  },
}

M.night = {
  bg = "#1a1b26",
  bg_dark = "#16161e",
} ]]
