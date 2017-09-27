
{.passL: "-lfltk".}

{.deadCodeElim: off.} # just for now

import private/enumerations
export enumerations

import private/window
export window

const
  flh = "FL/Fl.H"

var fl_local_ctrl* {.importc, header: flh.}: cstring
var fl_local_meta* {.importc, header: flh.}: cstring
var fl_local_alt* {.importc, header: flh.}: cstring
var fl_local_shift* {.importc, header: flh.}: cstring

when defined(Windows) and defined(amd64):
  type
    Socket* {.importc: "FL_SOCKET", header: flh.} = int64
else:
  type
    Socket* {.importc: "FL_SOCKET", header: flh.} = cint

type
  Label* {.importc: "Fl_Label*", header: flh.} = distinct pointer
  Shortcut* {.importc: "Fl_Shortcut*", header: flh.} = distinct pointer
  Font* {.importc: "Fl_Font*", header: flh.} = distinct pointer

type
  Label_Draw_F* {.importc: "Fl_Label_Draw_F", header: flh.} = proc(label: Label; x, y, w, h: cint; align: Align)
  Label_Measure_F* {.importc: "Fl_Label_Measure_F", header: flh.} = proc(label: Label; width, height: out cint)
  Box_Draw_F* {.importc: "Fl_Box_Draw_F", header: flh.} = proc(x, y, w, h: cint; color: Color)
  Timeout_Handler* {.importc: "Fl_Timeout_Handler", header: flh.} = proc(data: pointer)
  Awake_Handler* {.importc: "Fl_Awake_Handler", header: flh.} = proc(data: pointer)
  Idle_Handler* {.importc: "Fl_Idle_Handler", header: flh.} = proc(data: pointer)
  Old_Idle_Handler* {.importc: "Fl_Old_Idle_Handler", header: flh.} = proc()
  FD_Handler* {.importc: "Fl_FD_Handler", header: flh.} = proc(fd: Socket; data: pointer)
  Event_Handler* {.importc: "Fl_Event_Handler", header: flh.} = proc(event: cint): int
  System_Handler* {.importc: "Fl_System_Handler", header: flh.} = proc(event, data: pointer): int
  Abort_Handler* {.importc: "Fl_Abort_Handler", header: flh.} = proc(format: cstring) {.varargs.}
  Atclose_Handler* {.importc: "Fl_Atclose_Handler", header: flh.} = proc(window: Window, data: pointer)
  Args_Handler* {.importc: "Fl_Args_Handler", header: flh.} = proc(argc: cint; argv: ptr cstring; i: out cint): int
  Event_Dispatch* {.importc: "Fl_Event_Dispatch", header: flh.} = proc(event: cint; w: Window): int
  Clipboard_Notify_Handler* {.importc: "Fl_Clipboard_Notify_Handler", header: flh.} = proc(source: cint; data: pointer)

type
  # kept the prefix here because the enum belongs solely to the Fl
  # class.
  Fl_Option* {.importc: "Fl::Fl_Option", header: flh.} = enum
    OPTION_ARROW_FOCUS = 0
    OPTION_VISIBLE_FOCUS
    OPTION_DND_TEXT
    OPTION_SHOW_TOOLTIPS
    OPTION_FNFC_USES_GTK
    OPTION_LAST

var help* {.importc: "Fl::help", header: flh.}: cstring
var clipboard_plain_text* {.importc: "Fl::clipboard_plain_text", header: flh.}: cstring
var clipboard_image* {.importc: "Fl::clipboard_image", header: flh.}: cstring

