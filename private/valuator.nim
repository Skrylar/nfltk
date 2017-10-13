
const
  flh = "FL/Fl_Valuator.H"

import enumerations
import widget
import input

const
  FL_VERTICAL*   = 0
  FL_HORIZONTAL* = 1

type
  ValuatorObj* {.importc: "Fl_Valuator", header: flh.} = object of WidgetObj
  Valuator* = ptr ValuatorObj

proc bounds*(self: Valuator; a, b: cdouble) {.importc: "#.bounds(@)", header: flh.}
proc minimum*(self: Valuator): cdouble {.importc: "#.minimum(@)", header: flh.}
proc `minimum=`*(self: Valuator; a: cdouble) {.importc: "#.minimum(@)", header: flh.}
proc maximum*(self: Valuator): cdouble {.importc: "#.maximum(@)", header: flh.}
proc `maximum=`*(self: Valuator; a: cdouble) {.importc: "#.maximum(@)", header: flh.}
proc range*(self: Valuator; a, b: cdouble) {.importc: "#.range(@)", header: flh.}
proc `step=`*(self: Valuator; a: cint) {.importc: "#.step(@)", header: flh.}
proc step*(self: Valuator; a: cdouble; b: cint) {.importc: "#.step(@)", header: flh.}
proc `step=`*(self: Valuator; s: cdouble) {.importc: "#.step(@)", header: flh.}
proc step*(self: Valuator): cdouble {.importc: "#.step(@)", header: flh.}
proc precision*(self: Valuator; digits: cint) {.importc: "#.precision(@)", header: flh.}
proc value*(self: Valuator): cdouble {.importc: "#.value(@)", header: flh.}
proc value*(self: Valuator; a: cdouble): cint {.importc: "#.value(@)", header: flh.}
proc format*(self: Valuator; fmt: cstring): cint {.importc: "#.format(@)", header: flh.}
proc round*(self: Valuator; a: cdouble): cdouble {.importc: "#.round(@)", header: flh.}
proc clamp*(self: Valuator; a: cdouble): cdouble {.importc: "#.clamp(@)", header: flh.}
proc increment*(self: Valuator; a: cdouble; b: cint): cdouble {.importc: "#.increment(@)", header: flh.}

# Value slider
const
  flh_valueslider = "FL/Fl_Value_Slider.H"
type
  ValueSliderObj* {.importc: "Fl_Value_Slider", header: flh_valueslider.} = object of ValuatorObj
  ValueSlider* = ptr ValueSliderObj

proc make_valueslider*(x, y, w, h: cint; text: cstring = nil): ValueSlider {.importcpp: "new Fl_Value_Slider(@)", header: flh_valueslider.}

proc textfont*(self: ValueSlider): Font {.importcpp: "#.textfont(@)", header: flh_valueslider.}
proc `textfont=`*(self: ValueSlider; s: Font) {.importcpp: "#.textfont(@)", header: flh_valueslider.}
proc textsize*(self: ValueSlider): Fontsize {.importcpp: "#.textsize(@)", header: flh_valueslider.}
proc `textsize=`*(self: ValueSlider; s: Fontsize) {.importcpp: "#.textsize(@)", header: flh_valueslider.}
proc textcolor*(self: ValueSlider): Color {.importcpp: "#.textcolor(@)", header: flh_valueslider.}
proc `textcolor=`*(self: ValueSlider; s: Color) {.importcpp: "#.textcolor(@)", header: flh_valueslider.}

# Value Output
const
  flh_valueoutput = "FL/Fl_Value_Output.H"
type
  ValueOutputObj* {.importc: "Fl_Value_Output", header: flh_valueoutput.} = object of ValuatorObj
  ValueOutput* = ptr ValueOutputObj

proc make_valueoutput*(x, y, w, h: cint; text: cstring = nil): ValueOutput {.importcpp: "new Fl_Value_Output(@)", header: flh_valueoutput.}

