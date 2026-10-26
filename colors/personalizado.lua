-- personalizado.lua — colorscheme portado desde tema VSCode
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "personalizado"
vim.o.background = "dark"
vim.o.termguicolors = true

-- Paleta
local c = {
  -- fondos
  bg          = "#080808",
  bg_alt      = "#0c0c0c",
  bg_soft     = "#212121",
  bg_float    = "#292928",
  bg_hi       = "#333332",
  bg_sel      = "#3d3d3c",
  bg_visual   = "#50504f",

  -- primer plano
  fg          = "#f8f8f2",
  fg_dim      = "#d0d0d0",
  fg_mid      = "#b2b2b1",
  fg_low      = "#8c8c8a",
  fg_muted    = "#6d6d6d",
  fg_gutter   = "#50504f",

  -- acentos principales
  red         = "#FF5E5E",   -- operadores, tags, tipos
  red_bright  = "#FF3E3E",   -- constantes, boolean
  red_soft    = "#D77676",   -- punctuación especial
  orange      = "#FF9431",   -- variables built-in
  orange_fn   = "#D68D5B",   -- llamadas a funciones
  yellow      = "#f3c900",   -- warnings, títulos
  yellow_hi   = "#FFFB2A",   -- storage type
  yellow_ctrl = "#FFD14A",   -- control flow / imports
  amber       = "#FFC107",   -- support functions
  gold        = "#D0B344",   -- headings markdown
  green       = "#69F0AE",   -- strings quoted, modifiers
  green_soft  = "#B8FCB1",   -- clases, interfaces
  green_dim   = "#9AA83A",   -- listas markdown
  teal        = "#80CBC4",   -- funciones
  teal_soft   = "#C9E9E0",   -- brackets round, parámetros
  cyan        = "#00f3c9",   -- info diagnostic, git added
  cyan_bright = "#8CDAFF",   -- atributos, keys
  blue        = "#00a4f3",   -- links, directorios
  blue_soft   = "#6089B4",   -- markup bold/italic
  purple      = "#9575CD",   -- keywords
  purple_soft = "#9872A2",   -- markup quote
  pink        = "#EC407A",   -- DOM / consola
  pink_hot    = "#FF0080",   -- markup raw
  brown       = "#8D6E63",   -- propiedades
  string      = "#F7C376",   -- strings normales
  error       = "#f3002b",
  info        = "#00f3c9",
  hint        = "#a9b9b0",

  -- diff (mezclados con bg para simular alpha)
  diff_add    = "#063029",
  diff_change = "#1e1e1d",
  diff_del    = "#30060d",
  diff_text   = "#433806",

  none        = "NONE",
}

local hi = function(name, opts) vim.api.nvim_set_hl(0, name, opts) end
local link = function(from, to) vim.api.nvim_set_hl(0, from, { link = to }) end

