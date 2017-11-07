
import enumerations
import group

const
  flh_text_display = "FL/Fl_Text_Display.H"

type
  TextDisplayObj* {.importc: "Fl_Text_Display", header: flh_text_display.} = object of GroupObj
  TextDisplay* = ptr TextDisplayObj

const
  TEXT_NORMAL_CURSOR* = 0
  TEXT_CARET_CURSOR* = 1
  TEXT_DIM_CURSOR* = 2
  TEXT_BLOCK_CURSOR* = 3
  TEXT_HEAVY_CURSOR* = 4
  TEXT_SIMPLE_CURSOR* = 5

const
  TEXT_CURSOR_POS* = 0
  TEXT_CHARACTER_POS* = 1

const
  TEXT_DRAG_NONE* = -2
  TEXT_DRAG_START_DND* = -1
  TEXT_DRAG_CHAR* = 0
  TEXT_DRAG_WORD* = 1
  TEXT_DRAG_LINE* = 2

const
  TEXT_WRAP_NONE* = 0
  TEXT_WRAP_AT_COLUMN* = 1
  TEXT_WRAP_AT_PIXEL* = 2
  TEXT_WRAP_AT_BOUNDS* = 3

type
  UnfinishedStyleCb* = proc(a: cint; b: pointer)

  StyleTableEntry* = object
    color*: Color
    font*: Font
    size*: Fontsize
    attr*: cuint

proc make_TextDisplay*(x, y, w, h: cint; text: cstring = nil): TextDisplay {.importcpp: "new Fl_Text_Display(@)", header: flh_text_display.}

