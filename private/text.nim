
import enumerations
import group


const
  # Maximum length in characters of a tab or control character expansion of a single buffer character */
  TEXT_MAX_EXP_CHAR_LEN* =  20

const
  flh_text_buffer = "FL/Fl_Text_Buffer.H"

type
  TextModifyCb* = proc(pos, nInserted, nDeleted, nRestyled: cint; deletedText: cstring; cbArg: pointer)
  TextPredeleteCb* = proc(pos, nDeleted: cint; cbArg: pointer)

  TextSelectionObj* {.importc: "Fl_Text_Selection", header: flh_text_buffer.} = object
  TextSelection* = ptr TextSelectionObj

proc free*(self: TextSelection) {.importcpp: "delete @", header: flh_text_buffer.}

proc set*(self: TextSelection; start, `end`: cint) {.importcpp: "#.set(@)", header: flh_text_buffer.}
proc update*(self: TextSelection; pos, nDeleted, nInserted: cint) {.importcpp: "#.update(@)", header: flh_text_buffer.}
proc start*(self: TextSelection): cint {.importcpp: "#.start(@)", header: flh_text_buffer.}
proc `end`*(self: TextSelection): cint {.importcpp: "#.end(@)", header: flh_text_buffer.}
proc selected*(self: TextSelection): bool {.importcpp: "#.selected(@)", header: flh_text_buffer.}
proc `selected=`*(self: TextSelection; b: bool) {.importcpp: "#.selected(@)", header: flh_text_buffer.}
proc includes*(self: TextSelection; pos: cint): cint {.importcpp: "#.includes(@)", header: flh_text_buffer.}
proc position*(self: TextSelection; start, `end`: out cint): cint {.importcpp: "#.position(@)", header: flh_text_buffer.}

type
  TextBufferObj* {.importc: "Fl_Text_Buffer", header: flh_text_buffer.} = object
    input_file_was_transcoded*: cint
    transcoding_warning_action*: proc (buffer: TextBuffer)
  TextBuffer* = ptr TextBufferObj

var text_buffer_file_encoding_warning_message* {.importcpp: "Fl_Text_Buffer::file_encoding_warning_message", header: flh_text_buffer.}: cstring

proc make_TextBuffer*(requestedSize: cint = 0; preferredGapSize: cint = 1024): TextBuffer {.importcpp: "new Fl_Text_Buffer(@)", header: flh_text_buffer.}
proc free*(self: TextBuffer) {.importcpp: "delete @", header: flh_text_buffer.}