--------------------------------------------------------------------
-- Editor UI
--------------------------------------------------------------------
hi("Normal",              { bg = c.bg, fg = c.fg })
hi("NormalNC",            { bg = c.bg, fg = c.fg })
hi("NormalFloat",         { bg = c.bg_float, fg = c.fg })
hi("FloatBorder",         { bg = c.bg_float, fg = c.bg_sel })
hi("FloatTitle",          { bg = c.bg_float, fg = c.yellow, bold = true })
hi("CursorLine",          { bg = c.bg_soft })
hi("CursorColumn",        { bg = c.bg_soft })
hi("ColorColumn",         { bg = c.bg_soft })
hi("LineNr",              { fg = c.fg_gutter })
hi("LineNrAbove",         { fg = c.fg_gutter })
hi("LineNrBelow",         { fg = c.fg_gutter })
hi("CursorLineNr",        { fg = c.yellow, bold = true })
hi("SignColumn",          { bg = c.bg })
hi("FoldColumn",          { bg = c.bg, fg = c.fg_gutter })
hi("Folded",              { bg = c.bg_float, fg = c.fg_low })
hi("Visual",              { bg = c.bg_visual })
hi("VisualNOS",           { bg = c.bg_sel })
hi("Search",              { bg = "#43a047", fg = c.bg })
hi("IncSearch",           { bg = "#880e4f", fg = c.fg })
hi("CurSearch",           { bg = "#43a047", fg = c.bg })
hi("Substitute",          { bg = "#880e4f", fg = c.fg })
hi("MatchParen",          { bg = c.bg_hi, bold = true })
hi("Pmenu",               { bg = c.bg_float, fg = c.fg_dim })
hi("PmenuSel",            { bg = c.bg_sel, fg = c.yellow })
hi("PmenuSbar",           { bg = c.bg_sel })
hi("PmenuThumb",          { bg = c.fg_muted })
hi("PmenuKind",           { bg = c.bg_float, fg = c.teal })
hi("PmenuKindSel",        { bg = c.bg_sel, fg = c.teal })
hi("PmenuExtra",          { bg = c.bg_float, fg = c.fg_low })
hi("PmenuExtraSel",       { bg = c.bg_sel, fg = c.fg_low })
hi("WildMenu",            { bg = c.bg_sel, fg = c.yellow })
hi("StatusLine",          { bg = c.bg, fg = "#878787" })
hi("StatusLineNC",        { bg = c.bg, fg = c.fg_gutter })
hi("TabLine",             { bg = c.bg_soft, fg = c.fg_mid })
hi("TabLineSel",          { bg = "#000000", fg = "#ffffff" })
hi("TabLineFill",         { bg = c.bg })
hi("WinBar",              { bg = c.bg, fg = c.fg_low })
hi("WinBarNC",            { bg = c.bg, fg = c.fg_gutter })
hi("WinSeparator",        { fg = c.bg_sel })
hi("VertSplit",           { fg = c.bg_sel })
hi("EndOfBuffer",         { fg = c.bg_soft })
hi("NonText",             { fg = c.bg_hi })
hi("Whitespace",          { fg = c.bg_hi })
hi("SpecialKey",          { fg = c.bg_hi })
hi("Conceal",             { fg = c.fg_muted })
hi("Directory",           { fg = c.blue })
hi("Title",               { fg = c.yellow, bold = true })
hi("Question",            { fg = c.info })
hi("MoreMsg",             { fg = c.info })
hi("ModeMsg",             { fg = c.fg })
hi("MsgArea",             { fg = c.fg })
hi("MsgSeparator",        { fg = c.bg_sel })
hi("ErrorMsg",            { fg = c.error })
hi("WarningMsg",          { fg = c.yellow })
hi("Cursor",              { fg = c.bg, bg = c.fg_dim })
hi("lCursor",             { fg = c.bg, bg = c.fg_dim })
hi("CursorIM",            { fg = c.bg, bg = c.fg_dim })
hi("QuickFixLine",        { bg = c.bg_soft })

hi("SpellBad",            { undercurl = true, sp = c.error })
hi("SpellCap",            { undercurl = true, sp = c.blue })
hi("SpellLocal",          { undercurl = true, sp = c.cyan })
hi("SpellRare",           { undercurl = true, sp = c.yellow })

hi("DiffAdd",             { bg = c.diff_add })
hi("DiffChange",          { bg = c.diff_change })
hi("DiffDelete",          { bg = c.diff_del })
hi("DiffText",            { bg = c.diff_text })

--------------------------------------------------------------------
-- Syntax base (grupos clásicos)
--------------------------------------------------------------------
hi("Comment",             { fg = "#808080", italic = true })
hi("Constant",            { fg = c.red_bright })
hi("String",              { fg = c.string })
hi("Character",           { fg = c.green })
hi("Number",              { fg = c.fg_dim })
hi("Float",               { fg = c.fg_dim })
hi("Boolean",             { fg = c.red_bright })
hi("Identifier",          { fg = c.fg })
hi("Function",            { fg = c.teal })
hi("Statement",           { fg = c.purple })
hi("Keyword",             { fg = c.purple })
hi("Conditional",         { fg = c.yellow_ctrl })
hi("Repeat",              { fg = c.purple })
hi("Label",               { fg = c.purple })
hi("Operator",            { fg = c.red })
hi("Exception",           { fg = c.purple })
hi("PreProc",             { fg = c.green })
hi("Include",             { fg = c.yellow_ctrl })
hi("Define",              { fg = c.green })
hi("Macro",               { fg = c.green })
hi("PreCondit",           { fg = c.yellow_ctrl })
hi("Type",                { fg = c.red })
hi("StorageClass",        { fg = c.yellow_hi })
hi("Structure",           { fg = c.red })
hi("Typedef",             { fg = c.yellow_hi })
hi("Special",             { fg = c.orange })
hi("SpecialChar",         { fg = "#8080FF" })
hi("Tag",                 { fg = c.red })
hi("Delimiter",           { fg = c.fg_dim })
hi("SpecialComment",      { fg = c.fg_muted })
hi("Debug",               { fg = "#B267E6" })
hi("Underlined",          { underline = true })
hi("Error",               { fg = c.error })
hi("Todo",                { fg = c.bg, bg = c.yellow, bold = true })

