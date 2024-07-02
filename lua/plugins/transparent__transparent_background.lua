if vim.fn.has("gui_running") == 1 then
  return {}
end

return {
  "xiyaowong/transparent.nvim",
  opts = function()
    require("transparent").setup({ -- Optional, you don't have to run setup.
      groups = { -- table: default groups
        "Normal",
        "NormalNC",
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Type",
        "Underlined",
        "Todo",
        "String",
        "Function",
        "Conditional",
        "Repeat",
        "Operator",
        "Structure",
        "LineNr",
        "NonText",
        "SignColumn",
        "CursorLine",
        "CursorLineNr",
        "StatusLine",
        "EndOfBuffer",
        "NotifyINFOBody",
        "NotifyINFOBorder",
        "NotifyINFOBody4",
        "NotifyINFOBorder4",
        "NotifyTRACEBody",
        "NotifyTRACEBorder",
        "NotifyDEBUGBody",
        "NotifyDEBUGBorder",
        "NotifyERRORBody",
        "NotifyERRORBorder",
        "NotifyWARNBody",
        "NotifyWARNBorder",
      },
      extra_groups = {
        "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
        "NvimTreeNormal", -- NvimTree
        "NeoTreeNormal",
        "NeoTreeFloatBorder",
        "NeoTreeNormalNC",
        "TelescopeNormal",
        "TelescopeBorder",
        "NotifyBackground",
      },
      exclude_groups = {
        "StatusLineNC",
      }, -- table: groups you don't want to clear
    })
  end,
}