proc length*(self: TextBuffer): cint {.importcpp: "#.length(@)", header: flh_text_buffer.}
proc text*(self: TextBuffer): cstring {.importcpp: "#.text(@)", header: flh_text_buffer.}
proc text*(self: TextBuffer; text: cstring) {.importcpp: "#.text(@)", header: flh_text_buffer.}
proc text_range*(self: TextBuffer; start, `end`: cint): cstring {.importcpp: "#.*text_range(@)", header: flh_text_buffer.}
proc char_at*(self: TextBuffer; pos: cint): cuint {.importcpp: "#.char_at(@)", header: flh_text_buffer.}
proc byte_at*(self: TextBuffer; pos: cint): char {.importcpp: "#.byte_at(@)", header: flh_text_buffer.}
proc address*(self: TextBuffer; pos: cint): cstring {.importcpp: "#.address(@)", header: flh_text_buffer.}
proc insert*(self: TextBuffer; pos: cint; text: cstring) {.importcpp: "#.insert(@)", header: flh_text_buffer.}
proc append*(self: TextBuffer; t: cstring) {.importcpp: "#.append(@)", header: flh_text_buffer.}
proc remove*(self: TextBuffer; start, `end`: cint) {.importcpp: "#.remove(@)", header: flh_text_buffer.}
proc replace*(self: TextBuffer; start, `end`: cint; text: cstring) {.importcpp: "#.replace(@)", header: flh_text_buffer.}
proc copy*(self: TextBuffer; fromBuf: TextBuffer; fromStart, fromEnd, toPos: cint) {.importcpp: "#.copy(@)", header: flh_text_buffer.}
proc undo*(self: TextBuffer; cp: cint = 0): cint {.importcpp: "#.undo(@)", header: flh_text_buffer.}
proc canUndo*(self: TextBuffer; flag: uint8 = 1) {.importcpp: "#.canUndo(@)", header: flh_text_buffer.}
proc insertfile*(self: TextBuffer; file: cstring; pos, buflen: cint = 128*1024): cint {.importcpp: "#.insertfile(@)", header: flh_text_buffer.}
proc appendfile*(self: TextBuffer; file: cstring; buflen: cint = 128*1024): cint {.importcpp: "#.appendfile(@)", header: flh_text_buffer.}
proc loadfile*(self: TextBuffer; file: cstring; buflen: cint = 128*1024): cint {.importcpp: "#.loadfile(@)", header: flh_text_buffer.}
proc outputfile*(self: TextBuffer; file: cstring; start, `end`, buflen: cint = 128*1024): cint {.importcpp: "#.outputfile(@)", header: flh_text_buffer.}
proc savefile*(self: TextBuffer; file: cstring; buflen: cint = 128*1024): cint {.importcpp: "#.savefile(@)", header: flh_text_buffer.}
proc tab_distance*(self: TextBuffer): cint {.importcpp: "#.tab_distance(@)", header: flh_text_buffer.}
proc tab_distance*(self: TextBuffer; tabDist: cint) {.importcpp: "#.tab_distance(@)", header: flh_text_buffer.}
proc select*(self: TextBuffer; start, `end`: cint) {.importcpp: "#.select(@)", header: flh_text_buffer.}
proc selected*(self: TextBuffer): cint {.importcpp: "#.selected(@)", header: flh_text_buffer.}
proc unselect*(self: TextBuffer) {.importcpp: "#.unselect(@)", header: flh_text_buffer.}
proc selection_position*(self: TextBuffer; start, `end`: out cint): cint {.importcpp: "#.selection_position(@)", header: flh_text_buffer.}
proc selection_text*(self: TextBuffer): cstring {.importcpp: "#.*selection_text(@)", header: flh_text_buffer.}
proc remove_selection*(self: TextBuffer) {.importcpp: "#.remove_selection(@)", header: flh_text_buffer.}
proc replace_selection*(self: TextBuffer; text: cstring) {.importcpp: "#.replace_selection(@)", header: flh_text_buffer.}
proc secondary_select*(self: TextBuffer; start, `end`: cint) {.importcpp: "#.secondary_select(@)", header: flh_text_buffer.}
proc secondary_selected*(self: TextBuffer): cint {.importcpp: "#.secondary_selected(@)", header: flh_text_buffer.}
proc secondary_unselect*(self: TextBuffer) {.importcpp: "#.secondary_unselect(@)", header: flh_text_buffer.}
proc secondary_selection_position*(self: TextBuffer; start, `end`: out cint): cint {.importcpp: "#.secondary_selection_position(@)", header: flh_text_buffer.}
proc secondary_selection_text*(self: TextBuffer): cstring {.importcpp: "#.secondary_selection_text(@)", header: flh_text_buffer.}
proc remove_secondary_selection*(self: TextBuffer) {.importcpp: "#.remove_secondary_selection(@)", header: flh_text_buffer.}
proc replace_secondary_selection*(self: TextBuffer; text: cstring) {.importcpp: "#.replace_secondary_selection(@)", header: flh_text_buffer.}
proc highlight*(self: TextBuffer; start, `end`: cint) {.importcpp: "#.highlight(@)", header: flh_text_buffer.}
proc highlight*(self: TextBuffer): cint {.importcpp: "#.highlight(@)", header: flh_text_buffer.}
proc unhighlight*(self: TextBuffer) {.importcpp: "#.unhighlight(@)", header: flh_text_buffer.}
proc highlight_position*(self: TextBuffer; start, `end`: out cint): cint {.importcpp: "#.highlight_position(@)", header: flh_text_buffer.}
proc highlight_text*(self: TextBuffer): cstring {.importcpp: "#.highlight_text(@)", header: flh_text_buffer.}
proc add_modify_callback*(self: TextBuffer; bufModifiedCB: TextModifyCb; cbArg: pointer) {.importcpp: "#.add_modify_callback(@)", header: flh_text_buffer.}
proc remove_modify_callback*(self: TextBuffer; bufModifiedCB: TextModifyCb; cbArg: pointer) {.importcpp: "#.remove_modify_callback(@)", header: flh_text_buffer.}
proc call_modify_callbacks*(self: TextBuffer) {.importcpp: "#.call_modify_callbacks(@)", header: flh_text_buffer.}
proc add_predelete_callback*(self: TextBuffer; bufPredelCB: TextPredeleteCb; cbArg: pointer) {.importcpp: "#.add_predelete_callback(@)", header: flh_text_buffer.}
proc remove_predelete_callback*(self: TextBuffer; predelCB: TextPredeleteCb; cbArg: pointer) {.importcpp: "#.remove_predelete_callback(@)", header: flh_text_buffer.}
proc call_predelete_callbacks*(self: TextBuffer) {.importcpp: "#.call_predelete_callbacks(@)", header: flh_text_buffer.}
proc line_text*(self: TextBuffer; pos: cint): cstring {.importcpp: "#.*line_text(@)", header: flh_text_buffer.}
proc line_start*(self: TextBuffer; pos: cint): cint {.importcpp: "#.line_start(@)", header: flh_text_buffer.}
proc line_end*(self: TextBuffer; pos: cint): cint {.importcpp: "#.line_end(@)", header: flh_text_buffer.}
proc word_start*(self: TextBuffer; pos: cint): cint {.importcpp: "#.word_start(@)", header: flh_text_buffer.}
proc word_end*(self: TextBuffer; pos: cint): cint {.importcpp: "#.word_end(@)", header: flh_text_buffer.}
proc count_displayed_characters*(self: TextBuffer; lineStartPos, targetPos: cint): cint {.importcpp: "#.count_displayed_characters(@)", header: flh_text_buffer.}
proc skip_displayed_characters*(self: TextBuffer; lineStartPos, nChars: cint): cint {.importcpp: "#.skip_displayed_characters(@)", header: flh_text_buffer.}
proc count_lines*(self: TextBuffer; startPos, endPos: cint): cint {.importcpp: "#.count_lines(@)", header: flh_text_buffer.}
proc skip_lines*(self: TextBuffer; startPos, nLines: cint): cint {.importcpp: "#.skip_lines(@)", header: flh_text_buffer.}
proc rewind_lines*(self: TextBuffer; startPos, nLines: cint): cint {.importcpp: "#.rewind_lines(@)", header: flh_text_buffer.}
proc findchar_forward*(self: TextBuffer; startPos: cint; searchChar: cuint; foundPos: out cint): cint {.importcpp: "#.findchar_forward(@)", header: flh_text_buffer.}
proc findchar_backward*(self: TextBuffer; startPos: cint; searchChar: cuint; foundPos: out cint): cint {.importcpp: "#.findchar_backward(@)", header: flh_text_buffer.}
proc search_forward*(self: TextBuffer; startPos: cint; searchString: cstring; foundPos: out cint; matchCase: cint = 0): cint {.importcpp: "#.search_forward(@)", header: flh_text_buffer.}
proc search_backward*(self: TextBuffer; startPos: cint; searchString: cstring; foundPos: out cint; matchCase: cint = 0): cint {.importcpp: "#.search_backward(@)", header: flh_text_buffer.}
proc primary_selection*(self: TextBuffer): TextSelection {.importcpp: "#.primary_selection(@)", header: flh_text_buffer.}
proc secondary_selection*(self: TextBuffer): TextSelection {.importcpp: "#.secondary_selection(@)", header: flh_text_buffer.}
proc highlight_selection*(self: TextBuffer): TextSelection {.importcpp: "#.highlight_selection(@)", header: flh_text_buffer.}
proc prev_char*(self: TextBuffer; ix: cint): cint {.importcpp: "#.prev_char(@)", header: flh_text_buffer.}
proc prev_char_clipped*(self: TextBuffer; ix: cint): cint {.importcpp: "#.prev_char_clipped(@)", header: flh_text_buffer.}
proc next_char*(self: TextBuffer; ix: cint): cint {.importcpp: "#.next_char(@)", header: flh_text_buffer.}
proc next_char_clipped*(self: TextBuffer; ix: cint): cint {.importcpp: "#.next_char_clipped(@)", header: flh_text_buffer.}
proc utf8_align*(self: TextBuffer; a: cint): cint {.importcpp: "#.utf8_align(@)", header: flh_text_buffer.}


# ----------------------------------------------------------------------

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
proc buffer*(self: TextDisplay; buf: TextBuffer) {.importcpp: "#.buffer(@)", header: flh_text_display.}
proc buffer*(self: TextDisplay): TextBuffer {.importcpp: "#.buffer(@)", header: flh_text_display.}
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
proc highlight_data*(self: TextDisplay; styleBuffer: TextBuffer; styleTable: ptr StyleTableEntry; nStyles: cint; unfinishedStyle: char; unfinishedHighlightCB: UnfinishedStyleCb; cbArg: pointer) {.importcpp: "#.highlight_data(@)", header: flh_text_display.}
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
