
import enumerations
import widget

const
  flh = "FL/Fl_Button.H"

const
  FL_NORMAL_BUTTON* = 0
  FL_TOGGLE_BUTTON* = 1
  FL_RADIO_BUTTON*  = (FL_RESERVED_TYPE+2)
  FL_HIDDEN_BUTTON* = 3

# XXX what is this?
#extern FL_EXPORT Fl_Shortcut fl_old_shortcut(s: cstring)

type
  ButtonObj* {.importc: "Fl_Button".} = object of Widget
  Button* = ptr ButtonObj

proc make_button*(x, y, w, h: cint; text: cstring): Button {.importcpp: "new Fl_Button(@)", header: flh.}

proc handle*(self: Button; a: cint): cint {.importcpp: "#.handle(@)", header: flh.}

proc value*(self: Button): uint8 {.importcpp: "#.value(@)", header: flh.}
proc `value=`*(self: Button; v: cint): cint {.importcpp: "#.value(@)", header: flh.}

proc set*(self: Button): cint {.importcpp: "#.set(@)", header: flh.}
proc clear*(self: Button): cint {.importcpp: "#.clear(@)", header: flh.}
proc setonly*(self: Button) {.importcpp: "#.setonly(@)", header: flh.}

proc shortcut*(self: Button): cint {.importcpp: "#.shortcut(@)", header: flh.}
proc `shortcut=`*(self: Button; s: cint) {.importcpp: "#.shortcut(@)", header: flh.}

proc down_box*(self: Button): Boxtype {.importcpp: "#.down_box(@)", header: flh.}
proc `down_box=`*(self: Button; b: Boxtype) {.importcpp: "#.down_box(@)", header: flh.}

proc shortcut*(self: Button; s: cstring) {.importcpp: "#.shortcut(@)", header: flh.}

proc down_color*(self: Button): Color {.importcpp: "#.down_color(@)", header: flh.}
proc `down_color=`*(self: Button; c: cuint) {.importcpp: "#.down_color(@)", header: flh.}

