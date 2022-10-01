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

M = {

  darkplus = Req_darkplus,

  vsCodeColors = Req_vsCodeColors,

  gruvbuddy = Req_gruvbuddy,

  catputchin = function()
  end
}

return M
