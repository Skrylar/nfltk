
import enumerations
import image

const
  flh = "FL/Fl_Widget.H"
  FL_RESERVED_TYPE* = 100

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

proc draw*(self: Label; x, y, w, h: cint; a: Align) {.importcpp: "#.draw(@)", header: flh.}
proc measure*(self: Label; w, h: out cint) {.importcpp: "#.measure(@)", header: flh.}

type
  WidgetObj* {.importc: "Fl_Widget", header: flh.} = object {.inheritable.}
  Widget* = ptr WidgetObj

  Callback*  = proc(w: Widget; user: pointer)
  Callback0* = proc(w: Widget)
  Callback1* = proc(w: Widget; a: clong)

proc free*(self: Widget) {.importcpp: "delete @", header: flh.}

# static routines
proc default_callback*(cb: Widget; d: pointer) {.importcpp: "Fl_Widget::default_callback(@)".}
proc label_shortcut*(t: cstring): cuint {.importcpp: "Fl_Widget::label_shortcut(@)".}
proc test_shortcut*(x: cstring; require_alt: bool = false): cint {.importcpp: "Fl_Widget::test_shortcut(@)".}

proc draw*(self: Widget) {.importcpp: "#.draw(@)", header: flh.}
proc handle*(self: Widget; event: cint): cint {.importcpp: "#.handle(@)", header: flh.}
proc is_label_copied*(self: Widget): cint {.importcpp: "#.is_label_copied(@)", header: flh.}
proc x*(self: Widget): cint {.importcpp: "#.x(@)", header: flh.}
proc y*(self: Widget): cint {.importcpp: "#.y(@)", header: flh.}
proc w*(self: Widget): cint {.importcpp: "#.w(@)", header: flh.}
proc h*(self: Widget): cint {.importcpp: "#.h(@)", header: flh.}
proc resize*(self: Widget; x, y, w, h: cint) {.importcpp: "#.resize(@)", header: flh.}
proc position*(self: Widget; X, Y: cint) {.importcpp: "#.position(@)", header: flh.}
proc size*(self: Widget; W, H: cint) {.importcpp: "#.size(@)", header: flh.}
proc color*(self: Widget; bg, sel: Color) {.importcpp: "#.color(@)", header: flh.}
proc copy_label*(self: Widget; new_label: cstring) {.importcpp: "#.copy_label(@)", header: flh.}
proc label*(self: Widget; a: Labeltype; b: cstring) {.importcpp: "#.label(@)", header: flh.}
proc copy_tooltip*(self: Widget; text: cstring) {.importcpp: "#.copy_tooltip(@)", header: flh.}

proc type*(self: Widget): cuchar {.importcpp: "#.type(@)", header: flh, header: flh.}
proc `type=`*(self: Widget; t: cuchar) {.importcpp: "#.type(@)", header: flh.}

proc align*(self: Widget): Align {.importcpp: "#.align(@)", header: flh.}
proc `align=`*(self: Widget; alignment: Align) {.importcpp: "#.align(@)", header: flh.}

proc box*(self: Widget): Boxtype {.importcpp: "#.box(@)", header: flh.}
proc `box=`*(self: Widget; new_box: Boxtype) {.importcpp: "#.box(@)", header: flh.}

proc color*(self: Widget): Color {.importcpp: "#.color(@)", header: flh.}
proc `color=`*(self: Widget; bg: Color) {.importcpp: "#.color(@)", header: flh.}

proc selection_color*(self: Widget): Color {.importcpp: "#.selection_color(@)", header: flh.}
proc `selection_color=`*(self: Widget; a: Color) {.importcpp: "#.selection_color(@)", header: flh.}

proc label*(self: Widget): cstring {.importcpp: "#.label(@)", header: flh.}
proc `label=`*(self: Widget; text: cstring) {.importcpp: "#.label(@)", header: flh.}

proc labeltype*(self: Widget): Labeltype {.importcpp: "#.labeltype(@)", header: flh.}
proc `labeltype=`*(self: Widget; a: Labeltype) {.importcpp: "#.labeltype(@)", header: flh.}

proc labelcolor*(self: Widget): Color {.importcpp: "#.labelcolor(@)", header: flh.}
proc `labelcolor=`*(self: Widget; c: Color) {.importcpp: "#.labelcolor(@)", header: flh.}

proc labelfont*(self: Widget): Font {.importcpp: "#.labelfont(@)", header: flh.}
proc `labelfont=`*(self: Widget; f: Font) {.importcpp: "#.labelfont(@)", header: flh.}

proc labelsize*(self: Widget): Fontsize {.importcpp: "#.labelsize(@)", header: flh.}
proc `labelsize=`*(self: Widget; size: Fontsize) {.importcpp: "#.labelsize(@)", header: flh.}

proc image*(self: Widget): Image {.importcpp: "#.image(@)", header: flh.}
proc `image=`*(img: Image) {.importcpp: "#.image(@)", header: flh, header: flh.}

#image(Image& img)

proc deimage*(self: Widget): Image {.importcpp: "#.deimage(@)", header: flh.}
proc `deimage=`*(self: Widget; img: Image) {.importcpp: "#.deimage(@)", header: flh.}

#deimage(Image& img)

proc tooltip*(self: Widget): cstring {.importcpp: "#.tooltip(@)", header: flh.}
proc `tooltip=`*(self: Widget; text: cstring) {.importcpp: "#.tooltip(@)", header: flh.}

proc callback*(self: Widget): Callback {.importcpp: "#.callback(@)", header: flh.}
proc callback*(self: Widget; cb: Callback; p: pointer) {.importcpp: "#.callback(@)", header: flh.}
proc callback*(self: Widget; cb: Callback) {.importcpp: "#.callback(@)", header: flh.}
proc callback*(self: Widget; cb: Callback0) {.importcpp: "#.callback(@)", header: flh.}
proc callback*(self: Widget; cb: Callback1; p: clong = 0) {.importcpp: "#.callback(@)", header: flh.}