--------------------------------------------------------------------
-- Treesitter (Neovim 0.9+)
--------------------------------------------------------------------
-- Comentarios
link("@comment",                       "Comment")
hi("@comment.documentation",           { fg = c.fg_muted, italic = true })
hi("@comment.error",                   { fg = c.error, bold = true })
hi("@comment.warning",                 { fg = c.yellow, bold = true })
hi("@comment.note",                    { fg = c.cyan, bold = true })
hi("@comment.todo",                    { fg = c.bg, bg = c.yellow, bold = true })

-- Constantes y literales
hi("@constant",                        { fg = c.red_bright })
hi("@constant.builtin",                { fg = c.red_bright })
hi("@constant.macro",                  { fg = c.green })
hi("@string",                          { fg = c.string })
hi("@string.documentation",            { fg = c.string, italic = true })
hi("@string.regexp",                   { fg = c.green })
hi("@string.escape",                   { fg = c.hint })
hi("@string.special",                  { fg = c.green })
hi("@string.special.symbol",           { fg = c.green_dim })
hi("@string.special.url",              { fg = c.blue, underline = true })
hi("@string.special.path",             { fg = c.teal_soft })
hi("@character",                       { fg = c.green })
hi("@character.special",               { fg = "#8080FF" })
hi("@number",                          { fg = c.fg_dim })
hi("@number.float",                    { fg = c.fg_dim })
hi("@boolean",                         { fg = c.red_bright })

-- Módulos / namespaces
hi("@module",                          { fg = c.fg })
hi("@module.builtin",                  { fg = c.orange })
link("@namespace",                     "@module")
hi("@label",                           { fg = c.purple })

-- Tipos
hi("@type",                            { fg = c.red })
hi("@type.builtin",                    { fg = c.yellow_hi })
hi("@type.definition",                 { fg = c.red })
hi("@type.qualifier",                  { fg = c.green })

-- Atributos, propiedades, campos
hi("@attribute",                       { fg = c.cyan_bright })
hi("@attribute.builtin",               { fg = c.cyan_bright })
hi("@property",                        { fg = c.brown })
hi("@field",                           { fg = c.brown })

-- Funciones
hi("@function",                        { fg = c.teal })
hi("@function.builtin",                { fg = c.amber })
hi("@function.call",                   { fg = c.orange_fn })
hi("@function.macro",                  { fg = c.amber })
hi("@function.method",                 { fg = c.teal })
hi("@function.method.call",            { fg = c.orange_fn })
hi("@constructor",                     { fg = c.green_soft })

-- Operadores
hi("@operator",                        { fg = c.red })

-- Keywords
hi("@keyword",                         { fg = c.purple })
hi("@keyword.coroutine",               { fg = c.purple })
hi("@keyword.function",                { fg = c.purple })
hi("@keyword.operator",                { fg = c.red })
hi("@keyword.import",                  { fg = c.yellow_ctrl })
hi("@keyword.type",                    { fg = c.yellow_hi })
hi("@keyword.modifier",                { fg = c.green })
hi("@keyword.repeat",                  { fg = c.purple })
hi("@keyword.return",                  { fg = c.purple })
hi("@keyword.debug",                   { fg = "#B267E6" })
hi("@keyword.exception",               { fg = c.purple })
hi("@keyword.conditional",             { fg = c.yellow_ctrl })
hi("@keyword.conditional.ternary",     { fg = c.red })
hi("@keyword.directive",               { fg = c.green })
hi("@keyword.directive.define",        { fg = c.green })

-- Puntuación
hi("@punctuation.delimiter",           { fg = c.fg_dim })
hi("@punctuation.bracket",             { fg = c.teal_soft })
hi("@punctuation.special",             { fg = c.red_soft })

