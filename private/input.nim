
import enumerations
import menu
import widget

# Input

const
  NORMAL_INPUT*          = 0
  FLOAT_INPUT*           = 1
  INT_INPUT*             = 2
  HIDDEN_INPUT*          = 3
  MULTILINE_INPUT*       = 4
  SECRET_INPUT*          = 5
  INPUT_TYPE*            = 7
  INPUT_READONLY*        = 8
  NORMAL_OUTPUT*         = (NORMAL_INPUT or INPUT_READONLY)
  MULTILINE_OUTPUT*      = (MULTILINE_INPUT or INPUT_READONLY)
  INPUT_WRAP*            = 16
  MULTILINE_INPUT_WRAP*  = (MULTILINE_INPUT or INPUT_WRAP)
  MULTILINE_OUTPUT_WRAP* = (MULTILINE_INPUT or INPUT_READONLY or INPUT_WRAP)

const
  flh = "FL/Fl_Input_.H"
type
  InputBaseObj* {.importc: "Fl_Input_", header: flh.} = object of WidgetObj
  InputBase* = ptr InputBaseObj

#Fl_Input_(int, int, int, int, const char* = 0);

proc resize*(self: InputBase; X, Y, W, H: cint) {.importcpp: "#.resize(@)", header: flh.}
proc value*(self: InputBase; text: cstring): cint {.importcpp: "#.value(@)", header: flh.}
proc value*(self: InputBase; text: cstring; x: cint): cint {.importcpp: "#.value(@)", header: flh.}
proc static_value*(self: InputBase; text: cstring): cint {.importcpp: "#.static_value(@)", header: flh.}
proc static_value*(self: InputBase; text: cstring; x: cint): cint {.importcpp: "#.static_value(@)", header: flh.}
proc value*(self: InputBase): cstring {.importcpp: "#.value(@)", header: flh.}
proc index*(self: InputBase; i: cint): cuint {.importcpp: "#.index(@)", header: flh.}
proc size*(self: InputBase): cint {.importcpp: "#.size(@)", header: flh.}
proc size*(self: InputBase; W, H: cint) {.importcpp: "#.size(@)", header: flh.}
proc maximum_size*(self: InputBase): cint {.importcpp: "#.maximum_size(@)", header: flh.}
proc maximum_size*(self: InputBase; m: cint) {.importcpp: "#.maximum_size(@)", header: flh.}
proc position*(self: InputBase): cint {.importcpp: "#.position(@)", header: flh.}
proc mark*(self: InputBase): cint {.importcpp: "#.mark(@)", header: flh.}
proc position*(self: InputBase; p, m: cint): cint {.importcpp: "#.position(@)", header: flh.}
proc position*(self: InputBase; p: cint): cint {.importcpp: "#.position(@)", header: flh.}
proc mark*(self: InputBase; m: cint): cint {.importcpp: "#.mark(@)", header: flh.}
proc replace*(self: InputBase; b, e: cint; text: cstring; ilen: cint = 0): cint {.importcpp: "#.replace(@)", header: flh.}
proc cut*(self: InputBase): cint {.importcpp: "#.cut(@)", header: flh.}
proc cut*(self: InputBase; n: cint): cint {.importcpp: "#.cut(@)", header: flh.}
proc cut*(self: InputBase; a, b: cint): cint {.importcpp: "#.cut(@)", header: flh.}
proc insert*(self: InputBase; text: cstring; ll: cint = 0): cint {.importcpp: "#.insert(@)", header: flh.}
proc copy*(self: InputBase; clipboard: cint): cint {.importcpp: "#.copy(@)", header: flh.}
proc undo*(self: InputBase): cint {.importcpp: "#.undo(@)", header: flh.}
proc copy_cuts*(self: InputBase): cint {.importcpp: "#.copy_cuts(@)", header: flh.}
proc shortcut*(self: InputBase): cint {.importcpp: "#.shortcut(@)", header: flh.}
proc `shortcut=`*(self: InputBase; s: cint) {.importcpp: "#.shortcut(@)", header: flh.}
proc textfont*(self: InputBase): Font {.importcpp: "#.textfont(@)", header: flh.}
proc `textfont=`*(self: InputBase; s: Font) {.importcpp: "#.textfont(@)", header: flh.}
proc textsize*(self: InputBase): Fontsize {.importcpp: "#.textsize(@)", header: flh.}
proc `textsize=`*(self: InputBase; s: Fontsize) {.importcpp: "#.textsize(@)", header: flh.}
proc textcolor*(self: InputBase): Color {.importcpp: "#.textcolor(@)", header: flh.}
proc `textcolor=`*(self: InputBase; n: Color) {.importcpp: "#.textcolor(@)", header: flh.}
proc cursor_color*(self: InputBase): Color {.importcpp: "#.cursor_color(@)", header: flh.}
proc `cursor_color=`*(self: InputBase; n: Color) {.importcpp: "#.cursor_color(@)", header: flh.}
proc input_type*(self: InputBase): cint {.importcpp: "#.input_type(@)", header: flh.}
proc `input_type=`*(self: InputBase; t: cint) {.importcpp: "#.input_type(@)", header: flh.}
proc readonly*(self: InputBase): cint {.importcpp: "#.readonly(@)", header: flh.}
proc `readonly=`*(self: InputBase; b: cint) {.importcpp: "#.readonly(@)", header: flh.}
proc wrap*(self: InputBase): cint {.importcpp: "#.wrap(@)", header: flh.}
proc `wrap=`*(self: InputBase; b: cint) {.importcpp: "#.wrap(@)", header: flh.}
proc tab_nav*(self: InputBase): cint {.importcpp: "#.tab_nav(@)", header: flh.}
proc `tab_nav=`*(self: InputBase; val: cint) {.importcpp: "#.tab_nav(@)", header: flh.}

