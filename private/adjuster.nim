
import valuator

const
  flh = "FL/Fl_Adjuster.H"

type
  AdjusterObj* {.importc: "Fl_Adjuster", header: flh.} = object of ValuatorObj
  Adjuster* = ptr AdjusterObj

proc make_adjuster*(X, Y, W, H: cint; text: cstring = nil): Adjuster {.importcpp: "new Fl_Adjuster(@)", header: flh.}

proc soft*(self: Adjuster; s: cint) {.importc: "#.soft(@)", header: flh.}
proc soft*(self: Adjuster): cint {.importc: "#.soft(@)", header: flh.}

