
import valuator
import group

const
  flh_scroll = "FL/Fl_Scroll.H"
type
  ScrollObj* {.importc: "Fl_Scroll", header: flh_scroll.} = object of GroupObj
    scrollbar, hscrollbar: Scrollbar

  Scroll* = ptr ScrollObj

const
  SCROLL_HORIZONTAL*        = 1
  SCROLL_VERTICAL*          = 2
  SCROLL_BOTH*              = 3
  SCROLL_ALWAYS_ON*         = 4
  SCROLL_HORIZONTAL_ALWAYS* = 5
  SCROLL_VERTICAL_ALWAYS*   = 6
  SCROLL_BOTH_ALWAYS*       = 7

proc make_scroll*(X, Y, W, H: cint; text: cstring): Scroll {.importcpp: "new Fl_Scroll(@)", header: flh_scroll}

proc xposition*(self: Scroll): cint {.importcpp: "#.xposition(@)", header: flh_scroll.}
proc yposition*(self: Scroll): cint {.importcpp: "#.yposition(@)", header: flh_scroll.}
proc scroll_to*(self: Scroll; x, y: cint) {.importcpp: "#.scroll_to(@)", header: flh_scroll.}
proc clear*(self: Scroll) {.importcpp: "#.clear(@)", header: flh_scroll.}
proc scrollbar_size*(self: Scroll): cint {.importcpp: "#.scrollbar_size(@)", header: flh_scroll.}
proc `scrollbar_size=`*(self: Scroll; newSize: cint) {.importcpp: "#.scrollbar_size(@)", header: flh_scroll.}