-- Variables
hi("@variable",                        { fg = c.fg })
hi("@variable.builtin",                { fg = c.orange })
hi("@variable.parameter",              { fg = c.red })
hi("@variable.parameter.builtin",      { fg = c.orange })
hi("@variable.member",                 { fg = c.brown })

-- Markup
hi("@markup",                          { fg = c.fg })
hi("@markup.strong",                   { fg = c.blue_soft, bold = true })
hi("@markup.italic",                   { fg = c.blue_soft, italic = true })
hi("@markup.strikethrough",            { strikethrough = true })
hi("@markup.underline",                { underline = true })
hi("@markup.heading",                  { fg = c.gold, bold = true })
hi("@markup.heading.1",                { fg = c.yellow, bold = true })
hi("@markup.heading.2",                { fg = c.gold, bold = true })
hi("@markup.heading.3",                { fg = c.orange, bold = true })
hi("@markup.heading.4",                { fg = c.orange_fn, bold = true })
hi("@markup.heading.5",                { fg = c.red_bright, bold = true })
hi("@markup.heading.6",                { fg = c.red, bold = true })
hi("@markup.quote",                    { fg = c.purple_soft, italic = true })
hi("@markup.math",                     { fg = c.cyan_bright })
hi("@markup.link",                     { fg = c.teal_soft })
hi("@markup.link.label",               { fg = c.fg_dim })
hi("@markup.link.url",                 { fg = c.fg_muted, underline = true })
hi("@markup.raw",                      { fg = c.pink_hot })
hi("@markup.raw.block",                { fg = c.fg })
hi("@markup.list",                     { fg = c.green_dim })
hi("@markup.list.checked",             { fg = c.green })
hi("@markup.list.unchecked",           { fg = c.fg_muted })

-- Diff
hi("@diff.plus",                       { fg = "#219186" })
hi("@diff.minus",                      { fg = "#DC322F" })
hi("@diff.delta",                      { fg = "#CB4B16" })

-- Tags (HTML/JSX/XML)
hi("@tag",                             { fg = c.red })
hi("@tag.builtin",                     { fg = c.red })
hi("@tag.attribute",                   { fg = c.cyan_bright })
hi("@tag.delimiter",                   { fg = c.fg_dim })

--------------------------------------------------------------------
-- Overrides específicos por lenguaje
--------------------------------------------------------------------
-- Lua
hi("@constructor.lua",                 { fg = c.teal_soft })
hi("@variable.member.lua",             { fg = c.brown })

-- JavaScript / TypeScript
hi("@variable.builtin.javascript",     { fg = c.orange })
hi("@variable.builtin.typescript",     { fg = c.orange })
hi("@constructor.tsx",                 { fg = c.green_soft })
hi("@tag.tsx",                         { fg = c.red })
hi("@tag.attribute.tsx",               { fg = c.cyan_bright })
hi("@keyword.export",                  { fg = c.yellow_ctrl })

-- Python
hi("@variable.builtin.python",         { fg = c.orange })
hi("@function.builtin.python",         { fg = c.amber })
hi("@type.builtin.python",             { fg = c.yellow_hi })

-- Java (usuario tiene setup java)
hi("@type.java",                       { fg = c.red })
hi("@type.builtin.java",               { fg = c.yellow_hi })
hi("@keyword.modifier.java",           { fg = c.green })
hi("@variable.member.java",            { fg = c.brown })
hi("@constant.java",                   { fg = c.red_bright })

-- JSON
hi("@property.json",                   { fg = c.cyan_bright })
hi("@string.json",                     { fg = c.string })

-- HTML / CSS
hi("@tag.html",                        { fg = c.red })
hi("@tag.attribute.html",              { fg = c.cyan_bright })
hi("@string.css",                      { fg = c.string })
hi("@type.css",                        { fg = c.fg_dim })
hi("@property.css",                    { fg = "#FFD27D" })
hi("@number.css",                      { fg = c.fg_dim })
hi("@attribute.css",                   { fg = "#A27272" })

-- Markdown
hi("@markup.heading.1.markdown",       { fg = c.yellow, bold = true })
hi("@markup.heading.2.markdown",       { fg = c.gold, bold = true })
hi("@markup.raw.markdown_inline",      { fg = c.pink_hot })

