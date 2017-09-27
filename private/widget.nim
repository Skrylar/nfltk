
import enumerations
import image

const
  flh = "FL/Fl_Widget.H"

type
  fl_intptr_t* = csize
  fl_uintptr_t* = csize # won't be unsigned, but should be same bit size

type
  Label* {.importc: "Fl_Label".} = object
    value*: cstring
    image*: Image
    deimage*: Image
    font*: Font
    size*: Fontsize
    color*: Color
    alignn* {.importc: "align_".}: Align
    typee* {.importc: "type".}: cuchar

proc draw*(self: Label; x, y, w, h: cint; a: Align) {.importcpp: "#.draw(@)".}
proc measure*(self: Label; w, h: out cint) {.importcpp: "#.measure(@)".}

type
  WidgetObj* {.importc: "Fl_Widget", header: flh.} = object {.inheritable.}
  Widget* = ptr WidgetObj

  Callback*  = proc(w: Widget; user: pointer)
  Callback0* = proc(w: Widget)
  Callback1* = proc(w: Widget; a: clong)

proc free_widget*(self: Widget) {.importcpp: "delete @", header: flh.}

# static routines
proc default_callback*(cb: Widget; d: pointer) {.importcpp: "Fl_Widget::default_callback(@)".}
proc label_shortcut*(t: cstring): cuint {.importcpp: "Fl_Widget::label_shortcut(@)".}
proc test_shortcut*(x: cstring; require_alt: bool = false): cint {.importcpp: "Fl_Widget::test_shortcut(@)".}

proc draw*(self: Widget) {.importcpp: "#.draw(@)".}
proc handle*(self: Widget; event: cint): cint {.importcpp: "#.handle(@)".}
proc is_label_copied*(self: Widget): cint {.importcpp: "#.is_label_copied(@)".}
proc x*(self: Widget): cint {.importcpp: "#.x(@)".}
proc y*(self: Widget): cint {.importcpp: "#.y(@)".}
proc w*(self: Widget): cint {.importcpp: "#.w(@)".}
proc h*(self: Widget): cint {.importcpp: "#.h(@)".}
proc resize*(self: Widget; x, y, w, h: cint) {.importcpp: "#.resize(@)".}
proc position*(self: Widget; X, Y: cint) {.importcpp: "#.position(@)".}
proc size*(self: Widget; W, H: cint) {.importcpp: "#.size(@)".}
proc color*(self: Widget; bg, sel: Color) {.importcpp: "#.color(@)".}
proc copy_label*(self: Widget; new_label: cstring) {.importcpp: "#.copy_label(@)".}
proc label*(self: Widget; a: Labeltype; b: cstring) {.importcpp: "#.label(@)".}
proc copy_tooltip*(self: Widget; text: cstring) {.importcpp: "#.copy_tooltip(@)".}

proc type*(self: Widget): cuchar {.importcpp: "#.type(@)".}
proc `type=`*(t: cuchar) {.importcpp: "#.type(@)".}

proc align*(self: Widget): Align {.importcpp: "#.align(@)".}
proc `align=`*(alignment: Align) {.importcpp: "#.align(@)".}

proc box*(self: Widget): Boxtype {.importcpp: "#.box(@)".}
proc `box=`*(new_box: Boxtype) {.importcpp: "#.box(@)".}

proc color*(self: Widget): Color {.importcpp: "#.color(@)".}
proc `color=`*(bg: Color) {.importcpp: "#.color(@)".}

proc selection_color*(self: Widget): Color {.importcpp: "#.selection_color(@)".}
proc `selection_color=`*(a: Color) {.importcpp: "#.selection_color(@)".}

proc label*(self: Widget): cstring {.importcpp: "#.label(@)".}
proc `label=`*(text: cstring) {.importcpp: "#.label(@)".}

proc labeltype*(self: Widget): Labeltype {.importcpp: "#.labeltype(@)".}
proc `labeltype=`*(a: Labeltype) {.importcpp: "#.labeltype(@)".}

proc labelcolor*(self: Widget): Color {.importcpp: "#.labelcolor(@)".}
proc `labelcolor=`*(c: Color) {.importcpp: "#.labelcolor(@)".}

proc labelfont*(self: Widget): Font {.importcpp: "#.labelfont(@)".}
proc `labelfont=`*(f: Font) {.importcpp: "#.labelfont(@)".}

proc labelsize*(self: Widget): Fontsize {.importcpp: "#.labelsize(@)".}
proc `labelsize=`*(size: Fontsize) {.importcpp: "#.labelsize(@)".}

proc image*(self: Widget): Image {.importcpp: "#.image(@)".}
proc `image=`*(img: Image) {.importcpp: "#.image(@)".}

#image(Image& img)

proc deimage*(self: Widget): Image {.importcpp: "#.deimage(@)".}
proc `deimage=`*(img: Image) {.importcpp: "#.deimage(@)".}

#deimage(Image& img)