proc soft*(self: ValueOutput): cuchar {.importcpp: "#.soft(@)", header: flh_valueoutput.}
proc `soft=`*(self: ValueOutput; s: cuchar) {.importcpp: "#.soft(@)", header: flh_valueoutput.}
proc textfont*(self: ValueOutput): Font {.importcpp: "#.textfont(@)", header: flh_valueoutput.}
proc `textfont=`*(self: ValueOutput; s: Font) {.importcpp: "#.textfont(@)", header: flh_valueoutput.}
proc textsize*(self: ValueOutput): Fontsize {.importcpp: "#.textsize(@)", header: flh_valueoutput.}
proc `textsize=`*(self: ValueOutput; s: Fontsize) {.importcpp: "#.textsize(@)", header: flh_valueoutput.}
proc textcolor*(self: ValueOutput): Color {.importcpp: "#.textcolor(@)", header: flh_valueoutput.}
proc `textcolor=`*(self: ValueOutput; s: Color) {.importcpp: "#.textcolor(@)", header: flh_valueoutput.}

# Value Input
const
  flh_valueinput = "FL/Fl_Value_Input.H"
type
  ValueInputObj* {.importc: "Fl_Value_Input", header: flh_valueinput.} = object of ValuatorObj
  ValueInput* = ptr ValueInputObj

proc make_valueinput*(x, y, w, h: cint; text: cstring = nil): ValueInput {.importcpp: "new Fl_Value_Input(@)", header: flh_valueinput.}

proc input*(self: ValueInput): Input {.importcpp: "(&#.input)", header: flh_valueinput.}
proc resize*(self: ValueInput; x, y, w, h: cint) {.importcpp: "#.resize(@)", header: flh_valueinput.}
proc shortcut*(self: ValueInput): cint {.importcpp: "#.shortcut(@)", header: flh_valueinput.}
proc `shortcut=`*(self: ValueInput; s: cint) {.importcpp: "#.shortcut(@)", header: flh_valueinput.}
proc soft*(self: ValueInput): cuchar {.importcpp: "#.soft(@)", header: flh_valueinput.}
proc `soft=`*(self: ValueInput; s: cuchar) {.importcpp: "#.soft(@)", header: flh_valueinput.}
proc textfont*(self: ValueInput): Font {.importcpp: "#.textfont(@)", header: flh_valueinput.}
proc `textfont=`*(self: ValueInput; s: Font) {.importcpp: "#.textfont(@)", header: flh_valueinput.}
proc textsize*(self: ValueInput): Fontsize {.importcpp: "#.textsize(@)", header: flh_valueinput.}
proc `textsize=`*(self: ValueInput; s: Fontsize) {.importcpp: "#.textsize(@)", header: flh_valueinput.}
proc textcolor*(self: ValueInput): Color {.importcpp: "#.textcolor(@)", header: flh_valueinput.}
proc `textcolor=`*(self: ValueInput; s: Color) {.importcpp: "#.textcolor(@)", header: flh_valueinput.}
proc cursor_color*(self: ValueInput): Color {.importcpp: "#.cursor_color(@)", header: flh_valueinput.}
proc `cursor_color=`*(self: ValueInput; n: Color) {.importcpp: "#.cursor_color(@)", header: flh_valueinput.}

const
  flh_slider = "FL/Fl_Slider.H"
type
  SliderObj* = object of ValuatorObj
  Slider* = ptr SliderObj

type
  SliderType* = cint
const
  SLIDER_VERT_SLIDER*      = 0
  SLIDER_HOR_SLIDER*       = 1
  SLIDER_VERT_FILL_SLIDER* = 2
  SLIDER_HOR_FILL_SLIDER*  = 3
  SLIDER_VERT_NICE_SLIDER* = 4
  SLIDER_HOR_NICE_SLIDER*  = 5

proc make_slider((X, Y, W, H: cint; text: cstring = nil) {.importcpp: "new Fl_Slider(@)", header: flh_slider.}

proc scrollvalue*(self: Slider; pos, size, first, total: cint): cint {.importcpp: "#.scrollvalue(@)", header: flh_slider.}
proc bounds*(self: Slider; a, b: cdouble) {.importcpp: "#.bounds(@)", header: flh_slider.}
proc slider_size*(self: Slider): cfloat {.importcpp: "#.slider_size(@)", header: flh_slider.}
proc `slider_size=`*(self: Slider; v: cdouble) {.importcpp: "#.slider_size(@)", header: flh_slider.}
proc slider*(self: Slider): Boxtype {.importcpp: "#.slider(@)", header: flh_slider.}
proc `slider=`*(self: Slider; c: Boxtype) {.importcpp: "#.slider(@)", header: flh_slider.}