proc option*(opt: Fl_Option): bool {.importc: "Fl::option", header: flh.}
proc option*(opt: Fl_Option; val: bool) {.importc: "Fl::option", header: flh.}
proc version*(): cdouble {.importc: "Fl::version", header: flh.}
proc api_version*(): cint {.importc: "Fl::api_version", header: flh.}
proc abi_version*(): cint {.importc: "Fl::abi_version", header: flh.}
proc arg*(argc: cint; argv: ptr cstring; i: var cint): cint {.importc: "Fl::arg", header: flh.}
proc args*(argc: cint; argv: ptr cstring; i: var cint; db: Args_Handler = nil): cint {.importc: "Fl::args", header: flh.}
proc args*(argc: cint; argv: ptr cstring) {.importc: "Fl::args", header: flh.}
proc display*(s: cstring) {.importc: "Fl::display", header: flh.}
proc visual*(a: cint): cint {.importc: "Fl::visual", header: flh.}
proc gl_visual*(a: cint; alist: ptr int = nil): cint {.importc: "Fl::gl_visual", header: flh.}
proc own_colormap*() {.importc: "Fl::own_colormap", header: flh.}
proc get_system_colors*() {.importc: "Fl::get_system_colors", header: flh.}
proc foreground*(r, g, b: cuchar) {.importc: "Fl::foreground", header: flh.}
proc background*(r, g, b: cuchar) {.importc: "Fl::background", header: flh.}
proc background2*(r, g, b: cuchar) {.importc: "Fl::background2", header: flh.}
proc scheme*(name: cstring): cint {.importc: "Fl::scheme", header: flh.}
proc scheme*(): cstring {.importc: "Fl::scheme", header: flh.}
proc reload_scheme*(): cint {.importc: "Fl::reload_scheme", header: flh.}
proc scrollbar_size*(): cint {.importc: "Fl::scrollbar_size", header: flh.}
proc scrollbar_size*(w: cint) {.importc: "Fl::scrollbar_size", header: flh.}
proc wait*(): cint {.importc: "Fl::wait", header: flh.}
proc wait*(time: cdouble) {.importc: "Fl::wait", header: flh.}
proc check*(): cint {.importc: "Fl::check", header: flh.}
proc ready*(): cint {.importc: "Fl::ready", header: flh.}
proc run*(): cint {.importc: "Fl::run", header: flh.}
proc readqueue*(): Widget {.importc: "Fl::readqueue", header: flh.}
proc add_timeout*(t: cdouble; h: Timeout_Handler; user: pointer = nil) {.importc: "Fl::add_timeout", header: flh.}
proc repeat_timeout*(t: cdouble; h: Timeout_Handler; user: pointer = nil) {.importc: "Fl::repeat_timeout", header: flh.}
proc has_timeout*(h: Timeout_Handler; user: pointer = nil): int  {.importc: "Fl::has_timeout", header: flh.}
proc remove_timeout*(h: Timeout_Handler; user: pointer = nil) {.importc: "Fl::remove_timeout", header: flh.}
proc add_check*(h: Timeout_Handler; user: pointer = nil) {.importc: "Fl::add_check", header: flh.}
proc has_check*(h: Timeout_Handler; user: pointer = nil): int  {.importc: "Fl::has_check", header: flh.}
proc remove_check*(h: Timeout_Handler; user: pointer = nil) {.importc: "Fl::remove_check", header: flh.}
proc add_fd*(fd, whn: cint; cb: FD_Handler, user: pointer = nil) {.importc: "Fl::add_fd", header: flh.}
proc add_fd*(fd: cint; cb: FD_Handler; user: pointer = nil) {.importc: "Fl::add_fd", header: flh.}
proc remove_fd*(fd, whn: cint) {.importc: "Fl::remove_fd", header: flh.}
proc remove_fd*(fd: cint) {.importc: "Fl::remove_fd", header: flh.}
proc add_idle*(cb: Idle_Handler; data: pointer = nil) {.importc: "Fl::add_idle", header: flh.}
proc has_idle*(cb: Idle_Handler; data: pointer = nil): int  {.importc: "Fl::has_idle", header: flh.}
proc remove_idle*(db: Idle_Handler; data: pointer = nil) {.importc: "Fl::remove_idle", header: flh.}
proc damage*(): int {.importc: "Fl::damage", header: flh.}
proc redraw*() {.importc: "Fl::redraw", header: flh.}
proc flush*() {.importc: "Fl::flush", header: flh.}
proc warning*(fmt: cstring) {.varargs, importc: "Fl::warning", header: flh.}
proc error*(fmt: cstring) {.varargs, importc: "Fl::error", header: flh.}
proc fatal*(fmt: cstring) {.varargs, importc: "Fl::fatal", header: flh.}
proc first_window*(): Window {.importc: "Fl::first_window", header: flh.}
proc first_window*(w: Window) {.importc: "Fl::first_window", header: flh.}
proc next_window*(w: Window): Window {.importc: "Fl::next_window", header: flh.}
proc modal*(): Window {.importc: "Fl::modal", header: flh.}
proc grab*(): Window {.importc: "Fl::grab", header: flh.}
proc grab*(w: Window) {.importc: "Fl::grab", header: flh.}
proc event*(): int {.importc: "Fl::event", header: flh.}
proc event_x*(): int {.importc: "Fl::event_x", header: flh.}
proc event_y*(): int {.importc: "Fl::event_y", header: flh.}
proc event_x_root*(): int {.importc: "Fl::event_x_root", header: flh.}
proc event_y_root*(): int {.importc: "Fl::event_y_root", header: flh.}
proc event_dx*(): int {.importc: "Fl::event_dx", header: flh.}
proc event_dy*(): int {.importc: "Fl::event_dy", header: flh.}
proc get_mouse*(x, y: var cint) {.importc: "Fl::get_mouse", header: flh.}
proc event_clicks*(): int {.importc: "Fl::event_clicks", header: flh.}
proc event_clicks*(i: cint) {.importc: "Fl::event_clicks", header: flh.}
proc event_is_click*(): int {.importc: "Fl::event_is_click", header: flh.}
proc event_is_click*(i: cint) {.importc: "Fl::event_is_click", header: flh.}
proc event_button*(): int {.importc: "Fl::event_button", header: flh.}
proc event_state*(): int {.importc: "Fl::event_state", header: flh.}
proc event_key*(): int {.importc: "Fl::event_key", header: flh.}
proc event_original_key*(): int {.importc: "Fl::event_original_key", header: flh.}
proc event_key*(key: int): int {.importc: "Fl::event_key", header: flh.}
proc get_key*(key: int): int {.importc: "Fl::get_key", header: flh.}
proc event_text*(): cstring {.importc: "Fl::event_text", header: flh.}
proc event_length*(): int {.importc: "Fl::event_length", header: flh.}
proc event_clipboard*(): pointer {.importc: "Fl::event_clipboard", header: flh.}
proc event_clipboard_type*(): cstring {.importc: "Fl::event_clipboard_type", header: flh.}
proc compose*(del: var cint): int {.importc: "Fl::compose", header: flh.}
proc compose_reset*() {.importc: "Fl::compose_reset", header: flh.}
proc event_inside*(a, b, c, d: cint): int {.importc: "Fl::event_inside", header: flh.}
proc event_inside*(w: Widget): int {.importc: "Fl::event_inside", header: flh.}
proc test_shortcut*(s: Shortcut): int {.importc: "Fl::test_shortcut", header: flh.}
proc enable_im*() {.importc: "Fl::enable_im", header: flh.}
proc disable_im*() {.importc: "Fl::disable_im", header: flh.}
proc handle*(a: cint; w: Window): int {.importc: "Fl::handle", header: flh.}
#proc handle_*(a: cint; w: Window): int {.importc: "Fl::handle_", header: flh.}
proc belowmouse*(): Widget {.importc: "Fl::belowmouse", header: flh.}
proc belowmouse*(w: Widget) {.importc: "Fl::belowmouse", header: flh.}
proc pushed*(): Widget {.importc: "Fl::pushed", header: flh.}
proc pushed*(w: Widget) {.importc: "Fl::pushed", header: flh.}
proc focus*(): Widget {.importc: "Fl::focus", header: flh.}
proc focus*(w: Widget) {.importc: "Fl::focus", header: flh.}
proc add_handler*(h: Event_Handler) {.importc: "Fl::add_handler", header: flh.}
proc remove_handler*(h: Event_Handler) {.importc: "Fl::remove_handler", header: flh.}
proc add_system_handler*(h: System_Handler; data: pointer) {.importc: "Fl::add_system_handler", header: flh.}
proc remove_system_handler*(h: System_Handler) {.importc: "Fl::remove_system_handler", header: flh.}
proc event_dispatch*(d: Event_Dispatch) {.importc: "Fl::event_dispatch", header: flh.}
proc event_dispatch*(): Event_Dispatch {.importc: "Fl::event_dispatch", header: flh.}
# TODO proc copy*(stuff: pointer; length: cint; destination: cint = 0; typ: cstring = Fl::clipboard_plain_text) {.importc: "Fl::copy", header: flh.}
proc add_clipboard_notify*(h: Clipboard_Notify_Handler; data: pointer = nil) {.importc: "Fl::add_clipboard_notify", header: flh.}
proc remove_clipboard_notify*(h: Clipboard_Notify_Handler) {.importc: "Fl::remove_clipboard_notify", header: flh.}
proc clipboard_contains*(typ: cstring): cint {.importc: "Fl::clipboard_contains", header: flh.}
proc dnd*(): cint {.importc: "Fl::dnd", header: flh.}
proc selection_owner*(): Widget {.importc: "Fl::selection_owner", header: flh.}
proc selection_owner*(w: Widget) {.importc: "Fl::selection_owner", header: flh.}
proc x*(): cint {.importc: "Fl::x", header: flh.}
proc y*(): cint {.importc: "Fl::y", header: flh.}
proc w*(): cint {.importc: "Fl::w", header: flh.}
proc h*(): cint {.importc: "Fl::h", header: flh.}
proc screen_count*(): cint {.importc: "Fl::screen_count", header: flh.}
proc screen_xywh*(X, Y, W, H: out cint) {.importc: "Fl::screen_xywh", header: flh.}
proc screen_xywh*(X, Y, W, H: out cint; mx, my: cint) {.importc: "Fl::screen_xywh", header: flh.}
proc screen_xywh*(X, Y, W, H: out cint; n: cint) {.importc: "Fl::screen_xywh", header: flh.}
proc screen_xywh*(X, Y, W, H: out cint; mx, my, mw, mh: cint) {.importc: "Fl::screen_xywh", header: flh.}
proc screen_num*(x, y: cint): cint {.importc: "Fl::screen_num", header: flh.}
proc screen_num*(x, y, w, h: cint): cint {.importc: "Fl::screen_num", header: flh.}
proc screen_dpi*(h, v: out cfloat; n: cint = 0) {.importc: "Fl::screen_dpi", header: flh.}
proc screen_work_area*(X, Y, W, H: out cint; mx, my: cint) {.importc: "Fl::screen_work_area", header: flh.}
proc screen_work_area*(X, Y, W, H: out cint; n: cint): cint {.importc: "Fl::screen_work_area", header: flh.}
proc set_color*(c: Color; r, g, b: cuchar) {.importc: "Fl::set_color", header: flh.}
proc set_color*(c: Color; ci: cuint) {.importc: "Fl::set_color", header: flh.}
proc get_color*(c: Color): cuint {.importc: "Fl::get_color", header: flh.}
proc get_color*(c: Color; red, green, blue: cuchar) {.importc: "Fl::get_color", header: flh.}
proc free_color*(c: Color; overlay: cint = 0) {.importc: "Fl::free_color", header: flh.}
proc get_font*(f: Font): cstring {.importc: "Fl::get_font", header: flh.}
proc get_font_name*(f: Font; attributes: ptr cint = nil): cstring {.importc: "Fl::get_font_name", header: flh.}
proc set_font*(f: Font; name: cstring) {.importc: "Fl::set_font", header: flh.}
proc set_font*(f, f2: Font) {.importc: "Fl::set_font", header: flh.}
proc set_fonts*(name: cstring): Font {.importc: "Fl::set_fonts", header: flh.}
proc set_labeltype*(typ: Labeltype; f: Label_Draw_F; f2: Label_Measure_F) {.importc: "Fl::set_labeltype", header: flh.}
proc set_labeltype*(typ: Labeltype; frm: Labeltype) {.importc: "Fl::set_labeltype", header: flh.}
proc get_boxtype*(typ: Boxtype): Box_Draw_F {.importc: "Fl::get_boxtype", header: flh.}
proc set_boxtype*(typ: Boxtype; f: Box_Draw_F; a, b, c, d: cuchar) {.importc: "Fl::set_boxtype", header: flh.}
proc set_boxtype*(typ: Boxtype; frm: Boxtype) {.importc: "Fl::set_boxtype", header: flh.}
proc box_dx*(typ: Boxtype): cint {.importc: "Fl::box_dx", header: flh.}
proc box_dy*(typ: Boxtype): cint {.importc: "Fl::box_dy", header: flh.}
proc box_dw*(typ: Boxtype): cint {.importc: "Fl::box_dw", header: flh.}
proc box_dh*(typ: Boxtype): cint {.importc: "Fl::box_dh", header: flh.}
proc draw_box_active*(): cint {.importc: "Fl::draw_box_active", header: flh.}
proc box_color*(c: Color): Color {.importc: "Fl::box_color", header: flh.}
proc set_box_color*(c: Color) {.importc: "Fl::set_box_color", header: flh.}
proc event_shift*(): cint {.importc: "Fl::event_shift", header: flh.}
proc event_ctrl*(): cint {.importc: "Fl::event_ctrl", header: flh.}
proc event_command*(): cint {.importc: "Fl::event_command", header: flh.}
proc event_alt*(): cint {.importc: "Fl::event_alt", header: flh.}
proc event_buttons*(): cint {.importc: "Fl::event_buttons", header: flh.}
proc event_button1*(): cint {.importc: "Fl::event_button1", header: flh.}
proc event_button2*(): cint {.importc: "Fl::event_button2", header: flh.}
proc event_button3*(): cint {.importc: "Fl::event_button3", header: flh.}
proc visible_focus*(v: cint) {.importc: "Fl::visible_focus", header: flh.}
proc visible_focus*(): cint {.importc: "Fl::visible_focus", header: flh.}
proc dnd_text_ops*(v: cint) {.importc: "Fl::dnd_text_ops", header: flh.}
proc dnd_text_ops*(): cint {.importc: "Fl::dnd_text_ops", header: flh.}
proc lock*(): cint {.importc: "Fl::lock", header: flh.}
proc unlock*() {.importc: "Fl::unlock", header: flh.}
proc awake*(message: pointer = nil) {.importc: "Fl::awake", header: flh.}
proc awake*(h: Awake_Handler; message: pointer = nil): cint {.importc: "Fl::awake", header: flh.}
proc thread_message*(): pointer {.importc: "Fl::thread_message", header: flh.}
proc delete_widget*(w: Widget) {.importc: "Fl::delete_widget", header: flh.}
proc do_widget_deletion*() {.importc: "Fl::do_widget_deletion", header: flh.}
proc watch_widget_pointer*(w: ptr Widget) {.importc: "Fl::watch_widget_pointer", header: flh.}
proc release_widget_pointer*(w: ptr Widget) {.importc: "Fl::release_widget_pointer", header: flh.}
proc clear_widget_pointer*(w: Widget) {.importc: "Fl::clear_widget_pointer", header: flh.}
proc use_high_res_GL*(val: cint) {.importc: "Fl::use_high_res_GL", header: flh.}
proc use_high_res_GL*(): cint {.importc: "Fl::use_high_res_GL", header: flh.}

# XXX these are going to be a little funky since we only handle windows
# as pointer objects
#static void grab(Fl_Window& win)
#static void release()
#void paste(Fl_Widget &receiver)
#static void paste(Fl_Widget &receiver, int source, const char *type = Fl::clipboard_plain_text)
#void selection(Fl_Widget &owner, const char*, int len)
#int get_font_sizes(Fl_Font, int*& sizep)

#ifdef FLTK_HAVE_CAIRO
#  static cairo_t * cairo_make_current(Fl_Window* w);
#  static void cairo_autolink_context(bool alink) {cairo_state_.autolink(alink);}
#  static bool cairo_autolink_context() {return cairo_state_.autolink();}
#  static cairo_t * cairo_cc() { return cairo_state_.cc(); }
#  static void cairo_cc(cairo_t * c, bool own=false){ cairo_state_.cc(c, own); }
#endif // FLTK_HAVE_CAIRO

#class FL_EXPORT Fl_Widget_Tracker {
#  Fl_Widget_Tracker(Fl_Widget *wi);
#  ~Fl_Widget_Tracker();
#  Fl_Widget *widget() {return wp_;}
#  int deleted() {return wp_ == 0;}
#  int exists()  {return wp_ != 0;}
#};

