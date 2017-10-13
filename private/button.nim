
import enumerations
import widget

const
  flh = "FL/Fl_Button.H"
  flh_light = "FL/Fl_Light_Button.H"
  flh_check = "FL/Fl_Check_Button.H"
  flh_round = "FL/Fl_Round_Button.H"
  flh_radio = "FL/Fl_Radio_Button.H"
  flh_radioround = "FL/Fl_Radio_Round_Button.H"
  flh_radiolight = "FL/Fl_Radio_Light_Button.H"
  flh_toggle = "FL/Fl_Toggle_Button.H"

const
  FL_NORMAL_BUTTON* = 0
  FL_TOGGLE_BUTTON* = 1
  FL_RADIO_BUTTON*  = (FL_RESERVED_TYPE+2)
  FL_HIDDEN_BUTTON* = 3

# XXX what is this?
#extern FL_EXPORT Fl_Shortcut fl_old_shortcut(s: cstring)

type
  ButtonObj* {.importc: "Fl_Button", header: flh.} = object of WidgetObj
  Button* = ptr ButtonObj

  LightButtonObj* {.importc: "Fl_Check_Button", header: flh_light.} = object of ButtonObj
  LightButton* = ptr LightButtonObj

  CheckButtonObj* {.importc: "Fl_Check_Button", header: flh_check.} = object of LightButtonObj
  CheckButton* = ptr CheckButtonObj

  RoundButtonObj* {.importc: "Fl_Round_Button", header: flh_round.} = object of LightButtonObj
  RoundButton* = ptr RoundButtonObj

  RadioButtonObj* {.importc: "Fl_Radio_Button", header: flh_radio.} = object of ButtonObj
  RadioButton* = ptr RadioButtonObj

  RadioRoundButtonObj* {.importc: "Fl_Radio_Round_Button", header: flh_radioround.} = object of RoundButtonObj
  RadioRoundButton* = ptr RadioRoundButtonObj

  RadioLightButtonObj* {.importc: "Fl_Radio_LightButton", header: flh_radiolight.} = object of LightButtonObj
  RadioLightButton* = ptr RadioLightButtonObj

  ToggleButtonObj {.importc: "Fl_Toggle_Button", header: flh_toggle.} = object
  ToggleButton* = ptr ButtonObj

proc make_button*(x, y, w, h: cint; text: cstring): Button {.importcpp: "new Fl_Button(@)", header: flh.}
proc make_light_button*(x, y, w, h: cint; text: cstring): LightButton {.importcpp: "new Fl_Light_Button(@)", header: flh_light.}
proc make_check_button*(x, y, w, h: cint; text: cstring): CheckButton {.importcpp: "new Fl_Check_Button(@)", header: flh_check.}
proc make_round_button*(x, y, w, h: cint; text: cstring): RoundButton {.importcpp: "new Fl_Round_Button(@)", header: flh_round.}
proc make_radio_button*(x, y, w, h: cint; text: cstring): RadioButton {.importcpp: "new Fl_Radio_Button(@)", header: flh_radio.}
proc make_radio_round_button*(x, y, w, h: cint; text: cstring): RadioRoundButton {.importcpp: "new Fl_Radio_Round_Button(@)", header: flh_radioround.}
proc make_radio_light_button*(x, y, w, h: cint; text: cstring): RadioLightButton {.importcpp: "new Fl_Radio_Light_Button(@)", header: flh_radiolight.}
proc make_toggle_button(x, y, w, h: cint; text: cstring): ToggleButton {.importcpp: "new ToggleButton(@)", header: flh_toggle.}

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