proc tooltip*(self: Widget): cstring {.importcpp: "#.tooltip(@)".}
proc `tooltip=`*(text: cstring) {.importcpp: "#.tooltip(@)".}

proc callback*(self: Widget): Callback {.importcpp: "#.callback(@)".}
proc callback*(self: Widget; cb: Callback; p: pointer) {.importcpp: "#.callback(@)".}
proc callback*(self: Widget; cb: Callback) {.importcpp: "#.callback(@)".}
proc callback*(self: Widget; cb: Callback0) {.importcpp: "#.callback(@)".}
proc callback*(self: Widget; cb: Callback1; p: clong = 0) {.importcpp: "#.callback(@)".}

proc user_data*(self: Widget): pointer {.importcpp: "#.user_data(@)".}
proc `user_data=`*(v: pointer) {.importcpp: "#.user_data(@)".}

proc argument*(self: Widget): clong {.importcpp: "#.argument(@)".}
proc `argument=`*(v: clong) {.importcpp: "#.argument(@)".}

proc whenn*(self: Widget): When {.importcpp: "#.when(@)".}
proc `whenn=`*(i: cuchar) {.importcpp: "#.when(@)".}

proc visible_focus*(self: Widget): cuint {.importcpp: "#.visible_focus(@)".}
proc `visible_focus=`*(v: cint) {.importcpp: "#.visible_focus(@)".}

proc visible*(self: Widget): cuint {.importcpp: "#.visible(@)".}
proc visible_r*(self: Widget): cint {.importcpp: "#.visible_r(@)".}
proc show*(self: Widget) {.importcpp: "#.show(@)".}
proc hide*(self: Widget) {.importcpp: "#.hide(@)".}
proc set_visible*(self: Widget) {.importcpp: "#.set_visible(@)".}
proc clear_visible*(self: Widget) {.importcpp: "#.clear_visible(@)".}
proc active*(self: Widget): cuint {.importcpp: "#.active(@)".}
proc active_r*(self: Widget): cint {.importcpp: "#.active_r(@)".}
proc activate*(self: Widget) {.importcpp: "#.activate(@)".}
proc deactivate*(self: Widget) {.importcpp: "#.deactivate(@)".}
proc output*(self: Widget): cuint {.importcpp: "#.output(@)".}
proc set_output*(self: Widget) {.importcpp: "#.set_output(@)".}
proc clear_output*(self: Widget) {.importcpp: "#.clear_output(@)".}
proc takesevents*(self: Widget): cuint {.importcpp: "#.takesevents(@)".}
proc changed*(self: Widget): cuint {.importcpp: "#.changed(@)".}
proc set_changed*(self: Widget) {.importcpp: "#.set_changed(@)".}
proc clear_changed*(self: Widget) {.importcpp: "#.clear_changed(@)".}
proc clear_active*(self: Widget) {.importcpp: "#.clear_active(@)".}
proc set_active*(self: Widget) {.importcpp: "#.set_active(@)".}
proc take_focus*(self: Widget): cint {.importcpp: "#.take_focus(@)".}
proc set_visible_focus*(self: Widget) {.importcpp: "#.set_visible_focus(@)".}
proc clear_visible_focus*(self: Widget) {.importcpp: "#.clear_visible_focus(@)".}
proc do_callback*(self: Widget) {.importcpp: "#.do_callback(@)".}
proc do_callback*(self: Widget; o: Widget; arg: clong) {.importcpp: "#.do_callback(@)".}
proc test_shortcut*(self: Widget): cint {.importcpp: "#.test_shortcut(@)".}
proc contains*(self: Widget; w: Widget): cint {.importcpp: "#.contains(@)".}
proc inside*(self: Widget; wgt: Widget): cint {.importcpp: "#.inside(@)".}
proc redraw*(self: Widget) {.importcpp: "#.redraw(@)".}
proc redraw_label*(self: Widget) {.importcpp: "#.redraw_label(@)".}
proc damage*(self: Widget): cuchar {.importcpp: "#.damage(@)".}
proc clear_damage*(self: Widget; c: uint8 = 0) {.importcpp: "#.clear_damage(@)".}
proc damage*(self: Widget; c: cuchar) {.importcpp: "#.damage(@)".}
proc damage*(self: Widget; c: cuchar; x, y, w, h: cint) {.importcpp: "#.damage(@)".}
proc draw_label*(self: Widget; x, y, w, h: cint; a: Align) {.importcpp: "#.draw_label(@)".}
proc measure_label*(self: Widget; ww, hh: out cint) {.importcpp: "#.measure_label(@)".}
proc use_accents_menu*(self: Widget): cint {.importcpp: "#.use_accents_menu(@)".}
proc color2*(self: Widget): Color {.importcpp: "#.color2(@)".}
proc color2*(self: Widget; a: cuint) {.importcpp: "#.color2(@)".}

#Group* as_group()
#Window* as_window()
#Gl_Window* as_gl_window()

