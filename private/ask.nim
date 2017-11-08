
import widget
import enumerations

const
  flh_ask = "FL/fl_ask.H"

const
  BEEP_DEFAULT* = 0
  BEEP_MESSAGE* = 1
  BEEP_ERROR* = 2
  BEEP_QUESTION* = 3
  BEEP_PASSWORD* = 4
  BEEP_NOTIFICATION* = 5

proc beep*(`type`: cint = BEEP_DEFAULT) {.importcpp: "fl_beep(@)", header: flh_ask.}

proc message*(str: cstring) {.importcpp: "fl_message(@)", header: flh_ask, varargs.}
proc alert*(str: cstring) {.importcpp: "fl_alert(@)", header: flh_ask, varargs.}
proc choice*(str, b0, b1, b2: cstring): cint {.importcpp: "fl_choice(@)", header: flh_ask, varargs.}
proc input*(label: cstring; deflt: cstring = nil): cstring {.importcpp: "fl_input(@)", header: flh_ask, varargs.}
proc password*(label: cstring; deflt: cstring = nil): cstring {.importcpp: "fl_password(@)", header: flh_ask, varargs.}

proc fl_message_icon*(): Widget {.importcpp: "fl_message_icon(@)", header: flh_ask.}
proc fl_message_font*(f, s: Fontsize) {.importcpp: "fl_message_font(@)", header: flh_ask.}
proc `message_hotspot=`*(enable: cint) {.importcpp: "fl_message_hotspot(@)", header: flh_ask.}
proc message_hotspot*(): cint {.importcpp: "fl_message_hotspot(@)", header: flh_ask.}
proc `message_title=`*(title: cstring) {.importcpp: "fl_message_title(@)", header: flh_ask.}
proc `message_title_default=`*(title: cstring) {.importcpp: "fl_message_title_default(@)", header: flh_ask.}

var fl_no* {.importcpp: "fl_no", header: flh_ask.}: cstring
var fl_yes* {.importcpp: "fl_yes", header: flh_ask.}: cstring
var fl_ok* {.importcpp: "fl_ok", header: flh_ask.}: cstring
var fl_cancel* {.importcpp: "fl_cancel", header: flh_ask.}: cstring
var fl_close* {.importcpp: "fl_close", header: flh_ask.}: cstring