# Input part two

const
  flh_input = "FL/Fl_Input.H"
type
  InputObj* {.importc: "Fl_Input", header: flh_input.} = object of InputBaseObj
  Input* = ptr InputObj

proc make_input*(x, y, w, h: cint; text: cstring = nil): Input {.importcpp: "new Fl_Input(@)", header: flh_input.}

# Input Choice

import group

const
  flh_inputchoice = "FL/Fl_Input_Choice.H"
type
  InputChoiceObj* {.importc: "Fl_Input_Choice", header: flh_inputchoice.} = object of GroupObj
  InputChoice* = ptr InputChoiceObj

proc make_inputchoice*(x, y, w, h: cint; text: cstring = nil): Input {.importcpp: "new Fl_Input_Choice(@)", header: flh_inputchoice.}
  
proc add*(self: InputChoice; text: cstring) {.importcpp: "#.add(@)", header: flh_inputchoice.}
proc changed*(self: InputChoice): cint {.importcpp: "#.changed(@)", header: flh_inputchoice.}
proc clear_changed*(self: InputChoice) {.importcpp: "#.clear_changed(@)", header: flh_inputchoice.}
proc set_changed*(self: InputChoice) {.importcpp: "#.set_changed(@)", header: flh_inputchoice.}
proc clear*(self: InputChoice) {.importcpp: "#.clear(@)", header: flh_inputchoice.}
proc resize*(self: InputChoice; X, Y, W, H: cint) {.importcpp: "#.resize(@)", header: flh_inputchoice.}
proc down_box*(self: InputChoice): Boxtype {.importcpp: "#.down_box(@)", header: flh_inputchoice.}
proc `down_box=`*(self: InputChoice; b: Boxtype) {.importcpp: "#.down_box(@)", header: flh_inputchoice.}
proc menu*(self: InputChoice): MenuItem {.importcpp: "#.menu(@)", header: flh_inputchoice.}
proc `menu=`*(self: InputChoice; m: MenuItem) {.importcpp: "#.menu(@)", header: flh_inputchoice.}
proc textcolor*(self: InputChoice): Color {.importcpp: "#.textcolor(@)", header: flh_inputchoice.}
proc `textcolor=`*(self: InputChoice; c: Color) {.importcpp: "#.textcolor(@)", header: flh_inputchoice.}
proc textfont*(self: InputChoice): Font {.importcpp: "#.textfont(@)", header: flh_inputchoice.}
proc `textfont=`*(self: InputChoice; f: Font) {.importcpp: "#.textfont(@)", header: flh_inputchoice.}
proc textsize*(self: InputChoice): Fontsize {.importcpp: "#.textsize(@)", header: flh_inputchoice.}
proc `textsize=`*(self: InputChoice; s: Fontsize) {.importcpp: "#.textsize(@)", header: flh_inputchoice.}
proc value*(self: InputChoice): cstring {.importcpp: "#.value(@)", header: flh_inputchoice.}
proc `value=`*(self: InputChoice; val: csize) {.importcpp: "#.value(@)", header: flh_inputchoice.}
proc `value=`*(self: InputChoice; val: cint) {.importcpp: "#.value(@)", header: flh_inputchoice.}
proc menubutton*(self: InputChoice): MenuButton {.importcpp: "#.menubutton(@)", header: flh_inputchoice.}
proc input*(self: InputChoice): Input {.importcpp: "#.input(@)", header: flh_inputchoice.}

