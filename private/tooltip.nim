
import enumerations
import widget

const
  flh = "FL/Fl_Tooltip.H"

#static void (*enter)(Fl_Widget* w);
#static void (*exit)(Fl_Widget *w);

proc tooltip_enter_area*(w: Widget; X, Y, W, H: cint; tip: cstring) {.importcpp: "Fl_Tooltip::enter_area(@)", header: flh.}
proc tooltip_delay*(): cfloat {.importcpp: "Fl_Tooltip::delay(@)", header: flh.}
proc `tooltip_delay=`*(f: cfloat) {.importcpp: "Fl_Tooltip::delay(@)", header: flh.}
proc tooltip_hoverdelay*(): cfloat {.importcpp: "Fl_Tooltip::hoverdelay(@)", header: flh.}
proc `tooltip_hoverdelay=`*(f: cfloat) {.importcpp: "Fl_Tooltip::hoverdelay(@)", header: flh.}
proc tooltip_enabled*(): cint {.importcpp: "Fl_Tooltip::enabled(@)", header: flh.}
proc `tooltip_enable=`*(b: cint = 1) {.importcpp: "Fl_Tooltip::enable(@)", header: flh.}
proc tooltip_disable*() {.importcpp: "Fl_Tooltip::disable(@)", header: flh.}
proc tooltip_current*(): Widget {.importcpp: "Fl_Tooltip::current(@)", header: flh.}
proc `tooltip_current=`*(w: Widget) {.importcpp: "Fl_Tooltip::current(@)", header: flh.}
proc tooltip_font*(): Font {.importcpp: "Fl_Tooltip::font(@)", header: flh.}
proc `tooltip_font=`*(i: Font) {.importcpp: "Fl_Tooltip::font(@)", header: flh.}
proc tooltip_size*(): Fontsize {.importcpp: "Fl_Tooltip::size(@)", header: flh.}
proc `tooltip_size=`*(s: Fontsize) {.importcpp: "Fl_Tooltip::size(@)", header: flh.}
proc tooltip_color*(): Color {.importcpp: "Fl_Tooltip::color(@)", header: flh.}
proc `tooltip_color=`*(c: Color) {.importcpp: "Fl_Tooltip::color(@)", header: flh.}
proc tooltip_textcolor*(): Color {.importcpp: "Fl_Tooltip::textcolor(@)", header: flh.}
proc `tooltip_textcolor=`*(c: Color) {.importcpp: "Fl_Tooltip::textcolor(@)", header: flh.}
proc tooltip_margin_width*(): cint {.importcpp: "Fl_Tooltip::margin_width(@)", header: flh.}
proc `tooltip_margin_width=`*(v: cint) {.importcpp: "Fl_Tooltip::margin_width(@)", header: flh.}
proc tooltip_margin_height*(): cint {.importcpp: "Fl_Tooltip::margin_height(@)", header: flh.}
proc `tooltip_margin_height=`*(v: cint) {.importcpp: "Fl_Tooltip::margin_height(@)", header: flh.}
proc tooltip_wrap_width*(): cint {.importcpp: "Fl_Tooltip::wrap_width(@)", header: flh.}
proc `tooltip_wrap_width=`*(v: cint) {.importcpp: "Fl_Tooltip::wrap_width(@)", header: flh.}

when defined(apple):
  proc tooltip_current_window*(): Window {.importcpp: "Fl_Tooltip::current_window(@)", header: flh.}

