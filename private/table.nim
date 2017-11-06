
import enumerations
import widget
import group

const
  flh_table = "FL/Fl_Table.H"

type
  TableContext* = cint
const
  TABLE_CONTEXT_NONE*       = 0
  TABLE_CONTEXT_STARTPAGE*  = 0x01
  TABLE_CONTEXT_ENDPAGE*    = 0x02
  TABLE_CONTEXT_ROW_HEADER* = 0x04
  TABLE_CONTEXT_COL_HEADER* = 0x08
  TABLE_CONTEXT_CELL*       = 0x10
  TABLE_CONTEXT_TABLE*      = 0x20
  TABLE_CONTEXT_RC_RESIZE*  = 0x40

type
  TableObj* {.importc: "Fl_Table", header: flh_table.} = object of GroupObj
  Table* = ptr TableObj

proc make_Table*(x, y, w, h: cint; text: cstring = nil): Table {.importcpp: "new Fl_Table(@)", header: flh_table.}

proc clear*(self: Table) {.importcpp: "#.clear(@)", header: flh_table.}
proc `table_box=`*(self: Table; val: Boxtype) {.importcpp: "#.table_box(@)", header: flh_table.}
proc table_box*(self: Table): Boxtype {.importcpp: "#.table_box(@)", header: flh_table.}
proc `rows=`*(self: Table; val: cint) {.importcpp: "#.rows(@)", header: flh_table.}
proc rows*(self: Table): cint {.importcpp: "#.rows(@)", header: flh_table.}
proc `cols=`*(self: Table; val: cint) {.importcpp: "#.cols(@)", header: flh_table.}
proc cols*(self: Table): cint {.importcpp: "#.cols(@)", header: flh_table.}
proc visible_cells*(self: Table; r1, r2, c1, c2: out cint) {.importcpp: "#.visible_cells(@)", header: flh_table.}
proc is_interactive_resize*(self: Table): cint {.importcpp: "#.is_interactive_resize(@)", header: flh_table.}
proc row_resize*(self: Table): cint {.importcpp: "#.row_resize(@)", header: flh_table.}
proc `row_resize=`*(self: Table; flag: cint) {.importcpp: "#.row_resize(@)", header: flh_table.}
proc col_resize*(self: Table): cint {.importcpp: "#.col_resize(@)", header: flh_table.}
proc `col_resize=`*(self: Table; flag: cint) {.importcpp: "#.col_resize(@)", header: flh_table.}
proc col_resize_min*(self: Table): cint {.importcpp: "#.col_resize_min(@)", header: flh_table.}
proc `col_resize_min=`*(self: Table; val: cint) {.importcpp: "#.col_resize_min(@)", header: flh_table.}
proc row_resize_min*(self: Table): cint {.importcpp: "#.row_resize_min(@)", header: flh_table.}
proc `row_resize_min=`*(self: Table; val: cint) {.importcpp: "#.row_resize_min(@)", header: flh_table.}
proc row_header*(self: Table): cint {.importcpp: "#.row_header(@)", header: flh_table.}
proc `row_header=`*(self: Table; flag: cint) {.importcpp: "#.row_header(@)", header: flh_table.}
proc col_header*(self: Table): cint {.importcpp: "#.col_header(@)", header: flh_table.}
proc `col_header=`*(self: Table; flag: cint) {.importcpp: "#.col_header(@)", header: flh_table.}
proc `col_header_height=`*(self: Table; height: cint) {.importcpp: "#.col_header_height(@)", header: flh_table.}
proc col_header_height*(self: Table): cint {.importcpp: "#.col_header_height(@)", header: flh_table.}
proc row_header_width*(self: Table; width: cint) {.importcpp: "#.row_header_width(@)", header: flh_table.}
proc row_header_width*(self: Table): cint {.importcpp: "#.row_header_width(@)", header: flh_table.}
proc `row_header_color=`*(self: Table; val: Color) {.importcpp: "#.row_header_color(@)", header: flh_table.}
proc row_header_color*(self: Table): Color {.importcpp: "#.row_header_color(@)", header: flh_table.}
proc `col_header_color=`*(self: Table; val: Color) {.importcpp: "#.col_header_color(@)", header: flh_table.}
proc col_header_color*(self: Table): Color {.importcpp: "#.col_header_color(@)", header: flh_table.}
proc row_height*(self: Table; row, height: cint) {.importcpp: "#.row_height(@)", header: flh_table.}
proc row_height*(self: Table; row: cint): cint {.importcpp: "#.row_height(@)", header: flh_table.}
proc col_width*(self: Table; col, width: cint) {.importcpp: "#.col_width(@)", header: flh_table.}
proc col_width*(self: Table; col: cint): cint {.importcpp: "#.col_width(@)", header: flh_table.}
proc `row_height_all=`*(self: Table; height: cint) {.importcpp: "#.row_height_all(@)", header: flh_table.}
proc `col_width_all=`*(self: Table; width: cint) {.importcpp: "#.col_width_all(@)", header: flh_table.}
proc `row_position=`*(self: Table; row: cint) {.importcpp: "#.row_position(@)", header: flh_table.}
proc `col_position=`*(self: Table; col: cint) {.importcpp: "#.col_position(@)", header: flh_table.}
proc row_position*(self: Table): cint {.importcpp: "#.row_position(@)", header: flh_table.}
proc col_position*(self: Table): cint {.importcpp: "#.col_position(@)", header: flh_table.}
proc `top_row=`*(self: Table; row: cint) {.importcpp: "#.top_row(@)", header: flh_table.}
proc top_row*(self: Table): cint {.importcpp: "#.top_row(@)", header: flh_table.}
proc is_selected*(self: Table; r, c: cint): cint {.importcpp: "#.is_selected(@)", header: flh_table.}
proc get_selection*(self: Table; row_top, col_left, row_bot, col_right: out cint) {.importcpp: "#.get_selection(@)", header: flh_table.}
proc set_selection*(self: Table; row_top, col_left, row_bot, col_right: cint) {.importcpp: "#.set_selection(@)", header: flh_table.}
proc move_cursor*(self: Table; R, C, shiftselect: cint): cint {.importcpp: "#.move_cursor(@)", header: flh_table.}
proc move_cursor*(self: Table; R, C: cint): cint {.importcpp: "#.move_cursor(@)", header: flh_table.}
proc resize*(self: Table; X, Y, W, H: cint) {.importcpp: "#.resize(@)", header: flh_table.}
proc draw*(self: Table) {.importcpp: "#.draw(@)", header: flh_table.}
proc init_sizes*(self: Table) {.importcpp: "#.init_sizes(@)", header: flh_table.}
proc add*(self: Table; wgt: Widget) {.importcpp: "#.add(@)", header: flh_table.}
proc insert*(self: Table; w: Widget, n: cint) {.importcpp: "#.insert(*#, @)", header: flh_table.}
proc insert*(self: Table; w: Widget, w2: Widget) {.importcpp: "#.insert(*#, @)", header: flh_table.}
proc remove*(self: Table; w: Widget) {.importcpp: "#.remove(*#, @)", header: flh_table.}
proc begin*(self: Table) {.importcpp: "#.begin(@)", header: flh_table.}
proc endd*(self: Table) {.importcpp: "#.end(@)", header: flh_table.}
proc array*(self: Table): ptr Widget {.importcpp: "#.array(@)", header: flh_table.}
proc child*(self: Table; n: cint): ptr Widget {.importcpp: "#.child(@)", header: flh_table.}
proc children*(self: Table): cint {.importcpp: "#.children(@)", header: flh_table.}
proc find*(self: Table; w: Widget): cint {.importcpp: "#.find(@)", header: flh_table.}
proc callback_row*(self: Table): cint {.importcpp: "#.callback_row(@)", header: flh_table.}
proc callback_col*(self: Table): cint {.importcpp: "#.callback_col(@)", header: flh_table.}
proc callback_context*(self: Table): TableContext {.importcpp: "#.callback_context(@)", header: flh_table.}
proc do_callback*(self: Table; context: TableContext; row, col: cint) {.importcpp: "#.do_callback(@)", header: flh_table.}
proc whenn*(self: Table; flags: When) {.importcpp: "#.when(@)", header: flh_table.}
proc callback*(self: Table; w: Widget; p: pointer) {.importcpp: "#.callback(@)", header: flh_table.}
proc scrollbar_size*(self: Table): cint {.importcpp: "#.scrollbar_size(@)", header: flh_table.}
proc `scrollbar_size=`*(self: Table; newSize: cint) {.importcpp: "#.scrollbar_size(@)", header: flh_table.}
proc `tab_cell_nav=`*(self: Table; val: cint) {.importcpp: "#.tab_cell_nav(@)", header: flh_table.}
proc tab_cell_nav*(self: Table): cint {.importcpp: "#.tab_cell_nav(@)", header: flh_table.}

