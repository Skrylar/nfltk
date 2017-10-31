
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
  SliderObj* {.importc: "Fl_Slider", header: flh_slider.} = object of ValuatorObj
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

proc make_slider*(X, Y, W, H: cint; text: cstring = nil): Slider {.importcpp: "new Fl_Slider(@)", header: flh_slider.}

proc scrollvalue*(self: Slider; pos, size, first, total: cint): cint {.importcpp: "#.scrollvalue(@)", header: flh_slider.}
proc bounds*(self: Slider; a, b: cdouble) {.importcpp: "#.bounds(@)", header: flh_slider.}
proc slider_size*(self: Slider): cfloat {.importcpp: "#.slider_size(@)", header: flh_slider.}
proc `slider_size=`*(self: Slider; v: cdouble) {.importcpp: "#.slider_size(@)", header: flh_slider.}
proc slider*(self: Slider): Boxtype {.importcpp: "#.slider(@)", header: flh_slider.}
proc `slider=`*(self: Slider; c: Boxtype) {.importcpp: "#.slider(@)", header: flh_slider.}

const
  flh_counter = "FL/Fl_Counter.H"
  flh_simplecounter = "FL/Fl_Simple_Counter.H"
type
  CounterObj* {.importc: "Fl_Counter", header: flh_counter.} = object of ValuatorObj
  Counter* = ptr CounterObj

  SimpleCounterObj* {.importc: "Fl_Simple_Counter", header: flh_counter.} = object of CounterObj
  SimpleCounter* = ptr SimpleCounterObj

type
  ValuatorType* = cint
const
  VALUATOR_NORMAL_COUNTER* = 0
  VALUATOR_SIMPLE_COUNTER* = 1

proc make_counter*(x, y, w, h: cint; text: cstring = nil): Counter {.importcpp: "new Fl_Counter(@)", header: flh_counter.}
proc make_simple_counter*(x, y, w, h: cint; text: cstring = nil): SimpleCounter {.importcpp: "new Fl_Simple_Counter(@)", header: flh_simplecounter.}

proc `lstep=`*(self: Counter; a: cdouble) {.importcpp: "#.lstep(@)", header: flh_counter.}
proc step*(self: Counter; a, b: cdouble) {.importcpp: "#.step(@)", header: flh_counter.}
proc `step=`*(self: Counter; a: cdouble) {.importcpp: "#.step(@)", header: flh_counter.}
proc step*(self: Counter): cdouble {.importcpp: "#.step(@)", header: flh_counter.}
proc textfont*(self: Counter): Font {.importcpp: "#.textfont(@)", header: flh_counter.}
proc `textfont=`*(self: Counter; s: Font) {.importcpp: "#.textfont(@)", header: flh_counter.}
proc textsize*(self: Counter): Fontsize {.importcpp: "#.textsize(@)", header: flh_counter.}
proc `textsize=`*(self: Counter; s: Fontsize) {.importcpp: "#.textsize(@)", header: flh_counter.}
proc textcolor*(self: Counter): Color {.importcpp: "#.textcolor(@)", header: flh_counter.}
proc `textcolor=`*(self: Counter; s: Color) {.importcpp: "#.textcolor(@)", header: flh_counter.}

const
  flh_dial = "FL/Fl_Dial.H"
type
  DialObj* {.importc: "Fl_Dial", header: flh_dial.} = object of ValuatorObj
  Dial* = ptr DialObj

const
  NORMAL_DIAL_TYPE* = 0
  LINE_DIAL_TYPE* = 1
  FILL_DIAL_TYPE* = 2

proc make_dial*(x, y, w, h: cint; text: cstring = nil): Dial {.importcpp: "new Fl_Dial(@)", header: flh_dial.}

proc angle1*(self: Dial): cshort {.importcpp: "#.angle1(@)", header: flh_dial.}
proc angle1*(self: Dial; a: cshort) {.importcpp: "#.angle1(@)", header: flh_dial.}
proc angle2*(self: Dial): cshort {.importcpp: "#.angle2(@)", header: flh_dial.}
proc angle2*(self: Dial; a: cshort) {.importcpp: "#.angle2(@)", header: flh_dial.}
proc angles*(self: Dial; a, b: cshort) {.importcpp: "#.angles(@)", header: flh_dial.}

const
  flh_scrollbar = "FL/Fl_Scrollbar.H"
type
  ScrollbarObj* {.importc: "Fl_Scrollbar", header: flh_scrollbar.} = object of SliderObj
  Scrollbar* = ptr ScrollbarObj

proc make_scrollbar*(x, y, w, h: cint; text: cstring = nil): Scrollbar {.importcpp: "new Fl_Scrollbar(@)", header: flh_scrollbar.}

proc value*(self: Scrollbar): cint {.importcpp: "#.value(@)", header: flh_scrollbar.}
proc `value=`*(self: Scrollbar; p: cint): cint {.importcpp: "#.value(@)", header: flh_scrollbar.}
proc value*(self: Scrollbar; pos, windowSize, first, total: cint): cint {.importcpp: "#.value(@)", header: flh_scrollbar.}
proc linesize*(self: Scrollbar): cint {.importcpp: "#.linesize(@)", header: flh_scrollbar.}
proc `linesize=`*(self: Scrollbar; i: cint) {.importcpp: "#.linesize(@)", header: flh_scrollbar.}