--------------------------------------------------------------------
-- LSP semantic tokens
--------------------------------------------------------------------
hi("@lsp.type.class",                  { fg = c.red })
hi("@lsp.type.decorator",              { fg = c.amber })
hi("@lsp.type.enum",                   { fg = c.red })
hi("@lsp.type.enumMember",             { fg = c.red_bright })
hi("@lsp.type.event",                  { fg = c.orange })
hi("@lsp.type.function",               { fg = c.teal })
hi("@lsp.type.interface",              { fg = c.green_soft })
hi("@lsp.type.keyword",                { fg = c.purple })
hi("@lsp.type.macro",                  { fg = c.amber })
hi("@lsp.type.method",                 { fg = c.teal })
hi("@lsp.type.modifier",               { fg = c.green })
hi("@lsp.type.namespace",              { fg = c.fg })
hi("@lsp.type.number",                 { fg = c.fg_dim })
hi("@lsp.type.operator",               { fg = c.red })
hi("@lsp.type.parameter",              { fg = c.red })
hi("@lsp.type.property",               { fg = c.brown })
hi("@lsp.type.regexp",                 { fg = c.green })
hi("@lsp.type.string",                 { fg = c.string })
hi("@lsp.type.struct",                 { fg = c.red })
hi("@lsp.type.type",                   { fg = c.red })
hi("@lsp.type.typeParameter",          { fg = c.red })
hi("@lsp.type.variable",               { fg = c.fg })
hi("@lsp.type.boolean",                { fg = c.red_bright })
hi("@lsp.type.builtinType",            { fg = c.yellow_hi })
hi("@lsp.type.comment",                { link = "Comment" })
hi("@lsp.typemod.function.defaultLibrary", { fg = c.amber })
hi("@lsp.typemod.method.defaultLibrary",   { fg = c.amber })
hi("@lsp.typemod.variable.defaultLibrary", { fg = c.orange })
hi("@lsp.typemod.type.defaultLibrary",     { fg = c.yellow_hi })
hi("@lsp.typemod.class.defaultLibrary",    { fg = c.green_soft })
hi("@lsp.typemod.variable.readonly",       { fg = c.red_bright })
hi("@lsp.typemod.variable.constant",       { fg = c.red_bright })
hi("@lsp.typemod.property.readonly",       { fg = c.brown })
hi("@lsp.mod.deprecated",                  { strikethrough = true })
hi("@lsp.mod.readonly",                    { fg = c.red_bright })

--------------------------------------------------------------------
-- Diagnostics
--------------------------------------------------------------------
hi("DiagnosticError",                  { fg = c.error })
hi("DiagnosticWarn",                   { fg = c.yellow })
hi("DiagnosticInfo",                   { fg = c.info })
hi("DiagnosticHint",                   { fg = c.hint })
hi("DiagnosticOk",                     { fg = c.green })
hi("DiagnosticUnnecessary",            { fg = c.fg_muted })
hi("DiagnosticDeprecated",             { fg = c.fg_muted, strikethrough = true })
hi("DiagnosticUnderlineError",         { undercurl = true, sp = c.error })
hi("DiagnosticUnderlineWarn",          { undercurl = true, sp = c.yellow })
hi("DiagnosticUnderlineInfo",          { undercurl = true, sp = c.info })
hi("DiagnosticUnderlineHint",          { undercurl = true, sp = c.hint })
hi("DiagnosticVirtualTextError",       { fg = c.error, bg = "#20070c" })
hi("DiagnosticVirtualTextWarn",        { fg = c.yellow, bg = "#201c07" })
hi("DiagnosticVirtualTextInfo",        { fg = c.info,  bg = "#07201c" })
hi("DiagnosticVirtualTextHint",        { fg = c.hint,  bg = "#181a19" })
hi("DiagnosticSignError",              { fg = c.error })
hi("DiagnosticSignWarn",               { fg = c.yellow })
hi("DiagnosticSignInfo",               { fg = c.info })
hi("DiagnosticSignHint",               { fg = c.hint })
hi("DiagnosticFloatingError",          { fg = c.error })
hi("DiagnosticFloatingWarn",           { fg = c.yellow })
hi("DiagnosticFloatingInfo",           { fg = c.info })
hi("DiagnosticFloatingHint",           { fg = c.hint })

-- LSP references / inlay hints
hi("LspReferenceText",                 { bg = c.bg_hi })
hi("LspReferenceRead",                 { bg = c.bg_hi })
hi("LspReferenceWrite",                { bg = c.bg_hi, underline = true })
hi("LspInlayHint",                     { fg = "#969696", bg = c.bg_soft, italic = true })
hi("LspCodeLens",                      { fg = c.fg_muted, italic = true })
hi("LspSignatureActiveParameter",      { fg = c.yellow, bold = true })

