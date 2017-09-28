
import enumerations
import widget

const
  flh = "FL/Fl_Box.H"
type
  BoxObj* {.importc: "Fl_Box", header: flh.} = object of Widget
  Box* = ptr BoxObj

proc make_box*(X, Y, W, H: cint; text: cstring = nil): Box {.importc: "new Fl_Box(@)", header: flh.}
proc make_box*(b: Boxtype; X, Y, W, H: cint; text: cstring = nil): Box {.importc: "new Fl_Box(@)", header: flh.}

#virtual int handle(int);

