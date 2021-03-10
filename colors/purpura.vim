scriptencoding utf-8

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="purpura"

" Highlighting function (inspiration from https://github.com/chriskempson/base16-vim)
if &t_Co >= 256
    let g:purpura_term256=1
elseif !exists("g:purpura_term256")
    let g:purpura_term256=0
endif
fun! <sid>hi(group, fg, bg, attr, sp)
  if !empty(a:fg)
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" . (g:purpura_term256 ? a:fg.cterm256 : a:fg.cterm)
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" . (g:purpura_term256 ? a:bg.cterm256 : a:bg.cterm)
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if !empty(a:sp)
    exec "hi " . a:group . " guisp=" . a:sp.gui
  endif
endfun
fun! <sid>trans(group, fg, bg, attr, sp)
  if !empty(a:fg)
    exec "trans " . a:group . " guifg=" . a:fg.gui . " ctermfg=" . (g:purpura_term256 ? a:fg.cterm256 : a:fg.cterm)
  endif
  if !empty(a:bg)
    exec "trans " . a:group . " guibg=" . a:bg.gui . " ctermbg=" . (g:purpura_term256 ? a:bg.cterm256 : a:bg.cterm)
  endif
  if a:attr != ""
    exec "trans " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if !empty(a:sp)
    exec "trans " . a:group . " guisp=" . a:sp.gui
  endif
endfun

" ------------------
" Color definitions:
" ------------------

" Terminal colors (base16):
let s:cterm00 = "00"
let s:cterm03 = "08"
let s:cterm05 = "07"
let s:cterm07 = "15"
let s:cterm08 = "01"
let s:cterm0A = "03"
let s:cterm0B = "02"
let s:cterm0C = "06"
let s:cterm0D = "04"
let s:cterm0E = "05"
if exists('base16colorspace') && base16colorspace == "256"
  let s:cterm01 = "18"
  let s:cterm02 = "19"
  let s:cterm04 = "20"
  let s:cterm06 = "21"
  let s:cterm09 = "16"
  let s:cterm0F = "17"
else
  let s:cterm01 = "00"
  let s:cterm02 = "08"
  let s:cterm04 = "07"
  let s:cterm06 = "07"
  let s:cterm09 = "06"
  let s:cterm0F = "03"
endif

" General appearance colors:
" (some of them may be unused)

