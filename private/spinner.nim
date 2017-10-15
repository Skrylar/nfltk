
import enumerations
import group

const
  flh_spinner = "FL/Fl_Spinner.H"
type
  SpinnerObj* {.importc: "Fl_Spinner", header: flh_spinner.} = object of GroupObj
  Spinner* = ptr SpinnerObj

proc make_spinner*(X, Y, W, H: cint; text: cstring = nil): Spinner {.importcpp: "new Fl_Spinner(@)", header: flh_spinner.}

proc format*(self: Spinner): cstring {.importcpp: "#.format(@)", header: flh_spinner.}
proc `format=`*(self: Spinner; f: cstring) {.importcpp: "#.format(@)", header: flh_spinner.}
proc maxinum*(self: Spinner): cdouble {.importcpp: "#.maxinum(@)", header: flh_spinner.}
proc `maximum=`*(self: Spinner; m: cdouble) {.importcpp: "#.maximum(@)", header: flh_spinner.}
proc mininum*(self: Spinner): cdouble {.importcpp: "#.mininum(@)", header: flh_spinner.}
proc `minimum=`*(self: Spinner; m: cdouble) {.importcpp: "#.minimum(@)", header: flh_spinner.}
proc range*(self: Spinner; a, b: cdouble) {.importcpp: "#.range(@)", header: flh_spinner.}
proc resize*(self: Spinner; X, Y, W, H: cint) {.importcpp: "#.resize(@)", header: flh_spinner.}
proc step*(self: Spinner): cdouble {.importcpp: "#.step(@)", header: flh_spinner.}
proc `step=`*(self: Spinner; s: cdouble) {.importcpp: "#.step(@)", header: flh_spinner.}
proc textcolor*(self: Spinner): Color {.importcpp: "#.textcolor(@)", header: flh_spinner.}
proc `textcolor=`*(self: Spinner; c: Color) {.importcpp: "#.textcolor(@)", header: flh_spinner.}
proc textfont*(self: Spinner): Font {.importcpp: "#.textfont(@)", header: flh_spinner.}
proc `textfont=`*(self: Spinner; f: Font) {.importcpp: "#.textfont(@)", header: flh_spinner.}
proc textsize*(self: Spinner): Fontsize {.importcpp: "#.textsize(@)", header: flh_spinner.}
proc `textsize=`*(self: Spinner; s: Fontsize) {.importcpp: "#.textsize(@)", header: flh_spinner.}
proc typee*(self: Spinner): cuchar {.importcpp: "#.type(@)", header: flh_spinner.}
proc `typee=`*(self: Spinner; v: cuchar) {.importcpp: "#.type(@)", header: flh_spinner.}
proc value*(self: Spinner): cdouble {.importcpp: "#.value(@)", header: flh_spinner.}
proc `value=`*(self: Spinner; v: cdouble) {.importcpp: "#.value(@)", header: flh_spinner.}
proc `color=`*(self: Spinner; v: Color) {.importcpp: "#.color(@)", header: flh_spinner.}
proc color*(self: Spinner): Color {.importcpp: "#.color(@)", header: flh_spinner.}
proc `selection_color=`*(self: Spinner; val: Color) {.importcpp: "#.selection_color(@)", header: flh_spinner.}
proc selection_color*(self: Spinner): Color {.importcpp: "#.selection_color(@)", header: flh_spinner.}