--------------------------------------------------------------------
-- Git signs / gitgutter
--------------------------------------------------------------------
hi("GitSignsAdd",                      { fg = c.cyan })
hi("GitSignsChange",                   { fg = c.yellow })
hi("GitSignsDelete",                   { fg = c.error })
hi("GitSignsAddNr",                    { fg = c.cyan })
hi("GitSignsChangeNr",                 { fg = c.yellow })
hi("GitSignsDeleteNr",                 { fg = c.error })
hi("GitSignsAddLn",                    { bg = c.diff_add })
hi("GitSignsChangeLn",                 { bg = c.diff_change })
hi("GitSignsDeleteLn",                 { bg = c.diff_del })

hi("SignAdd",                          { fg = c.cyan })
hi("SignChange",                       { fg = c.yellow })
hi("SignDelete",                       { fg = c.error })

--------------------------------------------------------------------
-- Bracket rainbow (Neovim built-in matchbrackets treesitter)
--------------------------------------------------------------------
hi("RainbowDelimiterYellow",           { fg = "#ffd700" })
hi("RainbowDelimiterViolet",           { fg = "#da70d6" })
hi("RainbowDelimiterBlue",             { fg = "#179fff" })
hi("RainbowDelimiterOrange",           { fg = c.orange })
hi("RainbowDelimiterGreen",            { fg = c.green })
hi("RainbowDelimiterRed",              { fg = c.red })
hi("RainbowDelimiterCyan",             { fg = c.cyan })

--------------------------------------------------------------------
-- Indent-blankline
--------------------------------------------------------------------
hi("IblIndent",                        { fg = c.bg_hi })
hi("IblScope",                         { fg = c.fg_gutter })
hi("IblWhitespace",                    { fg = c.bg_hi })
link("IndentBlanklineChar",            "IblIndent")
link("IndentBlanklineContextChar",     "IblScope")

--------------------------------------------------------------------
-- Telescope
--------------------------------------------------------------------
hi("TelescopeBorder",                  { fg = c.bg_sel, bg = c.bg })
hi("TelescopeNormal",                  { bg = c.bg, fg = c.fg })
hi("TelescopePromptNormal",            { bg = c.bg_float })
hi("TelescopePromptBorder",            { bg = c.bg_float, fg = c.bg_visual })
hi("TelescopePromptTitle",             { bg = c.bg_float, fg = c.yellow, bold = true })
hi("TelescopePromptPrefix",            { bg = c.bg_float, fg = c.yellow })
hi("TelescopePromptCounter",           { bg = c.bg_float, fg = c.fg_low })
hi("TelescopeResultsNormal",           { bg = c.bg })
hi("TelescopeResultsBorder",           { bg = c.bg, fg = c.bg_sel })
hi("TelescopeResultsTitle",            { bg = c.bg, fg = c.bg })
hi("TelescopePreviewNormal",           { bg = c.bg_alt })
hi("TelescopePreviewBorder",           { bg = c.bg_alt, fg = c.bg_sel })
hi("TelescopePreviewTitle",            { bg = c.bg_alt, fg = c.blue, bold = true })
hi("TelescopeSelection",               { bg = c.bg_soft, fg = c.yellow })
hi("TelescopeSelectionCaret",          { bg = c.bg_soft, fg = c.yellow })
hi("TelescopeMultiSelection",          { fg = c.orange })
hi("TelescopeMatching",                { fg = c.fg, bold = true })

