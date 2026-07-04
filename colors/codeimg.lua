-- codeimg.lua — macOS Terminal "Basic" theme para Neovim
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end
vim.g.colors_name = "codeimg"
vim.o.background = "dark"

local hi = function(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- ─── Paleta macOS Terminal Basic (colores ANSI exactos) ──────────────────────
local c = {
	bg = "#212121",
	bg1 = "#0d0d0d",
	bg2 = "#1a1a1a",
	fg = "#f2f2f2",
	bold_fg = "#ffffff",

	-- ANSI normales
	black = "#000000",
	red = "#c23621",
	green = "#25bc24", -- verde normal macOS
	yellow = "#adad27",
	blue = "#492ee1",
	magenta = "#d338d3",
	cyan = "#33bbc8",
	white = "#cbcccd",

	-- ANSI brillantes
	br_black = "#818383",
	br_red = "#fc391f",
	br_green = "#31e722", -- verde brillante macOS
	br_yellow = "#eaec23",
	br_blue = "#5833ff",
	br_magenta = "#f935f8",
	br_cyan = "#14f0f0",
	br_white = "#ffffff",
}

-- Alias semánticos
local s = {
	comment = c.green, -- verde normal macOS
	string = "#b84040", -- rojo opaco
	keyword = c.white,
	func = "#c8b84a", -- amarillo opaco (nombre de función)
	func_kw = "#c05858", -- rojo opaco (keyword function)
	var_name = "#a03030", -- rojo oscuro (nombre de variable)
	builtin = c.cyan,
	type_name = c.br_cyan,
	constant = c.br_yellow,
	number = c.yellow,
	boolean = c.cyan,
	operator = c.white,
	param = c.fg,
	field = c.br_white,
	namespace = c.cyan,
	special = c.br_magenta,
	error_col = c.br_red,
	warn_col = c.br_yellow,
	info_col = c.br_cyan,
	hint_col = c.green,
	selection = "#1a2a3a",
	match_bg = "#2a2000",
	match_fg = c.br_yellow,
	diff_add = "#001a00",
	diff_del = "#1a0000",
	diff_change = "#00001a",
	border = "#333333",
	gutter_fg = "#444444",
	cursor_line = "#0d0d0d",
}

-- ─── UI Base ──────────────────────────────────────────────────────────────────
hi("Normal", { fg = c.fg, bg = c.bg })
hi("NormalFloat", { fg = c.fg, bg = c.bg2 })
hi("NormalNC", { fg = c.fg, bg = c.bg })
hi("FloatBorder", { fg = s.border, bg = c.bg2 })
hi("FloatTitle", { fg = c.br_white, bg = c.bg2, bold = true })
hi("Cursor", { fg = c.bg, bg = c.fg })
hi("CursorLine", { bg = s.cursor_line })
hi("CursorLineNr", { fg = c.br_yellow, bg = s.cursor_line, bold = true })
hi("CursorColumn", { bg = s.cursor_line })
hi("LineNr", { fg = s.gutter_fg })
hi("SignColumn", { fg = s.gutter_fg, bg = c.bg })
hi("ColorColumn", { bg = c.bg1 })
hi("VertSplit", { fg = s.border })
hi("WinSeparator", { fg = s.border })
hi("StatusLine", { fg = c.fg, bg = c.bg2 })
hi("StatusLineNC", { fg = s.gutter_fg, bg = c.bg1 })
hi("TabLine", { fg = s.gutter_fg, bg = c.bg1 })
hi("TabLineSel", { fg = c.fg, bg = c.bg2, bold = true })
hi("TabLineFill", { bg = c.bg })
hi("Pmenu", { fg = c.fg, bg = c.bg2 })
hi("PmenuSel", { fg = c.bg, bg = c.cyan, bold = true })
hi("PmenuSbar", { bg = c.bg1 })
hi("PmenuThumb", { bg = s.border })
hi("WildMenu", { fg = c.bg, bg = c.cyan })
hi("Visual", { bg = s.selection })
hi("VisualNOS", { bg = s.selection })
hi("Search", { fg = s.match_fg, bg = s.match_bg, bold = true })
hi("IncSearch", { fg = c.bg, bg = c.br_yellow, bold = true })
hi("CurSearch", { fg = c.bg, bg = c.yellow, bold = true })
hi("MatchParen", { fg = c.br_yellow, bold = true, underline = true })
hi("NonText", { fg = s.border })
hi("Whitespace", { fg = s.border })
hi("SpecialKey", { fg = s.border })
hi("Folded", { fg = c.br_black, bg = c.bg1, italic = true })
hi("FoldColumn", { fg = s.gutter_fg, bg = c.bg })
hi("EndOfBuffer", { fg = c.bg })
hi("Directory", { fg = c.cyan })
hi("Title", { fg = c.br_white, bold = true })
hi("Question", { fg = c.cyan })
hi("MoreMsg", { fg = c.green })
hi("ModeMsg", { fg = c.fg, bold = true })
hi("ErrorMsg", { fg = s.error_col })
hi("WarningMsg", { fg = s.warn_col })
hi("QuickFixLine", { bg = s.selection })
hi("Conceal", { fg = c.br_black })

-- ─── Sintaxis estándar ────────────────────────────────────────────────────────
hi("Comment", { fg = s.comment })
hi("Constant", { fg = s.constant })
hi("String", { fg = s.string })
hi("Character", { fg = s.string })
hi("Number", { fg = s.number })
hi("Float", { fg = s.number })
hi("Boolean", { fg = s.boolean, bold = true })
hi("Identifier", { fg = c.fg })
hi("Function", { fg = s.func })
hi("Statement", { fg = s.keyword })
hi("Conditional", { fg = s.keyword })
hi("Repeat", { fg = s.keyword })
hi("Label", { fg = s.keyword })
hi("Operator", { fg = s.operator })
hi("Keyword", { fg = s.keyword })
hi("Exception", { fg = s.error_col })
hi("PreProc", { fg = s.namespace })
hi("Include", { fg = s.keyword })
hi("Define", { fg = s.keyword })
hi("Macro", { fg = s.builtin })
hi("PreCondit", { fg = s.keyword })
hi("Type", { fg = s.type_name })
hi("StorageClass", { fg = s.func })
hi("Structure", { fg = s.type_name })
hi("Typedef", { fg = s.type_name })
hi("Special", { fg = s.special })
hi("SpecialChar", { fg = s.special })
hi("Tag", { fg = s.func })
hi("Delimiter", { fg = s.operator })
hi("SpecialComment", { fg = s.comment, bold = true })
hi("Debug", { fg = s.error_col })
hi("Underlined", { underline = true })
hi("Error", { fg = s.error_col, bold = true })
hi("Todo", { fg = s.warn_col, bg = c.bg1, bold = true })

-- ─── Treesitter ───────────────────────────────────────────────────────────────
hi("@variable", { fg = c.fg })
hi("@variable.builtin", { fg = s.builtin })
hi("@variable.parameter", { fg = s.param })
hi("@variable.member", { fg = s.field })

hi("@string", { fg = s.string })
hi("@string.escape", { fg = s.special })
hi("@string.special", { fg = s.special })
hi("@string.regex", { fg = s.special })
hi("@string.documentation", { fg = s.comment, italic = true })

hi("@number", { fg = s.number })
hi("@float", { fg = s.number })
hi("@boolean", { fg = s.boolean, bold = true })

hi("@function", { fg = s.func })
hi("@function.builtin", { fg = s.builtin })
hi("@function.call", { fg = s.func })
hi("@function.method", { fg = s.func })
hi("@function.method.call", { fg = s.func })
hi("@constructor", { fg = s.type_name })

hi("@keyword", { fg = s.keyword })
hi("@keyword.function", { fg = s.func_kw })
hi("@keyword.return", { fg = s.func })
hi("@keyword.operator", { fg = s.operator })
hi("@keyword.import", { fg = s.keyword })
hi("@keyword.conditional", { fg = s.keyword })
hi("@keyword.repeat", { fg = s.keyword })
hi("@keyword.exception", { fg = s.error_col })

hi("@type", { fg = s.type_name })
hi("@type.builtin", { fg = s.type_name })
hi("@type.definition", { fg = s.type_name, bold = true })
hi("@type.qualifier", { fg = s.keyword })
hi("@keyword.storage", { fg = s.func })
hi("@storageclass", { fg = s.func })
hi("@keyword.modifier", { fg = s.func })

hi("@constant", { fg = s.constant })
hi("@constant.builtin", { fg = s.builtin })
hi("@constant.macro", { fg = s.builtin })

hi("@module", { fg = s.namespace })
hi("@namespace", { fg = s.namespace })
hi("@label", { fg = s.keyword })

hi("@comment", { fg = s.comment })
hi("@comment.documentation", { fg = s.comment, italic = true })
hi("@comment.todo", { fg = s.warn_col, bold = true })
hi("@comment.warning", { fg = s.warn_col, bold = true })
hi("@comment.error", { fg = s.error_col, bold = true })
hi("@comment.note", { fg = s.info_col })

hi("@operator", { fg = s.operator })
hi("@punctuation.bracket", { fg = c.fg })
hi("@punctuation.delimiter", { fg = c.fg })
hi("@punctuation.special", { fg = s.special })

hi("@tag", { fg = s.keyword })
hi("@tag.attribute", { fg = s.builtin })
hi("@tag.delimiter", { fg = s.operator })

hi("@markup.heading", { fg = c.br_white, bold = true })
hi("@markup.raw", { fg = s.string })
hi("@markup.link", { fg = c.cyan, underline = true })
hi("@markup.link.label", { fg = s.builtin })
hi("@markup.italic", { italic = true })
hi("@markup.strong", { bold = true })
hi("@markup.list", { fg = s.keyword })
hi("@markup.quote", { fg = s.comment, italic = true })

-- ─── LSP ──────────────────────────────────────────────────────────────────────
hi("LspReferenceText", { bg = s.selection })
hi("LspReferenceRead", { bg = s.selection })
hi("LspReferenceWrite", { bg = s.selection, underline = true })
hi("LspInlayHint", { fg = c.br_black, bg = c.bg1, italic = true })
hi("LspSignatureActiveParameter", { fg = c.br_yellow, bold = true })

-- ─── Diagnósticos ─────────────────────────────────────────────────────────────
hi("DiagnosticError", { fg = s.error_col })
hi("DiagnosticWarn", { fg = s.warn_col })
hi("DiagnosticInfo", { fg = s.info_col })
hi("DiagnosticHint", { fg = s.hint_col })
hi("DiagnosticUnderlineError", { undercurl = true, sp = s.error_col })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = s.warn_col })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = s.info_col })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = s.hint_col })
hi("DiagnosticVirtualTextError", { fg = s.error_col, bg = c.bg1, italic = true })
hi("DiagnosticVirtualTextWarn", { fg = s.warn_col, bg = c.bg1, italic = true })
hi("DiagnosticVirtualTextInfo", { fg = s.info_col, bg = c.bg1, italic = true })
hi("DiagnosticVirtualTextHint", { fg = s.hint_col, bg = c.bg1, italic = true })

