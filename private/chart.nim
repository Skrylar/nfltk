
import widget

const
  BAR_CHART*        = 0
  HORBAR_CHART*     = 1
  LINE_CHART*       = 2
  FILL_CHART*       = 3
  SPIKE_CHART*      = 4
  PIE_CHART*        = 5
  SPECIALPIE_CHART* = 6

  FILLED_CHART*     = FL_FILL_CHART

  CHART_MAX*        = 128
  CHART_LABEL_MAX*  = 18

const
  flh_chart = "FL/Fl_Chart.H"
type
  ChartObj* {.importc: "Fl_Chart", header: flh_chart.} = object of WidgetObj
  Chart* = ptr Chart

Fl_Chart(int X, int Y, int W, int H, const char *L = 0);

proc clear*(self: Chart) {.importcpp: "#.clear(@)", header: flh_chart.}
proc add*(self: Chart; val: cdouble; str: cstring = nil; col: cuint = 0) {.importcpp: "#.add(@)", header: flh_chart.}
proc insert*(self: Chart; ind: cint; val: cdouble; str: cstring = nil; col: cuint = 0) {.importcpp: "#.insert(@)", header: flh_chart.}
proc replace*(self: Chart; ind: cint; val: cdouble; str: cstring = nil; col: cuint = 0) {.importcpp: "#.replace(@)", header: flh_chart.}
proc bounds*(self: Chart; a, b: ptr cdouble) {.importcpp: "#.bounds(@)", header: flh_chart.}
proc bounds*(self: Chart; a, b: cdouble) {.importcpp: "#.bounds(@)", header: flh_chart.}
proc size*(self: Chart): cint {.importcpp: "#.size(@)", header: flh_chart.}
proc size*(self: Chart; W, H: cing) {.importcpp: "#.size(@)", header: flh_chart.}
proc maxsize*(self: Chart): cint {.importcpp: "#.maxsize(@)", header: flh_chart.}
proc `maxsize=`*(self: Chart; m: cint) {.importcpp: "#.maxsize(@)", header: flh_chart.}
proc textfont*(self: Chart): Font {.importcpp: "#.textfont(@)", header: flh_chart.}
proc `textfont=`*(self: Chart; s: Font) {.importcpp: "#.textfont(@)", header: flh_chart.}
proc textsize*(self: Chart): Fontsize {.importcpp: "#.textsize(@)", header: flh_chart.}
proc `textsize=`*(self: Chart; s: Fontsize) {.importcpp: "#.textsize(@)", header: flh_chart.}
proc textcolor*(self: Chart): Color {.importcpp: "#.textcolor(@)", header: flh_chart.}
proc `textcolor=`*(self: Chart; n: Color) {.importcpp: "#.textcolor(@)", header: flh_chart.}
proc autosize*(self: Chart): cuchar {.importcpp: "#.autosize(@)", header: flh_chart.}
proc `autosize=`*(self: Chart; n: cuchar) {.importcpp: "#.autosize(@)", header: flh_chart.}