--------------------------------------------------------------------
-- NvimTree / neo-tree
--------------------------------------------------------------------
hi("NvimTreeNormal",                   { bg = c.bg_alt, fg = c.fg_low })
hi("NvimTreeNormalNC",                 { bg = c.bg_alt, fg = c.fg_low })
hi("NvimTreeWinSeparator",             { bg = c.bg_alt, fg = c.bg_alt })
hi("NvimTreeCursorLine",               { bg = c.bg_soft })
hi("NvimTreeFolderName",               { fg = c.fg_low })
hi("NvimTreeOpenedFolderName",         { fg = c.fg_mid, bold = true })
hi("NvimTreeEmptyFolderName",          { fg = c.fg_muted })
hi("NvimTreeRootFolder",               { fg = c.yellow, bold = true })
hi("NvimTreeFolderIcon",               { fg = c.blue })
hi("NvimTreeFileIcon",                 { fg = c.fg_low })
hi("NvimTreeSpecialFile",              { fg = c.yellow, underline = true })
hi("NvimTreeGitDirty",                 { fg = c.yellow })
hi("NvimTreeGitNew",                   { fg = c.cyan })
hi("NvimTreeGitDeleted",               { fg = c.error })
hi("NvimTreeGitStaged",                { fg = c.green })
hi("NvimTreeIndentMarker",             { fg = c.bg_hi })
hi("NvimTreeSymlink",                  { fg = c.cyan_bright })

hi("NeoTreeNormal",                    { bg = c.bg_alt, fg = c.fg_low })
hi("NeoTreeNormalNC",                  { bg = c.bg_alt, fg = c.fg_low })
hi("NeoTreeRootName",                  { fg = c.yellow, bold = true })
hi("NeoTreeDirectoryName",             { fg = c.fg_low })
hi("NeoTreeDirectoryIcon",             { fg = c.blue })
hi("NeoTreeFileName",                  { fg = c.fg_low })
hi("NeoTreeIndentMarker",              { fg = c.bg_hi })
hi("NeoTreeGitAdded",                  { fg = c.cyan })
hi("NeoTreeGitModified",               { fg = c.yellow })
hi("NeoTreeGitDeleted",                { fg = c.error })
hi("NeoTreeGitUntracked",              { fg = c.cyan })

--------------------------------------------------------------------
-- nvim-cmp
--------------------------------------------------------------------
hi("CmpItemAbbr",                      { fg = c.fg_dim })
hi("CmpItemAbbrDeprecated",            { fg = c.fg_muted, strikethrough = true })
hi("CmpItemAbbrMatch",                 { fg = c.yellow, bold = true })
hi("CmpItemAbbrMatchFuzzy",            { fg = c.yellow, bold = true })
hi("CmpItemMenu",                      { fg = c.fg_low, italic = true })
hi("CmpItemKindDefault",               { fg = c.fg_dim })
hi("CmpItemKindText",                  { fg = c.fg })
hi("CmpItemKindMethod",                { fg = c.teal })
hi("CmpItemKindFunction",              { fg = c.teal })
hi("CmpItemKindConstructor",           { fg = c.green_soft })
hi("CmpItemKindField",                 { fg = c.brown })
hi("CmpItemKindVariable",              { fg = c.fg })
hi("CmpItemKindClass",                 { fg = c.red })
hi("CmpItemKindInterface",             { fg = c.green_soft })
hi("CmpItemKindModule",                { fg = c.fg })
hi("CmpItemKindProperty",              { fg = c.brown })
hi("CmpItemKindUnit",                  { fg = c.fg_dim })
hi("CmpItemKindValue",                 { fg = c.red_bright })
hi("CmpItemKindEnum",                  { fg = c.red })
hi("CmpItemKindKeyword",               { fg = c.purple })
hi("CmpItemKindSnippet",               { fg = c.yellow })
hi("CmpItemKindColor",                 { fg = c.orange })
hi("CmpItemKindFile",                  { fg = c.fg_dim })
hi("CmpItemKindReference",             { fg = c.cyan_bright })
hi("CmpItemKindFolder",                { fg = c.blue })
hi("CmpItemKindEnumMember",            { fg = c.red_bright })
hi("CmpItemKindConstant",              { fg = c.red_bright })
hi("CmpItemKindStruct",                { fg = c.red })
hi("CmpItemKindEvent",                 { fg = c.orange })
hi("CmpItemKindOperator",              { fg = c.red })
hi("CmpItemKindTypeParameter",         { fg = c.red })

--------------------------------------------------------------------
-- Which-key
--------------------------------------------------------------------
hi("WhichKey",                         { fg = c.yellow })
hi("WhichKeyGroup",                    { fg = c.blue })
hi("WhichKeyDesc",                     { fg = c.fg_dim })
hi("WhichKeySeparator",                { fg = c.fg_low })
hi("WhichKeyValue",                    { fg = c.fg_low })
hi("WhichKeyBorder",                   { fg = c.bg_sel })
hi("WhichKeyFloat",                    { bg = c.bg_alt })