# ______________________________________________________________________

const
  flh_table_row = "FL/Fl_Table_Row.H"

type
  TableRowSelectMode* = cint
const
  TABLEROW_SELECT_NONE* = 0
  TABLEROW_SELECT_SINGLE* = 1
  TABLEROW_SELECT_MULTI* = 2

type
  TableRowObj* {.importc: "Fl_Table_Row", header: flh_table_row.} = object of TableObj
  TableRow* = ptr TableRowObj

proc make_TableRow*(x, y, w, h: cint; text: cstring = nil): TableRow {.importcpp: "new Fl_Table_Row(@)", header: flh_table_row.}

proc `rows=`*(val: cint) {.importcpp: "#.rows(@)", header: flh_tablerow.}
proc rows*(): cint {.importcpp: "#.rows(@)", header: flh_tablerow.}
proc `type=`*(val: TableRowSelectMode) {.importcpp: "#.type(@)", header: flh_tablerow.}
proc `type`*(): TableRowSelectMode {.importcpp: "#.type(@)", header: flh_tablerow.}
proc row_selected*(row: cint): cint {.importcpp: "#.row_selected(@)", header: flh_tablerow.}
proc select_row*(row: cint; flag: cint = 1): cint {.importcpp: "#.select_row(@)", header: flh_tablerow.}
proc select_all_rows*(flag: cint = 1) {.importcpp: "#.select_all_rows(@)", header: flh_tablerow.}
proc clear*() {.importcpp: "#.clear(@)", header: flh_tablerow.}