-- ─── Git ──────────────────────────────────────────────────────────────────────
hi("DiffAdd", { bg = s.diff_add })
hi("DiffDelete", { bg = s.diff_del })
hi("DiffChange", { bg = s.diff_change })
hi("DiffText", { bg = s.selection, bold = true })
hi("GitSignsAdd", { fg = c.green })
hi("GitSignsChange", { fg = c.cyan })
hi("GitSignsDelete", { fg = s.error_col })

-- ─── Telescope ────────────────────────────────────────────────────────────────
hi("TelescopeNormal", { fg = c.fg, bg = c.bg2 })
hi("TelescopeBorder", { fg = s.border, bg = c.bg2 })
hi("TelescopePromptNormal", { fg = c.fg, bg = c.bg1 })
hi("TelescopePromptBorder", { fg = s.border, bg = c.bg1 })
hi("TelescopePromptTitle", { fg = c.bg, bg = c.cyan, bold = true })
hi("TelescopePreviewTitle", { fg = c.bg, bg = c.green, bold = true })
hi("TelescopeResultsTitle", { fg = s.border, bg = c.bg2 })
hi("TelescopeSelection", { bg = s.selection })
hi("TelescopeMatching", { fg = s.match_fg, bold = true })

-- ─── nvim-tree ────────────────────────────────────────────────────────────────
hi("NvimTreeNormal", { fg = c.fg, bg = c.bg1 })
hi("NvimTreeFolderIcon", { fg = c.cyan })
hi("NvimTreeFolderName", { fg = c.fg })
hi("NvimTreeOpenedFolderName", { fg = c.br_white })
hi("NvimTreeRootFolder", { fg = c.br_yellow, bold = true })
hi("NvimTreeGitDirty", { fg = s.warn_col })
hi("NvimTreeGitNew", { fg = c.green })
hi("NvimTreeGitDeleted", { fg = s.error_col })
hi("NvimTreeIndentMarker", { fg = s.border })