--------------------------------------------------------------------
-- Notify / noice
--------------------------------------------------------------------
hi("NotifyERRORBorder",                { fg = c.error })
hi("NotifyWARNBorder",                 { fg = c.yellow })
hi("NotifyINFOBorder",                 { fg = c.info })
hi("NotifyDEBUGBorder",                { fg = c.fg_muted })
hi("NotifyTRACEBorder",                { fg = c.purple })
hi("NotifyERRORIcon",                  { fg = c.error })
hi("NotifyWARNIcon",                   { fg = c.yellow })
hi("NotifyINFOIcon",                   { fg = c.info })
hi("NotifyERRORTitle",                 { fg = c.error, bold = true })
hi("NotifyWARNTitle",                  { fg = c.yellow, bold = true })
hi("NotifyINFOTitle",                  { fg = c.info, bold = true })

hi("NoiceCmdlinePopupBorder",          { fg = c.blue })
hi("NoiceCmdlineIcon",                 { fg = c.yellow })
hi("NoiceConfirmBorder",               { fg = c.yellow })

--------------------------------------------------------------------
-- Bufferline / lualine
--------------------------------------------------------------------
hi("BufferLineFill",                   { bg = c.bg })
hi("BufferLineBufferSelected",         { bg = "#000000", fg = "#ffffff", bold = true })
hi("BufferLineBufferVisible",          { bg = c.bg_soft, fg = c.fg_dim })
hi("BufferLineIndicatorSelected",      { fg = c.yellow })
hi("BufferLineSeparator",              { bg = c.bg, fg = c.bg })
hi("BufferLineTabSelected",            { bg = "#000000", fg = c.yellow, bold = true })

--------------------------------------------------------------------
-- Lazy / Mason / Dashboard
--------------------------------------------------------------------
hi("LazyH1",                           { fg = c.yellow, bold = true })
hi("LazyButton",                       { fg = c.fg_dim })
hi("LazyButtonActive",                 { fg = c.yellow, bold = true })
hi("LazyProgressDone",                 { fg = c.green })
hi("LazyProgressTodo",                 { fg = c.fg_gutter })
hi("LazySpecial",                      { fg = c.cyan_bright })

hi("MasonHeader",                      { fg = c.bg, bg = c.yellow, bold = true })
hi("MasonHighlight",                   { fg = c.yellow })
hi("MasonMuted",                       { fg = c.fg_low })
hi("MasonMutedBlock",                  { fg = c.fg_low, bg = c.bg_soft })

hi("DashboardHeader",                  { fg = c.yellow })
hi("DashboardCenter",                  { fg = c.fg_dim })
hi("DashboardShortcut",                { fg = c.cyan })
hi("DashboardFooter",                  { fg = c.fg_muted, italic = true })

--------------------------------------------------------------------
-- Mini
--------------------------------------------------------------------
hi("MiniIndentscopeSymbol",            { fg = c.fg_gutter })
hi("MiniStatuslineFilename",           { fg = c.fg_low, bg = c.bg })
hi("MiniStatuslineModeNormal",         { fg = c.bg, bg = c.yellow, bold = true })
hi("MiniStatuslineModeInsert",         { fg = c.bg, bg = c.green, bold = true })
hi("MiniStatuslineModeVisual",         { fg = c.bg, bg = c.purple, bold = true })

--------------------------------------------------------------------
-- Terminal colors
--------------------------------------------------------------------
vim.g.terminal_color_0  = "#000000"
vim.g.terminal_color_1  = "#cd3131"
vim.g.terminal_color_2  = "#0dbc79"
vim.g.terminal_color_3  = "#e5e510"
vim.g.terminal_color_4  = "#2472c8"
vim.g.terminal_color_5  = "#bc3fbc"
vim.g.terminal_color_6  = "#11a8cd"
vim.g.terminal_color_7  = "#e5e5e5"
vim.g.terminal_color_8  = "#666666"
vim.g.terminal_color_9  = "#f14c4c"
vim.g.terminal_color_10 = "#23d18b"
vim.g.terminal_color_11 = "#f5f543"
vim.g.terminal_color_12 = "#3b8eea"
vim.g.terminal_color_13 = "#d670d6"
vim.g.terminal_color_14 = "#29b8db"
vim.g.terminal_color_15 = "#e5e5e5"