proc handle*(self: TextDisplay; e: cint): cint {.importcpp: "#.handle(@)", header: flh_text_display.}
#proc buffer*(self: TextDisplay; buf: TextBuffer) {.importcpp: "#.buffer(@)", header: flh_text_display.}
#proc buffer*(self: TextDisplay): TextBuffer {.importcpp: "#.buffer(@)", header: flh_text_display.}
proc redisplay_range*(self: TextDisplay; start, `end`: cint) {.importcpp: "#.redisplay_range(@)", header: flh_text_display.}
proc scroll*(self: TextDisplay; topLineNum, horizOffset: cint) {.importcpp: "#.scroll(@)", header: flh_text_display.}
proc insert*(self: TextDisplay; text: cstring) {.importcpp: "#.insert(@)", header: flh_text_display.}
proc overstrike*(self: TextDisplay; text: cstring) {.importcpp: "#.overstrike(@)", header: flh_text_display.}
proc insert_position*(self: TextDisplay; newPos: cint) {.importcpp: "#.insert_position(@)", header: flh_text_display.}
proc insert_position*(self: TextDisplay): cint {.importcpp: "#.insert_position(@)", header: flh_text_display.}
proc position_to_xy*(self: TextDisplay; pos: cint; x, y: out cint): cint {.importcpp: "#.position_to_xy(@)", header: flh_text_display.}
proc in_selection*(self: TextDisplay; x, y: cint): cint {.importcpp: "#.in_selection(@)", header: flh_text_display.}
proc show_insert_position*(self: TextDisplay) {.importcpp: "#.show_insert_position(@)", header: flh_text_display.}
proc move_right*(self: TextDisplay): cint {.importcpp: "#.move_right(@)", header: flh_text_display.}
proc move_left*(self: TextDisplay): cint {.importcpp: "#.move_left(@)", header: flh_text_display.}
proc move_up*(self: TextDisplay): cint {.importcpp: "#.move_up(@)", header: flh_text_display.}
proc move_down*(self: TextDisplay): cint {.importcpp: "#.move_down(@)", header: flh_text_display.}
proc count_lines*(self: TextDisplay; start, `end`: cint; start_pos_is_line_start: bool): cint {.importcpp: "#.count_lines(@)", header: flh_text_display.}
proc line_start*(self: TextDisplay; pos: cint): cint {.importcpp: "#.line_start(@)", header: flh_text_display.}
proc line_end*(self: TextDisplay; startPos: cint; startPosIsLineStart: bool): cint {.importcpp: "#.line_end(@)", header: flh_text_display.}
proc skip_lines*(self: TextDisplay; startPos, nLines: cint; startPosIsLineStart: bool): cint {.importcpp: "#.skip_lines(@)", header: flh_text_display.}
proc rewind_lines*(self: TextDisplay; startPos, nLines: cint): cint {.importcpp: "#.rewind_lines(@)", header: flh_text_display.}
proc next_word*(self: TextDisplay) {.importcpp: "#.next_word(@)", header: flh_text_display.}
proc previous_word*(self: TextDisplay) {.importcpp: "#.previous_word(@)", header: flh_text_display.}
proc show_cursor*(self: TextDisplay; b: cint = 1) {.importcpp: "#.show_cursor(@)", header: flh_text_display.}
proc hide_cursor*(self: TextDisplay) {.importcpp: "#.hide_cursor(@)", header: flh_text_display.}
proc cursor_style*(self: TextDisplay; style: cint) {.importcpp: "#.cursor_style(@)", header: flh_text_display.}
proc cursor_color*(self: TextDisplay): Color {.importcpp: "#.cursor_color(@)", header: flh_text_display.}
proc cursor_color*(self: TextDisplay; n: Color) {.importcpp: "#.cursor_color(@)", header: flh_text_display.}
proc scrollbar_width*(self: TextDisplay): cint {.importcpp: "#.scrollbar_width(@)", header: flh_text_display.}
proc scrollbar_width*(self: TextDisplay; W: cint) {.importcpp: "#.scrollbar_width(@)", header: flh_text_display.}
proc scrollbar_align*(self: TextDisplay): Align {.importcpp: "#.scrollbar_align(@)", header: flh_text_display.}
proc scrollbar_align*(self: TextDisplay; a: Align) {.importcpp: "#.scrollbar_align(@)", header: flh_text_display.}
proc word_start*(self: TextDisplay; pos: cint): cint {.importcpp: "#.word_start(@)", header: flh_text_display.}
proc word_end*(self: TextDisplay; pos: cint): cint {.importcpp: "#.word_end(@)", header: flh_text_display.}
#proc highlight_data*(self: TextDisplay; styleBuffer: TextBuffer; styleTable: ptr StyleTableEntry; nStyles: cint; unfinishedStyle: char; unfinishedHighlightCB: UnfinishedStyleCb; cbArg: pointer) {.importcpp: "#.highlight_data(@)", header: flh_text_display.}
proc position_style*(self: TextDisplay; lineStartPos, lineLen, lineIndex: cint): cint {.importcpp: "#.position_style(@)", header: flh_text_display.}
proc shortcut*(self: TextDisplay): cint {.importcpp: "#.shortcut(@)", header: flh_text_display.}
proc shortcut*(self: TextDisplay; s: cint) {.importcpp: "#.shortcut(@)", header: flh_text_display.}
proc textfont*(self: TextDisplay): Font {.importcpp: "#.textfont(@)", header: flh_text_display.}
proc textfont*(self: TextDisplay; s: Font) {.importcpp: "#.textfont(@)", header: flh_text_display.}
proc textsize*(self: TextDisplay): Fontsize {.importcpp: "#.textsize(@)", header: flh_text_display.}
proc textsize*(self: TextDisplay; s: Fontsize) {.importcpp: "#.textsize(@)", header: flh_text_display.}
proc textcolor*(self: TextDisplay): Color {.importcpp: "#.textcolor(@)", header: flh_text_display.}
proc textcolor*(self: TextDisplay; n: Color) {.importcpp: "#.textcolor(@)", header: flh_text_display.}
proc wrapped_column*(self: TextDisplay; row, column: cint): cint {.importcpp: "#.wrapped_column(@)", header: flh_text_display.}
proc wrapped_row*(self: TextDisplay; row: cint): cint {.importcpp: "#.wrapped_row(@)", header: flh_text_display.}
proc wrap_mode*(self: TextDisplay; wrap, wrap_margin: cint) {.importcpp: "#.wrap_mode(@)", header: flh_text_display.}
proc resize*(self: TextDisplay; X, Y, W, H: cint) {.importcpp: "#.resize(@)", header: flh_text_display.}
proc x_to_col*(self: TextDisplay; x: cdouble): cdouble {.importcpp: "#.x_to_col(@)", header: flh_text_display.}
proc col_to_x*(self: TextDisplay; col: cdouble): cdouble {.importcpp: "#.col_to_x(@)", header: flh_text_display.}
proc linenumber_width*(self: TextDisplay; width: cint) {.importcpp: "#.linenumber_width(@)", header: flh_text_display.}
proc linenumber_width*(self: TextDisplay): cint {.importcpp: "#.linenumber_width(@)", header: flh_text_display.}
proc linenumber_font*(self: TextDisplay; val: Font) {.importcpp: "#.linenumber_font(@)", header: flh_text_display.}
proc linenumber_font*(self: TextDisplay): Font {.importcpp: "#.linenumber_font(@)", header: flh_text_display.}
proc linenumber_size*(self: TextDisplay; val: Fontsize) {.importcpp: "#.linenumber_size(@)", header: flh_text_display.}
proc linenumber_size*(self: TextDisplay): Fontsize {.importcpp: "#.linenumber_size(@)", header: flh_text_display.}
proc linenumber_fgcolor*(self: TextDisplay; val: Color) {.importcpp: "#.linenumber_fgcolor(@)", header: flh_text_display.}
proc linenumber_fgcolor*(self: TextDisplay): Color {.importcpp: "#.linenumber_fgcolor(@)", header: flh_text_display.}
proc linenumber_bgcolor*(self: TextDisplay; val: Color) {.importcpp: "#.linenumber_bgcolor(@)", header: flh_text_display.}
proc linenumber_bgcolor*(self: TextDisplay): Color {.importcpp: "#.linenumber_bgcolor(@)", header: flh_text_display.}
proc linenumber_align*(self: TextDisplay; val: Align) {.importcpp: "#.linenumber_align(@)", header: flh_text_display.}
proc linenumber_align*(self: TextDisplay): Align {.importcpp: "#.linenumber_align(@)", header: flh_text_display.}
proc linenumber_format*(self: TextDisplay; val: cstring) {.importcpp: "#.linenumber_format(@)", header: flh_text_display.}
proc linenumber_format*(self: TextDisplay): cstring {.importcpp: "#.linenumber_format(@)", header: flh_text_display.}