let s:cdNone = {'gui': 'NONE', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdFront = {'gui': '#f0f0f0', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdBack = {'gui': '#1e0030', 'cterm': 'NONE', 'cterm256': 'NONE'}

let s:cdTabCurrent = {'gui': '#5e0066', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdTabOther = {'gui': '#1e0030', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdTabOutside = {'gui': '#1e0030', 'cterm': 'NONE', 'cterm256': 'NONE'}

let s:cdLeftDark = {'gui': '#1e0030', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdLeftMid = {'gui': '#1e0030', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdLeftLight = {'gui': '#ff00ff', 'cterm': 'NONE', 'cterm256': 'NONE'}

let s:cdPopupFront = {'gui': '#BBBBBB', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdPopupBack = {'gui': '#610369', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdPopupHighlightBlue = {'gui': '#1f0121', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdPopupHighlightGray = {'gui': '#610369', 'cterm': 'NONE', 'cterm256': 'NONE'}

let s:cdSplitLight = {'gui': '#898989', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdSplitDark = {'gui': '#444444', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdSplitThumb = {'gui': '#424242', 'cterm': 'NONE', 'cterm256': 'NONE'}

let s:cdCursorDarkDark = {'gui': '#350057', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdCursorDark = {'gui': '#51504F', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdCursorLight = {'gui': '#AEAFAD', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdSelection = {'gui': '#7B03C9', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdLineNumber = {'gui': '#7B03C9', 'cterm': 'NONE', 'cterm256': 'NONE'}

let s:cdDiffRedDark = {'gui': '#4B1818', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdDiffRedLight = {'gui': '#6F1313', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdDiffRedLightLight = {'gui': '#FB0101', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdDiffGreenDark = {'gui': '#373D29', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdDiffGreenLight = {'gui': '#4B5632', 'cterm': 'NONE', 'cterm256': 'NONE'}

let s:cdSearchCurrent = {'gui': '#ffec8c', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdSearch = {'gui': '#9f44db', 'cterm': 'NONE', 'cterm256': 'NONE'}

" Syntax colors:

if !exists("g:purpura_conservative")
    let g:purpura_conservative=0
endif

let s:cdGray = {'gui': '#808080', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdDarkBlue = {'gui': '#223E55', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdLightBlue = {'gui': '#73bbf5', 'cterm': 'NONE', 'cterm256': 'NONE'}
if g:purpura_conservative | let s:cdLightBlue = s:cdFront | endif
let s:cdViolet = {'gui': '#B467E4', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdVioletLighter = {'gui': '#B467E4', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdVioletDark = {'gui': '#7A1EB2', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdLightTeal = {'gui': '#79FCEB', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdPinkGreen = {'gui': '#acff59', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdPinkGreenDark = {'gui': '#4C7327', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdLightGreen = {'gui': '#B5CEA8', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdRed = {'gui': '#F44747', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdLightYellow = {'gui': '#ede093', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdLightRed = {'gui': '#D16969', 'cterm': 'NONE', 'cterm256': 'NONE'}
if g:purpura_conservative | let s:cdLightRed = s:cdLightYellow | endif
let s:cdVeryLightGreenOrange = {'gui': '#D7BA7D', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdVeryLightGreen = {'gui': '#FFC233', 'cterm': 'NONE', 'cterm256': 'NONE'}
if g:purpura_conservative | let s:cdVeryLightGreen = s:cdFront | endif
let s:cdPink = {'gui': '#ff00d4', 'cterm': 'NONE', 'cterm256': 'NONE'}
if g:purpura_conservative | let s:cdPink = s:cdPink | endif

" Vim editor colors
"    <sid>hi(GROUP, FOREGROUND, BACKGROUND, ATTRIBUTE, SPECIAL)
call <sid>hi('Normal', s:cdFront, s:cdBack, 'none', {})
call <sid>hi('ColorColumn', {}, s:cdCursorDarkDark, 'none', {})
call <sid>hi('Cursor', s:cdCursorDark, s:cdCursorLight, 'none', {})
call <sid>hi('CursorLine', {}, s:cdCursorDarkDark, 'none', {})
call <sid>hi('CursorColumn', {}, s:cdCursorDarkDark, 'none', {})
call <sid>hi('Directory', s:cdPink, s:cdBack, 'none', {})
call <sid>hi('DiffAdd', {}, s:cdDiffGreenDark, 'none', {})
call <sid>hi('DiffChange', {}, s:cdDiffRedDark, 'none', {})
call <sid>hi('DiffDelete', {}, s:cdDiffRedLight, 'none', {})
call <sid>hi('DiffText', {}, s:cdDiffRedLight, 'none', {})
call <sid>hi('EndOfBuffer', s:cdLineNumber, s:cdBack, 'none', {})
call <sid>hi('ErrorMsg', s:cdRed, s:cdBack, 'none', {})
call <sid>hi('VertSplit', s:cdSplitDark, s:cdBack, 'none', {})
call <sid>hi('Folded', s:cdLeftLight, s:cdLeftDark, 'underline', {})
call <sid>hi('FoldColumn', s:cdLineNumber, s:cdBack, 'none', {})
call <sid>hi('SignColumn', {}, s:cdBack, 'none', {})
call <sid>hi('IncSearch', s:cdNone, s:cdSearchCurrent, 'none', {})
call <sid>hi('LineNr', s:cdLineNumber, s:cdBack, 'none', {})
call <sid>hi('CursorLineNr', s:cdPopupFront, s:cdBack, 'none', {})
call <sid>hi('MatchParen', s:cdNone, s:cdCursorDark, 'none', {})
call <sid>hi('ModeMsg', s:cdFront, s:cdLeftDark, 'none', {})
call <sid>hi('MoreMsg', s:cdFront, s:cdLeftDark, 'none', {})
call <sid>hi('NonText', s:cdLineNumber, s:cdBack, 'none', {})
call <sid>hi('Pmenu', s:cdPopupFront, s:cdPopupBack, 'none', {})
call <sid>hi('PmenuSel', s:cdPopupFront, s:cdPopupHighlightBlue, 'none', {})
call <sid>hi('PmenuSbar', {}, s:cdPopupHighlightGray, 'none', {})
call <sid>hi('PmenuThumb', {}, s:cdPopupFront, 'none', {})
call <sid>hi('Question', s:cdPink, s:cdBack, 'none', {})
call <sid>hi('Search', s:cdNone, s:cdSearch, 'none', {})
call <sid>hi('SpecialKey', s:cdPink, s:cdNone, 'none', {})
call <sid>hi('SpellBad', s:cdNone, s:cdNone, 'undercurl', {})
call <sid>hi('SpellCap', s:cdNone, s:cdNone, 'undercurl', {})
call <sid>hi('SpellLocal', s:cdNone, s:cdNone, 'undercurl', {})
call <sid>hi('StatusLine', s:cdFront, s:cdLeftMid, 'none', {})
call <sid>hi('StatusLineNC', s:cdFront, s:cdLeftDark, 'none', {})
call <sid>hi('TabLine', s:cdFront, s:cdTabOther, 'none', {})
call <sid>hi('TabLineFill', s:cdFront, s:cdTabOutside, 'none', {})
call <sid>hi('TabLineSel', s:cdFront, s:cdTabCurrent, 'none', {})
call <sid>hi('Title', s:cdNone, s:cdNone, 'bold', {})
call <sid>hi('Visual', s:cdNone, s:cdSelection, 'none', {})
call <sid>hi('VisualNOS', s:cdNone, s:cdSelection, 'none', {})
call <sid>hi('WarningMsg', s:cdLightYellow, s:cdBack, 'none', {})
call <sid>hi('WildMenu', s:cdNone, s:cdSelection, 'none', {})

call <sid>hi('Comment', s:cdVioletDark, {}, 'bold', {})

call <sid>hi('Constant', s:cdPink, {}, 'none', {})
call <sid>hi('String', s:cdLightYellow, {}, 'none', {})
call <sid>hi('Character', s:cdLightYellow, {}, 'none', {})
call <sid>hi('Number', s:cdLightGreen, {}, 'none', {})
call <sid>hi('Boolean', s:cdPink, {}, 'none', {})
call <sid>hi('Float', s:cdLightGreen, {}, 'none', {})

call <sid>hi('Identifier', s:cdLightBlue, {}, 'none', {})
call <sid>hi('Function', s:cdVeryLightGreen, {}, 'none', {})

call <sid>hi('Statement', s:cdPink, {}, 'none', {})
call <sid>hi('Conditional', s:cdPink, {}, 'none', {})
call <sid>hi('Repeat', s:cdPink, {}, 'none', {})
call <sid>hi('Label', s:cdPink, {}, 'none', {})
call <sid>hi('Operator', s:cdFront, {}, 'none', {})
call <sid>hi('Keyword', s:cdPink, {}, 'none', {})
call <sid>hi('Exception', s:cdPink, {}, 'none', {})

call <sid>hi('PreProc', s:cdPink, {}, 'none', {})
call <sid>hi('Include', s:cdPink, {}, 'none', {})
call <sid>hi('Define', s:cdPink, {}, 'none', {})
call <sid>hi('Macro', s:cdPink, {}, 'none', {})
call <sid>hi('PreCondit', s:cdPink, {}, 'none', {})

call <sid>hi('Type', s:cdPink, {}, 'none', {})
call <sid>hi('StorageClass', s:cdPink, {}, 'none', {})
call <sid>hi('Structure', s:cdPink, {}, 'none', {})
call <sid>hi('Typedef', s:cdPink, {}, 'none', {})

call <sid>hi('Special', s:cdFront, {}, 'none', {})
call <sid>hi('SpecialChar', s:cdFront, {}, 'none', {})
call <sid>hi('Tag', s:cdFront, {}, 'none', {})
call <sid>hi('Delimiter', s:cdFront, {}, 'none', {})
call <sid>hi('SpecialComment', s:cdViolet, {}, 'none', {})
call <sid>hi('Debug', s:cdFront, {}, 'none', {})

call <sid>hi('Underlined', s:cdNone, {}, 'underline', {})
call <sid>hi("Conceal", s:cdFront, s:cdBack, 'none', {})

call <sid>hi('Ignore', s:cdFront, {}, 'none', {})

call <sid>hi('Error', s:cdRed, s:cdBack, 'undercurl', s:cdRed)

call <sid>hi('Todo', s:cdNone, s:cdLeftMid, 'none', {})

" Markdown:
call <sid>hi('markdownBold', s:cdPink, {}, 'bold', {})
call <sid>hi('markdownCode', s:cdLightYellow, {}, 'none', {})
call <sid>hi('markdownRule', s:cdPink, {}, 'bold', {})
call <sid>hi('markdownCodeDelimiter', s:cdLightYellow, {}, 'none', {})
call <sid>hi('markdownHeadingDelimiter', s:cdPink, {}, 'none', {})
call <sid>hi('markdownFootnote', s:cdLightYellow, {}, 'none', {})
call <sid>hi('markdownFootnoteDefinition', s:cdLightYellow, {}, 'none', {})
call <sid>hi('markdownUrl', s:cdLightBlue, {}, 'underline', {})
call <sid>hi('markdownLinkText', s:cdLightYellow, {}, 'none', {})
call <sid>hi('markdownEscape', s:cdVeryLightGreenOrange, {}, 'none', {})

" JSON:
call <sid>hi('jsonKeyword', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('jsonEscape', s:cdLightTeal, {}, 'none', {})
call <sid>hi('jsonNull', s:cdPink, {}, 'none', {})
call <sid>hi('jsonBoolean', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('jsonString', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('jsonNumber', s:cdPinkGreen, {}, 'none', {})

" HTML:
call <sid>hi('htmlTag', s:cdGray, {}, 'none', {})
call <sid>hi('htmlEndTag', s:cdGray, {}, 'none', {})
call <sid>hi('htmlTagName', s:cdPink, {}, 'none', {})
call <sid>hi('htmlSpecialTagName', s:cdPink, {}, 'none', {})
call <sid>hi('htmlArg', s:cdLightBlue, {}, 'none', {})
call <sid>hi('htmlTag', s:cdPink, {}, 'none', {})
call <sid>hi('htmlEndTag', s:cdPink, {}, 'none', {})

" CSS:
call <sid>hi('cssBraces', s:cdLeftLight, {}, 'none', {})
call <sid>hi('cssInclude', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('cssTagName', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('cssClassName', s:cdPink, {}, 'none', {})
call <sid>hi('cssPseudoClass', s:cdVeryLightGreenOrange, {}, 'none', {})
call <sid>hi('cssPseudoClassId', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('cssPseudoClassLang', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('cssIdentifier', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('cssProp', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('cssPositioningProp', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('cssBoxProp', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('cssDimensionProp', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('cssTransitionProp', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('cssTextProp', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('cssFontProp', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('cssBorderProp', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('cssBorderAttr', s:cdPink, {}, 'none', {})
call <sid>hi('cssBackgroundProp', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('cssUIProp', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('scssInclude', s:cdLightTeal, {}, 'none', {})
call <sid>hi('cssDefinition', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('cssAttr', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('scssAttribute', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('cssAttrRegion', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('cssColor', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('cssFunction', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('cssFunctionName', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('cssVendor', s:cdPink, {}, 'none', {})
call <sid>hi('cssValueNumber', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('cssValueLength', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('cssUnitDecorators', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('cssColorProp', s:cdLightTeal, {}, 'none', {})
call <sid>hi('cssCommonAttr', s:cdPink, {}, 'none', {})
call <sid>hi('cssPositioningAttr', s:cdLightTeal, {}, 'none', {})
call <sid>hi('cssNoise', s:cdLightTeal, {}, 'none', {})
call <sid>hi('cssTableAttr', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('cssSelectorOp', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('cssPseudoClassFn', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('cssUnicodeEscape', s:cdLightTeal, {}, 'none', {})
call <sid>hi('cssValueAngle', s:cdLightTeal, {}, 'none', {})
call <sid>hi('cssComment', s:cdViolet, {}, 'none', {})

" SCSS:
call <sid>hi('scssSelectorName', s:cdPink, {}, 'none', {})
call <sid>hi('scssFunctionName', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('scssInterpolationDelimiter', s:cdLightTeal, {}, 'none', {})
call <sid>hi('scssParameterList', s:cdLightTeal, {}, 'none', {})
call <sid>hi('scssMixinName', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('scssVariable', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('scssAmpersand', s:cdLightTeal, {}, 'none', {})
call <sid>hi('scssComment', s:cdVioletDark, {}, 'none', {})
call <sid>hi('scssSelectorChar', s:cdLightTeal, {}, 'none', {})
call <sid>hi('scssCondition', s:cdLightTeal, {}, 'none', {})
call <sid>hi('scssProperty', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('scssAttribute', s:cdDiffRedLightLight, {}, 'none', {})
call <sid>hi('scssExtend', s:cdPinkGreen, {}, 'none', {})

" JavaScript:
call <sid>hi('jsVariableDef', s:cdLightBlue, {}, 'none', {})
call <sid>hi('jsFuncArgs', s:cdLightBlue, {}, 'none', {})
call <sid>hi('jsRegexpString', s:cdDiffRedLightLight, {}, 'none', {})
call <sid>hi('jsThis', s:cdPink, {}, 'none', {})
call <sid>hi('jsOperator', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('jsOperatorKeyword', s:cdPink, {}, 'none', {})
call <sid>hi('jsDestructuringBlock', s:cdLightBlue, {}, 'none', {})
call <sid>hi('jsObjectKey', s:cdLightBlue, {}, 'none', {})
call <sid>hi('jsGlobalObjects', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('jsModuleKeyword', s:cdLightBlue, {}, 'none', {})
call <sid>hi('jsClassDefinition', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('jsClassKeyword', s:cdPink, {}, 'none', {})
call <sid>hi('jsExtendsKeyword', s:cdPink, {}, 'none', {})
call <sid>hi('jsExportDefault', s:cdPink, {}, 'none', {})
call <sid>hi('jsFuncCall', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('jsObjectValue', s:cdLightBlue, {}, 'none', {})
call <sid>hi('jsParen', s:cdLightBlue, {}, 'none', {})
call <sid>hi('jsParenRepeat', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('jsObjectProp', s:cdLightBlue, {}, 'none', {})
call <sid>hi('jsString', s:cdSearchCurrent, {}, 'none', {})
call <sid>hi('jsComment', s:cdViolet, {}, 'none', {})
call <sid>hi('jsParenIfElse', s:cdViolet, {}, 'none', {})
call <sid>hi('jsNumber', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('jsBrackets', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('jsBracket', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('jsFuncBlock', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('jsIfElseBlock', s:cdLightBlue, {}, 'none', {})
call <sid>hi('jsStorageClass', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('jsConditional', s:cdPink, {}, 'none', {})
call <sid>hi('jsFunctionKey', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('jsFunction', s:cdLightTeal, {}, 'none', {})
call <sid>hi('jsBooleanFalse', s:cdPink, {}, 'none', {})
call <sid>hi('jsBooleanTrue', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('jsTemplateBraces', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('jsTemplateExpression', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('jsReturn', s:cdPink, {}, 'none', {})

" Typescript:
call <sid>hi('typescriptLabel', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptExceptions', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptBraces', s:cdFront, {}, 'none', {})
call <sid>hi('typescriptEndColons', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptParens', s:cdFront, {}, 'none', {})
call <sid>hi('typescriptDocTags', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptDocComment', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('typescriptLogicSymbols', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptImport', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptBOM', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptVariableDeclaration', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptVariable', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptExport', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptAliasDeclaration', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('typescriptAliasKeyword', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptClassName', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('typescriptAccessibilityModifier', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptOperator', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptArrowFunc', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptMethodAccessor', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptMember', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('typescriptTypeReference', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('typescriptDefault', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptTemplateSB', s:cdVeryLightGreenOrange, {}, 'none', {})
call <sid>hi('typescriptArrowFuncArg', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptParamImpl', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptFuncComma', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptCastKeyword', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptCall', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptCase', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptReserved', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptDefault', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptDecorator', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('typescriptPredefinedType', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('typescriptClassHeritage', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('typescriptClassExtends', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptClassKeyword', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptBlock', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptDOMDocProp', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptTemplateSubstitution', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptClassBlock', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptFuncCallArg', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptIndexExpr', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptConditionalParen', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptArray', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('typescriptES6SetProp', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptObjectLiteral', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptTypeParameter', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('typescriptEnumKeyword', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptEnum', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('typescriptLoopParen', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptParenExp', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptModule', s:cdLightBlue, {}, 'none', {})
call <sid>hi('typescriptAmbientDeclaration', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptModule', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptFuncTypeArrow', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptInterfaceHeritage', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('typescriptInterfaceName', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('typescriptInterfaceKeyword', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptInterfaceExtends', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptGlobal', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('typescriptAsyncFuncKeyword', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptFuncKeyword', s:cdPink, {}, 'none', {})
call <sid>hi('typescriptGlobalMethod', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('typescriptPromiseMethod', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('typescriptTry', s:cdLightTeal, {}, 'none', {})
call <sid>hi('typescriptKeywordOp', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('typescriptConditionalParen', s:cdVioletLighter, {}, 'none', {})
call <sid>hi('typescriptConditional', s:cdVioletLighter, {}, 'none', {})

" XML:
call <sid>hi('xmlTag', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('xmlTagName', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('xmlEndTag', s:cdPinkGreen, {}, 'none', {})

" Ruby:
call <sid>hi('rubyClassNameTag', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('rubyClassName', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('rubyModuleName', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('rubyConstant', s:cdPinkGreen, {}, 'none', {})

" Golang:
call <sid>hi('goPackage', s:cdPink, {}, 'none', {})
call <sid>hi('goImport', s:cdPink, {}, 'none', {})
call <sid>hi('goVar', s:cdPink, {}, 'none', {})
call <sid>hi('goConst', s:cdPink, {}, 'none', {})
call <sid>hi('goStatement', s:cdPink, {}, 'none', {})
call <sid>hi('goType', s:cdPink, {}, 'none', {})
call <sid>hi('goSignedInts', s:cdPink, {}, 'none', {})
call <sid>hi('goUnsignedInts', s:cdPink, {}, 'none', {})
call <sid>hi('goFloats', s:cdPink, {}, 'none', {})
call <sid>hi('goComplexes', s:cdPink, {}, 'none', {})
call <sid>hi('goBuiltins', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('goBoolean', s:cdPink, {}, 'none', {})
call <sid>hi('goPredefinedIdentifiers', s:cdPink, {}, 'none', {})
call <sid>hi('goTodo', s:cdViolet, {}, 'none', {})
call <sid>hi('goDeclaration', s:cdPink, {}, 'none', {})
call <sid>hi('goDeclType', s:cdPink, {}, 'none', {})
call <sid>hi('goTypeDecl', s:cdPink, {}, 'none', {})
call <sid>hi('goTypeName', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('goVarAssign', s:cdLightBlue, {}, 'none', {})
call <sid>hi('goVarDefs', s:cdLightBlue, {}, 'none', {})
call <sid>hi('goReceiver', s:cdFront, {}, 'none', {})
call <sid>hi('goReceiverType', s:cdDarkBlue, {}, 'none', {})
call <sid>hi('goFunctionCall', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('goMethodCall', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('goSingleDecl', s:cdLightBlue, {}, 'none', {})

" Python:
call <sid>hi('pythonStatement', s:cdPink, {}, 'none', {})
call <sid>hi('pythonOperator', s:cdPink, {}, 'none', {})
call <sid>hi('pythonException', s:cdPink, {}, 'none', {})
call <sid>hi('pythonExClass', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('pythonBuiltinObj', s:cdLightBlue, {}, 'none', {})
call <sid>hi('pythonBuiltinType', s:cdPinkGreen, {}, 'none', {})
call <sid>hi('pythonBoolean', s:cdPink, {}, 'none', {})
call <sid>hi('pythonNone', s:cdPink, {}, 'none', {})
call <sid>hi('pythonTodo', s:cdPink, {}, 'none', {})
call <sid>hi('pythonClassVar', s:cdPink, {}, 'none', {})
call <sid>hi('pythonClassDef', s:cdPinkGreen, {}, 'none', {})

" TeX:
call <sid>hi('texStatement', s:cdPink, {}, 'none', {})
call <sid>hi('texBeginEnd', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('texBeginEndName', s:cdLightBlue, {}, 'none', {})
call <sid>hi('texOption', s:cdLightBlue, {}, 'none', {})
call <sid>hi('texBeginEndModifier', s:cdLightBlue, {}, 'none', {})
call <sid>hi('texDocType', s:cdPink, {}, 'none', {})
call <sid>hi('texDocTypeArgs', s:cdLightBlue, {}, 'none', {})

" Git:
call <sid>hi('gitcommitHeader', s:cdGray, {}, 'none', {})
call <sid>hi('gitcommitOnBranch', s:cdGray, {}, 'none', {})
call <sid>hi('gitcommitBranch', s:cdPink, {}, 'none', {})
call <sid>hi('gitcommitComment', s:cdGray, {}, 'none', {})
call <sid>hi('gitcommitSelectedType', s:cdViolet, {}, 'none', {})
call <sid>hi('gitcommitSelectedFile', s:cdViolet, {}, 'none', {})
call <sid>hi('gitcommitDiscardedType', s:cdRed, {}, 'none', {})
call <sid>hi('gitcommitDiscardedFile', s:cdRed, {}, 'none', {})
call <sid>hi('gitcommitOverflow', s:cdRed, {}, 'none', {})
call <sid>hi('gitcommitSummary', s:cdPink, {}, 'none', {})
call <sid>hi('gitcommitBlank', s:cdPink, {}, 'none', {})

" Lua:
call <sid>hi('luaFuncCall', s:cdVeryLightGreen, {}, 'none', {})
call <sid>hi('luaFuncArgName', s:cdLightBlue, {}, 'none', {})
call <sid>hi('luaFuncKeyword', s:cdPink, {}, 'none', {})
call <sid>hi('luaLocal', s:cdPink, {}, 'none', {})
call <sid>hi('luaBuiltIn', s:cdPink, {}, 'none', {})

" Liquid:
call <sid>hi('liquidStatement', s:cdVioletLighter, {}, '', {})
call <sid>hi('liquidDelimiter', s:cdLightTeal, {}, '', {})
call <sid>hi('liquidConditional', s:cdPink, {}, '', {})
call <sid>hi('liquidOperator', s:cdLightTeal, {}, '', {})
call <sid>hi('liquidNumber', s:cdPinkGreen, {}, '', {})

" JSX:
call <sid>hi('jsxOpenPunct', s:cdPink, {}, '', {})
call <sid>hi('jsxClosePunct', s:cdPink, {}, '', {})
call <sid>hi('jsxDot', s:cdPink, {}, '', {})
call <sid>hi('jsxComponentName', s:cdPinkGreen, {}, '', {})
call <sid>hi('jsxBraces', s:cdLightTeal, {}, '', {})
call <sid>hi('jsxExpressionBlock', s:cdLightTeal, {}, '', {})