const
  flh_clock = "FL/Fl_Clock.H"
type
  ClockOutputObj* {.importc: "Fl_Clock_Output", header: flh_clock.} = object of Widget
  ClockOutput* = ptr ClockOutputObj

  ClockObj* {.importc: "Fl_Clock", header: flh_clock.} = object of ClockOutputObj
  Clock* = ptr ClockObj

const
  SQUARE_CLOCK*  = 0
  ROUND_CLOCK*   = 1
  ANALOG_CLOCK*  = SQUARE_CLOCK
  DIGITAL_CLOCK* = SQUARE_CLOCK

proc make_clock_output*(x, y, w, h: cint; text: cstring = nil): ClockOutput {.importcpp: "new Fl_Clock_Output(@)", header: flh_clock.}

proc value*(self: ClockOutput; v: culong) {.importcpp: "#.value(@)", header: flh_clock.}
proc value*(self: ClockOutput; H, m, s: cint) {.importcpp: "#.value(@)", header: flh_clock.}
proc value*(self: ClockOutput): culong {.importcpp: "#.value(@)", header: flh_clock.}
proc hour*(self: ClockOutput): cint {.importcpp: "#.hour(@)", header: flh_clock.}
proc minute*(self: ClockOutput): cint {.importcpp: "#.minute(@)", header: flh_clock.}
proc second*(self: ClockOutput): cint {.importcpp: "#.second(@)", header: flh_clock.}

proc make_clock*(x, y, w, h: cint; text: cstring = nil): Clock{.importcpp: "new Fl_Clock_Output(@)", header: flh_clock.}
proc make_clock*(t: cuchar; x, y, w, h: cint; text: cstring = nil): Clock{.importcpp: "new Fl_Clock_Output(@)", header: flh_clock.}

const
  flh_filldial = "FL/Fl_Fill_Dial.H"
type
  FillDialObj* {.importc: "Fl_Fill_Dial", header: flh_filldial.} = object of DialObj
  FillDial* = ptr FillDialObj

proc make_filldial*(x, y, w, h: cint; text: cstring = nil): FillDial {.importcpp: "new Fl_Fill_Dial(@)", header: flh_filldial.}

const
  flh_fillslider = "FL/Fl_Fill_Slider.H"
type
  FillSliderObj* {.importc: "Fl_Slider", header: flh_fillslider.} = object of SliderObj
  FillSlider* = ptr FillSliderObj

proc make_fillslider*(x, y, w, h: cint; text: cstring = nil): FillSlider {.importcpp: "new Fl_Fill_Slider(@)", header: flh_fillslider.}

const
  flh_horfillslider = "FL/Fl_Hor_Fill_Slider.H"
type
  HorFillSliderObj* {.importc: "Fl_Hor_Fill_Slider", header: flh_horfillslider.} = object of SliderObj
  HorFillSlider* = ptr HorFillSliderObj

proc make_hor_fill_slider*(x, y, w, h: cint; text: cstring = nil): HorFillSlider {.importcpp: "new Fl_Hor_Fill_Slider(@)", header: flh_horfillslider.}

const
  flh_horniceslider = "FL/Fl_Hor_Nice_Slider.H"
type
  HorNiceSliderObj* {.importc: "Fl_Hor_Nice_Slider", header: flh_horniceslider.} = object of SliderObj
  HorNiceSlider* = ptr HorNiceSliderObj

proc make_HorNiceSlider*(x, y, w, h: cint; text: cstring = nil): HorNiceSlider {.importcpp: "new Fl_Hor_Nice_Slider(@)", header: flh_horniceslider.}

const
  flh_horslider = "FL/Fl_Hor_Slider.H"
type
  HorSliderObj* {.importc: "Fl_Hor_Slider", header: flh_horslider.} = object of SliderObj
  HorSlider* = ptr HorSliderObj

proc make_HorSlider*(x, y, w, h: cint; text: cstring = nil): HorSlider {.importcpp: "new Fl_Hor_Slider(@)", header: flh_horslider.}

const
  flh_horvalueslider = "FL/Fl_Hor_Value_Slider.H"
type
  HorValueSliderObj* {.importc: "Fl_Hor_Value_Slider", header: flh_horvalueslider.} = object of ValueSliderObj
  HorValueSlider* = ptr HorValueSliderObj

proc make_HorValueSlider*(x, y, w, h: cint; text: cstring = nil): HorValueSlider {.importcpp: "new Fl_Hor_Value_Slider(@)", header: flh_horvalueslider.}

const
  flh_linedial = "FL/Fl_Line_Dial.H"
type
  LineDialObj* {.importc: "Fl_Line_Dial", header: flh_linedial.} = object of DialObj
  LineDial* = ptr LineDialObj

proc make_LineDial*(x, y, w, h: cint; text: cstring = nil): LineDial {.importcpp: "new Fl_Line_Dial(@)", header: flh_linedial.}

const
  flh_niceslider = "FL/Fl_Nice_Slider.H"
type
  NiceSliderObj* {.importc: "Fl_Nice_Slider", header: flh_niceslider.} = object of SliderObj
  NiceSlider* = ptr NiceSliderObj

proc make_NiceSlider*(x, y, w, h: cint; text: cstring = nil): NiceSlider {.importcpp: "new Fl_Nice_Slider(@)", header: flh_niceslider.}