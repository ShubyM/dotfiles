local M = {}

local colors = {
  fg = "#d8d3c8",
  fg_bright = "#ebe6dc",
  muted = "#7d858c",
  slate = "#53616b",
  feather = "#aeb7bc",
  deep = "#111315",
  gutter = "#2f353a",
  green = "#6fd8bd",
  neck_green = "#2fbf9f",
  teal = "#1f8f9a",
  cyan = "#56c5cf",
  purple = "#7d5ac7",
  violet = "#b58cff",
  amber = "#e3c36f",
  coral = "#e58b7d",
  rose = "#c96f8d",
  selection = "#3a3248",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.setup()
  vim.g.colors_name = "pigeon-frost"
  vim.o.termguicolors = true
  vim.o.background = "dark"

  hi("Normal", { fg = colors.fg, bg = "NONE" })
  hi("NormalNC", { fg = colors.fg, bg = "NONE" })
  hi("NormalFloat", { fg = colors.fg, bg = "NONE" })
  hi("FloatBorder", { fg = colors.purple, bg = "NONE" })
  hi("SignColumn", { fg = colors.muted, bg = "NONE" })
  hi("EndOfBuffer", { fg = colors.gutter, bg = "NONE" })
  hi("NonText", { fg = colors.gutter, bg = "NONE" })
  hi("Whitespace", { fg = colors.gutter, bg = "NONE" })

  hi("Cursor", { fg = colors.deep, bg = colors.amber })
  hi("CursorLine", { bg = "NONE" })
  hi("CursorLineNr", { fg = colors.violet, bold = true })
  hi("LineNr", { fg = colors.slate })
  hi("ColorColumn", { bg = "NONE" })
  hi("Visual", { bg = colors.selection })
  hi("Search", { fg = colors.deep, bg = colors.amber })
  hi("IncSearch", { fg = colors.deep, bg = colors.coral })
  hi("MatchParen", { fg = colors.violet, bold = true })

  hi("Comment", { fg = colors.muted, italic = true })
  hi("Constant", { fg = colors.amber })
  hi("String", { fg = colors.green })
  hi("Character", { fg = colors.green })
  hi("Number", { fg = colors.amber })
  hi("Boolean", { fg = colors.coral })
  hi("Float", { fg = colors.amber })
  hi("Identifier", { fg = colors.fg })
  hi("Function", { fg = colors.violet })
  hi("Statement", { fg = colors.purple })
  hi("Keyword", { fg = colors.purple, bold = true })
  hi("PreProc", { fg = colors.teal })
  hi("Type", { fg = colors.green })
  hi("Special", { fg = colors.coral })
  hi("Delimiter", { fg = colors.slate })
  hi("Operator", { fg = colors.violet })
  hi("Label", { fg = colors.cyan })
  hi("Exception", { fg = colors.coral })
  hi("Todo", { fg = colors.deep, bg = colors.amber, bold = true })

  hi("Directory", { fg = colors.violet })
  hi("Title", { fg = colors.violet, bold = true })
  hi("ErrorMsg", { fg = colors.coral, bold = true })
  hi("WarningMsg", { fg = colors.amber, bold = true })
  hi("MoreMsg", { fg = colors.green })
  hi("Question", { fg = colors.green })

  hi("Pmenu", { fg = colors.fg, bg = "NONE" })
  hi("PmenuSel", { fg = colors.deep, bg = colors.violet })
  hi("PmenuKind", { fg = colors.green, bg = "NONE" })
  hi("PmenuExtra", { fg = colors.muted, bg = "NONE" })
  hi("PmenuSbar", { bg = "NONE" })
  hi("PmenuThumb", { bg = colors.purple })

  hi("StatusLine", { fg = colors.fg, bg = "NONE" })
  hi("StatusLineNC", { fg = colors.muted, bg = "NONE" })
  hi("TabLine", { fg = colors.muted, bg = "NONE" })
  hi("TabLineFill", { bg = "NONE" })
  hi("TabLineSel", { fg = colors.violet, bg = "NONE", bold = true })

  hi("DiagnosticError", { fg = colors.coral })
  hi("DiagnosticWarn", { fg = colors.amber })
  hi("DiagnosticInfo", { fg = colors.teal })
  hi("DiagnosticHint", { fg = colors.green })
  hi("DiagnosticUnderlineError", { undercurl = true, sp = colors.coral })
  hi("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.amber })
  hi("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.teal })
  hi("DiagnosticUnderlineHint", { undercurl = true, sp = colors.green })

  hi("DiffAdd", { fg = colors.green, bg = "NONE" })
  hi("DiffChange", { fg = colors.amber, bg = "NONE" })
  hi("DiffDelete", { fg = colors.coral, bg = "NONE" })
  hi("DiffText", { fg = colors.violet, bg = "NONE", bold = true })
  hi("GitSignsAdd", { fg = colors.green, bg = "NONE" })
  hi("GitSignsChange", { fg = colors.amber, bg = "NONE" })
  hi("GitSignsDelete", { fg = colors.coral, bg = "NONE" })

  hi("TelescopeNormal", { fg = colors.fg, bg = "NONE" })
  hi("TelescopeBorder", { fg = colors.purple, bg = "NONE" })
  hi("TelescopeSelection", { fg = colors.violet, bg = "NONE", bold = true })
  hi("TelescopeMatching", { fg = colors.amber, bold = true })

  hi("NvimTreeNormal", { fg = colors.fg, bg = "NONE" })
  hi("NvimTreeNormalNC", { fg = colors.fg, bg = "NONE" })
  hi("NvimTreeFolderName", { fg = colors.violet })
  hi("NvimTreeOpenedFolderName", { fg = colors.violet, bold = true })
  hi("NvimTreeGitDirty", { fg = colors.amber })
  hi("NvimTreeGitNew", { fg = colors.green })
  hi("NvimTreeGitDeleted", { fg = colors.coral })

  hi("@comment", { fg = colors.muted, italic = true })
  hi("@constant", { fg = colors.amber })
  hi("@constant.builtin", { fg = colors.coral })
  hi("@constant.macro", { fg = colors.rose })
  hi("@module", { fg = colors.cyan })
  hi("@namespace", { fg = colors.cyan })
  hi("@label", { fg = colors.cyan })
  hi("@keyword", { fg = colors.purple, bold = true })
  hi("@keyword.function", { fg = colors.purple, bold = true })
  hi("@keyword.operator", { fg = colors.violet })
  hi("@keyword.return", { fg = colors.rose, bold = true })
  hi("@keyword.conditional", { fg = colors.purple, bold = true })
  hi("@keyword.repeat", { fg = colors.purple, bold = true })
  hi("@keyword.exception", { fg = colors.coral, bold = true })
  hi("@function", { fg = colors.violet })
  hi("@function.builtin", { fg = colors.cyan })
  hi("@function.call", { fg = colors.violet })
  hi("@function.method", { fg = colors.neck_green })
  hi("@function.method.call", { fg = colors.neck_green })
  hi("@constructor", { fg = colors.green })
  hi("@type", { fg = colors.green })
  hi("@type.builtin", { fg = colors.neck_green })
  hi("@type.definition", { fg = colors.green, bold = true })
  hi("@attribute", { fg = colors.amber })
  hi("@string", { fg = colors.green })
  hi("@string.escape", { fg = colors.cyan })
  hi("@string.special", { fg = colors.cyan })
  hi("@number", { fg = colors.amber })
  hi("@number.float", { fg = colors.amber })
  hi("@boolean", { fg = colors.coral })
  hi("@variable", { fg = colors.fg })
  hi("@variable.builtin", { fg = colors.rose })
  hi("@variable.parameter", { fg = colors.feather })
  hi("@variable.member", { fg = colors.teal })
  hi("@property", { fg = colors.teal })
  hi("@punctuation", { fg = colors.slate })
  hi("@punctuation.bracket", { fg = colors.slate })
  hi("@punctuation.delimiter", { fg = colors.slate })
  hi("@operator", { fg = colors.violet })
  hi("@tag", { fg = colors.purple })
  hi("@tag.attribute", { fg = colors.amber })
  hi("@tag.delimiter", { fg = colors.slate })
  hi("@markup.heading", { fg = colors.violet, bold = true })
  hi("@markup.link", { fg = colors.cyan, underline = true })
  hi("@markup.raw", { fg = colors.green })
  hi("@markup.strong", { fg = colors.fg_bright, bold = true })
  hi("@markup.italic", { fg = colors.feather, italic = true })

  hi("@lsp.type.class", { fg = colors.green })
  hi("@lsp.type.decorator", { fg = colors.amber })
  hi("@lsp.type.enum", { fg = colors.green })
  hi("@lsp.type.enumMember", { fg = colors.amber })
  hi("@lsp.type.function", { fg = colors.violet })
  hi("@lsp.type.interface", { fg = colors.neck_green })
  hi("@lsp.type.macro", { fg = colors.rose })
  hi("@lsp.type.method", { fg = colors.neck_green })
  hi("@lsp.type.namespace", { fg = colors.cyan })
  hi("@lsp.type.parameter", { fg = colors.feather })
  hi("@lsp.type.property", { fg = colors.teal })
  hi("@lsp.type.struct", { fg = colors.green })
  hi("@lsp.type.type", { fg = colors.green })
  hi("@lsp.type.variable", { fg = colors.fg })
end

return M
