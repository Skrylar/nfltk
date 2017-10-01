
const
  flh = "FL/Fl_Valuator.H"

import widget

const
  FL_VERTICAL*   = 0
  FL_HORIZONTAL* = 1

type
  ValuatorObj* {.importc: "Fl_Valuator", header: flh.} = object of WidgetObj
  Valuator* = ptr ValuatorObj

proc bounds*(self: Valuator; a, b: cdouble) {.importc: "#.bounds(@)", header: flh.}
proc minimum*(self: Valuator): cdouble {.importc: "#.minimum(@)", header: flh.}
proc minimum*(self: Valuator; a: cdouble) {.importc: "#.minimum(@)", header: flh.}
proc maximum*(self: Valuator): cdouble {.importc: "#.maximum(@)", header: flh.}
proc maximum*(self: Valuator; a: cdouble) {.importc: "#.maximum(@)", header: flh.}
proc range*(self: Valuator; a, b: cdouble) {.importc: "#.range(@)", header: flh.}
proc step*(self: Valuator; a: cint) {.importc: "#.step(@)", header: flh.}
proc step*(self: Valuator; a: cdouble; b: cint) {.importc: "#.step(@)", header: flh.}
proc step*(self: Valuator; s: cdouble) {.importc: "#.step(@)", header: flh.}
proc step*(self: Valuator): cdouble {.importc: "#.step(@)", header: flh.}
proc precision*(self: Valuator; digits: cint) {.importc: "#.precision(@)", header: flh.}
proc value*(self: Valuator): cdouble {.importc: "#.value(@)", header: flh.}
proc value*(self: Valuator; a: cdouble): cint {.importc: "#.value(@)", header: flh.}
proc format*(self: Valuator; fmt: cstring): cint {.importc: "#.format(@)", header: flh.}
proc round*(self: Valuator; a: cdouble): cdouble {.importc: "#.round(@)", header: flh.}
proc clamp*(self: Valuator; a: cdouble): cdouble {.importc: "#.clamp(@)", header: flh.}
proc increment*(self: Valuator; a: cdouble; b: cint): cdouble {.importc: "#.increment(@)", header: flh.}