proc user_data*(self: Widget): pointer {.importcpp: "#.user_data(@)", header: flh.}
proc `user_data=`*(self: Widget; v: pointer) {.importcpp: "#.user_data(@)", header: flh.}

proc argument*(self: Widget): clong {.importcpp: "#.argument(@)", header: flh.}
proc `argument=`*(self: Widget; v: clong) {.importcpp: "#.argument(@)", header: flh.}

proc whenn*(self: Widget): When {.importcpp: "#.when(@)", header: flh.}
proc `whenn=`*(self: Widget; i: cuchar) {.importcpp: "#.when(@)", header: flh, header: flh.}

proc visible_focus*(self: Widget): cuint {.importcpp: "#.visible_focus(@)", header: flh.}
proc `visible_focus=`*(self: Widget; v: cint) {.importcpp: "#.visible_focus(@)", header: flh.}

proc visible*(self: Widget): cuint {.importcpp: "#.visible(@)", header: flh.}
proc visible_r*(self: Widget): cint {.importcpp: "#.visible_r(@)", header: flh.}
proc show*(self: Widget) {.importcpp: "#.show(@)", header: flh.}
proc hide*(self: Widget) {.importcpp: "#.hide(@)", header: flh.}
proc set_visible*(self: Widget) {.importcpp: "#.set_visible(@)", header: flh.}
proc clear_visible*(self: Widget) {.importcpp: "#.clear_visible(@)", header: flh.}
proc active*(self: Widget): cuint {.importcpp: "#.active(@)", header: flh.}
proc active_r*(self: Widget): cint {.importcpp: "#.active_r(@)", header: flh.}
proc activate*(self: Widget) {.importcpp: "#.activate(@)", header: flh.}
proc deactivate*(self: Widget) {.importcpp: "#.deactivate(@)", header: flh.}
proc output*(self: Widget): cuint {.importcpp: "#.output(@)", header: flh.}
proc set_output*(self: Widget) {.importcpp: "#.set_output(@)", header: flh.}
proc clear_output*(self: Widget) {.importcpp: "#.clear_output(@)", header: flh.}
proc takesevents*(self: Widget): cuint {.importcpp: "#.takesevents(@)", header: flh.}
proc changed*(self: Widget): cuint {.importcpp: "#.changed(@)", header: flh.}
proc set_changed*(self: Widget) {.importcpp: "#.set_changed(@)", header: flh.}
proc clear_changed*(self: Widget) {.importcpp: "#.clear_changed(@)", header: flh.}
proc clear_active*(self: Widget) {.importcpp: "#.clear_active(@)", header: flh.}
proc set_active*(self: Widget) {.importcpp: "#.set_active(@)", header: flh.}
proc take_focus*(self: Widget): cint {.importcpp: "#.take_focus(@)", header: flh.}
proc set_visible_focus*(self: Widget) {.importcpp: "#.set_visible_focus(@)", header: flh.}
proc clear_visible_focus*(self: Widget) {.importcpp: "#.clear_visible_focus(@)", header: flh.}
proc do_callback*(self: Widget) {.importcpp: "#.do_callback(@)", header: flh.}
proc do_callback*(self: Widget; o: Widget; arg: clong) {.importcpp: "#.do_callback(@)", header: flh.}
proc test_shortcut*(self: Widget): cint {.importcpp: "#.test_shortcut(@)", header: flh, header: flh.}
proc contains*(self: Widget; w: Widget): cint {.importcpp: "#.contains(@)", header: flh.}
proc inside*(self: Widget; wgt: Widget): cint {.importcpp: "#.inside(@)", header: flh.}
proc redraw*(self: Widget) {.importcpp: "#.redraw(@)", header: flh.}
proc redraw_label*(self: Widget) {.importcpp: "#.redraw_label(@)", header: flh.}
proc damage*(self: Widget): cuchar {.importcpp: "#.damage(@)", header: flh.}
proc clear_damage*(self: Widget; c: uint8 = 0) {.importcpp: "#.clear_damage(@)", header: flh.}
proc damage*(self: Widget; c: cuchar) {.importcpp: "#.damage(@)", header: flh.}
proc damage*(self: Widget; c: cuchar; x, y, w, h: cint) {.importcpp: "#.damage(@)", header: flh.}
proc draw_label*(self: Widget; x, y, w, h: cint; a: Align) {.importcpp: "#.draw_label(@)", header: flh.}
proc measure_label*(self: Widget; ww, hh: out cint) {.importcpp: "#.measure_label(@)", header: flh.}
proc use_accents_menu*(self: Widget): cint {.importcpp: "#.use_accents_menu(@)", header: flh.}
proc color2*(self: Widget): Color {.importcpp: "#.color2(@)", header: flh.}
proc color2*(self: Widget; a: cuint) {.importcpp: "#.color2(@)", header: flh.}

#Group* as_group()
#Window* as_window()
#Gl_Window* as_gl_window()

proc label*(self: Image; w: Widget) {.importcpp: "#.label(@)", header: "FL/Fl_Image.H".}
proc label*(self: Pixmap; w: Widget) {.importcpp: "#.label(@)", header: "FL/Fl_Pixmap.H".}
proc label*(self: RGB_Image; w: Widget) {.importcpp: "#.label(@)", header: "FL/Fl_RGB_Image.H".}
proc label*(self: Bitmap; w: Widget) {.importcpp: "#.label(@)", header: "FL/Fl_Bitmap.H".}