-- ─── which-key ────────────────────────────────────────────────────────────────
hi("WhichKey", { fg = c.cyan })
hi("WhichKeyGroup", { fg = c.br_white })
hi("WhichKeyDesc", { fg = c.fg })
hi("WhichKeySeparator", { fg = c.br_black })
hi("WhichKeyFloat", { bg = c.bg2 })

-- ─── indent-blankline ─────────────────────────────────────────────────────────
hi("IblIndent", { fg = "#1a1a1a" })
hi("IblScope", { fg = "#222222" })

-- ─── nvim-cmp ─────────────────────────────────────────────────────────────────
hi("CmpItemAbbr", { fg = c.fg })
hi("CmpItemAbbrMatch", { fg = s.match_fg, bold = true })
hi("CmpItemAbbrMatchFuzzy", { fg = s.match_fg })
hi("CmpItemKind", { fg = c.cyan })
hi("CmpItemMenu", { fg = c.br_black })
hi("CmpItemKindFunction", { fg = s.func })
hi("CmpItemKindMethod", { fg = s.func })
hi("CmpItemKindVariable", { fg = c.fg })
hi("CmpItemKindField", { fg = s.field })
hi("CmpItemKindKeyword", { fg = s.keyword })
hi("CmpItemKindText", { fg = s.string })
hi("CmpItemKindModule", { fg = s.namespace })
hi("CmpItemKindClass", { fg = s.type_name })

-- ─── Noice / notify ───────────────────────────────────────────────────────────
hi("NoicePopupBorder", { fg = s.border })
hi("NotifyERRORBorder", { fg = s.error_col })
hi("NotifyWARNBorder", { fg = s.warn_col })
hi("NotifyINFOBorder", { fg = s.info_col })
hi("NotifyDEBUGBorder", { fg = c.br_black })
hi("NotifyERRORTitle", { fg = s.error_col, bold = true })
hi("NotifyWARNTitle", { fg = s.warn_col, bold = true })
hi("NotifyINFOTitle", { fg = s.info_col, bold = true })
