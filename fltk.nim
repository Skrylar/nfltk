
{.deadCodeElim: off.} # just for now

import enumerations
export enumerations

const
  flh = "FL/Fl.H"

var fl_local_ctrl* {.importcpp, header: flh.}: cstring
var fl_local_meta* {.importcpp, header: flh.}: cstring
var fl_local_alt* {.importcpp, header: flh.}: cstring
var fl_local_shift* {.importcpp, header: flh.}: cstring

when defined(Windows) and defined(amd64):
  type
    Socket* {.importcpp: "FL_SOCKET", header: flh.} = int64
else:
  type
    Socket* {.importcpp: "FL_SOCKET", header: flh.} = cint

type
  Label* {.importcpp: "Fl_Label*", header: flh.} = distinct pointer
  Window* {.importcpp: "Fl_Window*", header: flh.} = distinct pointer
  Widget* {.importcpp: "Fl_Widget*", header: flh.} = distinct pointer
  Shortcut* {.importcpp: "Fl_Shortcut*", header: flh.} = distinct pointer
  Font* {.importcpp: "Fl_Font*", header: flh.} = distinct pointer

type
  Label_Draw_F* {.importcpp: "Fl_Label_Draw_F", header: flh.} = proc(label: Label; x, y, w, h: cint; align: Align)
  Label_Measure_F* {.importcpp: "Fl_Label_Measure_F", header: flh.} = proc(label: Label; width, height: out cint)
  Box_Draw_F* {.importcpp: "Fl_Box_Draw_F", header: flh.} = proc(x, y, w, h: cint; color: Color)
  Timeout_Handler* {.importcpp: "Fl_Timeout_Handler", header: flh.} = proc(data: pointer)
  Awake_Handler* {.importcpp: "Fl_Awake_Handler", header: flh.} = proc(data: pointer)
  Idle_Handler* {.importcpp: "Fl_Idle_Handler", header: flh.} = proc(data: pointer)
  Old_Idle_Handler* {.importcpp: "Fl_Old_Idle_Handler", header: flh.} = proc()
  FD_Handler* {.importcpp: "Fl_FD_Handler", header: flh.} = proc(fd: Socket; data: pointer)
  Event_Handler* {.importcpp: "Fl_Event_Handler", header: flh.} = proc(event: cint): int
  System_Handler* {.importcpp: "Fl_System_Handler", header: flh.} = proc(event, data: pointer): int
  Abort_Handler* {.importcpp: "Fl_Abort_Handler", header: flh.} = proc(format: cstring) {.varargs.}
  Atclose_Handler* {.importcpp: "Fl_Atclose_Handler", header: flh.} = proc(window: Window, data: pointer)
  Args_Handler* {.importcpp: "Fl_Args_Handler", header: flh.} = proc(argc: cint; argv: ptr cstring; i: out cint): int
  Event_Dispatch* {.importcpp: "Fl_Event_Dispatch", header: flh.} = proc(event: cint; w: Window): int
  Clipboard_Notify_Handler* {.importcpp: "Fl_Clipboard_Notify_Handler", header: flh.} = proc(source: cint; data: pointer)

type
  # kept the prefix here because the enum belongs solely to the Fl
  # class.
  Fl_Option* {.importcpp: "Fl::Fl_Option", header: flh.} = enum
    OPTION_ARROW_FOCUS = 0
    OPTION_VISIBLE_FOCUS
    OPTION_DND_TEXT
    OPTION_SHOW_TOOLTIPS
    OPTION_FNFC_USES_GTK
    OPTION_LAST

var help* {.importcpp: "Fl::help", header: flh.}: cstring
var clipboard_plain_text* {.importcpp: "Fl::clipboard_plain_text", header: flh.}: cstring
var clipboard_image* {.importcpp: "Fl::clipboard_image", header: flh.}: cstring

proc option*(opt: Fl_Option): bool {.importcpp: "Fl::option", header: flh.}
proc option*(opt: Fl_Option; val: bool) {.importcpp: "Fl::option", header: flh.}
proc version*(): cdouble {.importcpp: "Fl::version", header: flh.}
proc api_version*(): cint {.importcpp: "Fl::api_version", header: flh.}
proc abi_version*(): cint {.importcpp: "Fl::abi_version", header: flh.}
proc arg*(argc: cint; argv: ptr cstring; i: var cint): cint {.importcpp: "Fl::arg", header: flh.}
proc args*(argc: cint; argv: ptr cstring; i: var cint; db: Args_Handler = nil): cint {.importcpp: "Fl::args", header: flh.}
proc args*(argc: cint; argv: ptr cstring) {.importcpp: "Fl::args", header: flh.}
proc display*(s: cstring) {.importcpp: "Fl::display", header: flh.}
proc visual*(a: cint): cint {.importcpp: "Fl::visual", header: flh.}
proc gl_visual*(a: cint; alist: ptr int = nil): cint {.importcpp: "Fl::gl_visual", header: flh.}
proc own_colormap*() {.importcpp: "Fl::own_colormap", header: flh.}
proc get_system_colors*() {.importcpp: "Fl::get_system_colors", header: flh.}
proc foreground*(r, g, b: cuchar) {.importcpp: "Fl::foreground", header: flh.}
proc background*(r, g, b: cuchar) {.importcpp: "Fl::background", header: flh.}
proc background2*(r, g, b: cuchar) {.importcpp: "Fl::background2", header: flh.}
proc scheme*(name: cstring): cint {.importcpp: "Fl::scheme", header: flh.}
proc scheme*(): cstring {.importcpp: "Fl::scheme", header: flh.}
proc reload_scheme*(): cint {.importcpp: "Fl::reload_scheme", header: flh.}
proc scrollbar_size*(): cint {.importcpp: "Fl::scrollbar_size", header: flh.}
proc scrollbar_size*(w: cint) {.importcpp: "Fl::scrollbar_size", header: flh.}
proc wait*(): cint {.importcpp: "Fl::wait", header: flh.}
proc wait*(time: cdouble) {.importcpp: "Fl::wait", header: flh.}
proc check*(): cint {.importcpp: "Fl::check", header: flh.}
proc ready*(): cint {.importcpp: "Fl::ready", header: flh.}
proc run*(): cint {.importcpp: "Fl::run", header: flh.}
proc readqueue*(): Widget {.importcpp: "Fl::readqueue", header: flh.}
proc add_timeout*(t: cdouble; h: Timeout_Handler; user: pointer = nil) {.importcpp: "Fl::add_timeout", header: flh.}
proc repeat_timeout*(t: cdouble; h: Timeout_Handler; user: pointer = nil) {.importcpp: "Fl::repeat_timeout", header: flh.}
proc has_timeout*(h: Timeout_Handler; user: pointer = nil): int  {.importcpp: "Fl::has_timeout", header: flh.}
proc remove_timeout*(h: Timeout_Handler; user: pointer = nil) {.importcpp: "Fl::remove_timeout", header: flh.}
proc add_check*(h: Timeout_Handler; user: pointer = nil) {.importcpp: "Fl::add_check", header: flh.}
proc has_check*(h: Timeout_Handler; user: pointer = nil): int  {.importcpp: "Fl::has_check", header: flh.}
proc remove_check*(h: Timeout_Handler; user: pointer = nil) {.importcpp: "Fl::remove_check", header: flh.}
proc add_fd*(fd, whn: cint; cb: FD_Handler, user: pointer = nil) {.importcpp: "Fl::add_fd", header: flh.}
proc add_fd*(fd: cint; cb: FD_Handler; user: pointer = nil) {.importcpp: "Fl::add_fd", header: flh.}
proc remove_fd*(fd, whn: cint) {.importcpp: "Fl::remove_fd", header: flh.}
proc remove_fd*(fd: cint) {.importcpp: "Fl::remove_fd", header: flh.}
proc add_idle*(cb: Idle_Handler; data: pointer = nil) {.importcpp: "Fl::add_idle", header: flh.}
proc has_idle*(cb: Idle_Handler; data: pointer = nil): int  {.importcpp: "Fl::has_idle", header: flh.}
proc remove_idle*(db: Idle_Handler; data: pointer = nil) {.importcpp: "Fl::remove_idle", header: flh.}
proc damage*(): int {.importcpp: "Fl::damage", header: flh.}
proc redraw*() {.importcpp: "Fl::redraw", header: flh.}
proc flush*() {.importcpp: "Fl::flush", header: flh.}
proc warning*(fmt: cstring) {.varargs, importcpp: "Fl::warning", header: flh.}
proc error*(fmt: cstring) {.varargs, importcpp: "Fl::error", header: flh.}
proc fatal*(fmt: cstring) {.varargs, importcpp: "Fl::fatal", header: flh.}
proc first_window*(): Window {.importcpp: "Fl::first_window", header: flh.}
proc first_window*(w: Window) {.importcpp: "Fl::first_window", header: flh.}
proc next_window*(w: Window): Window {.importcpp: "Fl::next_window", header: flh.}
proc modal*(): Window {.importcpp: "Fl::modal", header: flh.}
proc grab*(): Window {.importcpp: "Fl::grab", header: flh.}
proc grab*(w: Window) {.importcpp: "Fl::grab", header: flh.}
proc event*(): int {.importcpp: "Fl::event", header: flh.}
proc event_x*(): int {.importcpp: "Fl::event_x", header: flh.}
proc event_y*(): int {.importcpp: "Fl::event_y", header: flh.}
proc event_x_root*(): int {.importcpp: "Fl::event_x_root", header: flh.}
proc event_y_root*(): int {.importcpp: "Fl::event_y_root", header: flh.}
proc event_dx*(): int {.importcpp: "Fl::event_dx", header: flh.}
proc event_dy*(): int {.importcpp: "Fl::event_dy", header: flh.}
proc get_mouse*(x, y: var cint) {.importcpp: "Fl::get_mouse", header: flh.}
proc event_clicks*(): int {.importcpp: "Fl::event_clicks", header: flh.}
proc event_clicks*(i: cint) {.importcpp: "Fl::event_clicks", header: flh.}
proc event_is_click*(): int {.importcpp: "Fl::event_is_click", header: flh.}
proc event_is_click*(i: cint) {.importcpp: "Fl::event_is_click", header: flh.}
proc event_button*(): int {.importcpp: "Fl::event_button", header: flh.}
proc event_state*(): int {.importcpp: "Fl::event_state", header: flh.}
proc event_key*(): int {.importcpp: "Fl::event_key", header: flh.}
proc event_original_key*(): int {.importcpp: "Fl::event_original_key", header: flh.}
proc event_key*(key: int): int {.importcpp: "Fl::event_key", header: flh.}
proc get_key*(key: int): int {.importcpp: "Fl::get_key", header: flh.}
proc event_text*(): cstring {.importcpp: "Fl::event_text", header: flh.}
proc event_length*(): int {.importcpp: "Fl::event_length", header: flh.}
proc event_clipboard*(): pointer {.importcpp: "Fl::event_clipboard", header: flh.}
proc event_clipboard_type*(): cstring {.importcpp: "Fl::event_clipboard_type", header: flh.}
proc compose*(del: var cint): int {.importcpp: "Fl::compose", header: flh.}
proc compose_reset*() {.importcpp: "Fl::compose_reset", header: flh.}
proc event_inside*(a, b, c, d: cint): int {.importcpp: "Fl::event_inside", header: flh.}
proc event_inside*(w: Widget): int {.importcpp: "Fl::event_inside", header: flh.}
proc test_shortcut*(s: Shortcut): int {.importcpp: "Fl::test_shortcut", header: flh.}
proc enable_im*() {.importcpp: "Fl::enable_im", header: flh.}
proc disable_im*() {.importcpp: "Fl::disable_im", header: flh.}
proc handle*(a: cint; w: Window): int {.importcpp: "Fl::handle", header: flh.}
#proc handle_*(a: cint; w: Window): int {.importcpp: "Fl::handle_", header: flh.}
proc belowmouse*(): Widget {.importcpp: "Fl::belowmouse", header: flh.}
proc belowmouse*(w: Widget) {.importcpp: "Fl::belowmouse", header: flh.}
proc pushed*(): Widget {.importcpp: "Fl::pushed", header: flh.}
proc pushed*(w: Widget) {.importcpp: "Fl::pushed", header: flh.}
proc focus*(): Widget {.importcpp: "Fl::focus", header: flh.}
proc focus*(w: Widget) {.importcpp: "Fl::focus", header: flh.}
proc add_handler*(h: Event_Handler) {.importcpp: "Fl::add_handler", header: flh.}
proc remove_handler*(h: Event_Handler) {.importcpp: "Fl::remove_handler", header: flh.}
proc add_system_handler*(h: System_Handler; data: pointer) {.importcpp: "Fl::add_system_handler", header: flh.}
proc remove_system_handler*(h: System_Handler) {.importcpp: "Fl::remove_system_handler", header: flh.}
proc event_dispatch*(d: Event_Dispatch) {.importcpp: "Fl::event_dispatch", header: flh.}
proc event_dispatch*(): Event_Dispatch {.importcpp: "Fl::event_dispatch", header: flh.}
# TODO proc copy*(stuff: pointer; length: cint; destination: cint = 0; typ: cstring = Fl::clipboard_plain_text) {.importcpp: "Fl::copy", header: flh.}
proc add_clipboard_notify*(h: Clipboard_Notify_Handler; data: pointer = nil) {.importcpp: "Fl::add_clipboard_notify", header: flh.}
proc remove_clipboard_notify*(h: Clipboard_Notify_Handler) {.importcpp: "Fl::remove_clipboard_notify", header: flh.}
proc clipboard_contains*(typ: cstring): cint {.importcpp: "Fl::clipboard_contains", header: flh.}
proc dnd*(): cint {.importcpp: "Fl::dnd", header: flh.}
proc selection_owner*(): Widget {.importcpp: "Fl::selection_owner", header: flh.}
proc selection_owner*(w: Widget) {.importcpp: "Fl::selection_owner", header: flh.}
proc x*(): cint {.importcpp: "Fl::x", header: flh.}
proc y*(): cint {.importcpp: "Fl::y", header: flh.}
proc w*(): cint {.importcpp: "Fl::w", header: flh.}
proc h*(): cint {.importcpp: "Fl::h", header: flh.}
proc screen_count*(): cint {.importcpp: "Fl::screen_count", header: flh.}
proc screen_xywh*(X, Y, W, H: out cint) {.importcpp: "Fl::screen_xywh", header: flh.}
proc screen_xywh*(X, Y, W, H: out cint; mx, my: cint) {.importcpp: "Fl::screen_xywh", header: flh.}
proc screen_xywh*(X, Y, W, H: out cint; n: cint) {.importcpp: "Fl::screen_xywh", header: flh.}
proc screen_xywh*(X, Y, W, H: out cint; mx, my, mw, mh: cint) {.importcpp: "Fl::screen_xywh", header: flh.}
proc screen_num*(x, y: cint): cint {.importcpp: "Fl::screen_num", header: flh.}
proc screen_num*(x, y, w, h: cint): cint {.importcpp: "Fl::screen_num", header: flh.}
proc screen_dpi*(h, v: out cfloat; n: cint = 0) {.importcpp: "Fl::screen_dpi", header: flh.}
proc screen_work_area*(X, Y, W, H: out cint; mx, my: cint) {.importcpp: "Fl::screen_work_area", header: flh.}
proc screen_work_area*(X, Y, W, H: out cint; n: cint): cint {.importcpp: "Fl::screen_work_area", header: flh.}
proc set_color*(c: Color; r, g, b: cuchar) {.importcpp: "Fl::set_color", header: flh.}
proc set_color*(c: Color; ci: cuint) {.importcpp: "Fl::set_color", header: flh.}
proc get_color*(c: Color): cuint {.importcpp: "Fl::get_color", header: flh.}
proc get_color*(c: Color; red, green, blue: cuchar) {.importcpp: "Fl::get_color", header: flh.}
proc free_color*(c: Color; overlay: cint = 0) {.importcpp: "Fl::free_color", header: flh.}
proc get_font*(f: Font): cstring {.importcpp: "Fl::get_font", header: flh.}
proc get_font_name*(f: Font; attributes: ptr cint = nil): cstring {.importcpp: "Fl::get_font_name", header: flh.}
proc set_font*(f: Font; name: cstring) {.importcpp: "Fl::set_font", header: flh.}
proc set_font*(f, f2: Font) {.importcpp: "Fl::set_font", header: flh.}
proc set_fonts*(name: cstring): Font {.importcpp: "Fl::set_fonts", header: flh.}
proc set_labeltype*(typ: Labeltype; f: Label_Draw_F; f2: Label_Measure_F) {.importcpp: "Fl::set_labeltype", header: flh.}
proc set_labeltype*(typ: Labeltype; frm: Labeltype) {.importcpp: "Fl::set_labeltype", header: flh.}
proc get_boxtype*(typ: Boxtype): Box_Draw_F {.importcpp: "Fl::get_boxtype", header: flh.}
proc set_boxtype*(typ: Boxtype; f: Box_Draw_F; a, b, c, d: cuchar) {.importcpp: "Fl::set_boxtype", header: flh.}
proc set_boxtype*(typ: Boxtype; frm: Boxtype) {.importcpp: "Fl::set_boxtype", header: flh.}
proc box_dx*(typ: Boxtype): cint {.importcpp: "Fl::box_dx", header: flh.}
proc box_dy*(typ: Boxtype): cint {.importcpp: "Fl::box_dy", header: flh.}
proc box_dw*(typ: Boxtype): cint {.importcpp: "Fl::box_dw", header: flh.}
proc box_dh*(typ: Boxtype): cint {.importcpp: "Fl::box_dh", header: flh.}
proc draw_box_active*(): cint {.importcpp: "Fl::draw_box_active", header: flh.}
proc box_color*(c: Color): Color {.importcpp: "Fl::box_color", header: flh.}
proc set_box_color*(c: Color) {.importcpp: "Fl::set_box_color", header: flh.}
proc event_shift*(): cint {.importcpp: "Fl::event_shift", header: flh.}
proc event_ctrl*(): cint {.importcpp: "Fl::event_ctrl", header: flh.}
proc event_command*(): cint {.importcpp: "Fl::event_command", header: flh.}
proc event_alt*(): cint {.importcpp: "Fl::event_alt", header: flh.}
proc event_buttons*(): cint {.importcpp: "Fl::event_buttons", header: flh.}
proc event_button1*(): cint {.importcpp: "Fl::event_button1", header: flh.}
proc event_button2*(): cint {.importcpp: "Fl::event_button2", header: flh.}
proc event_button3*(): cint {.importcpp: "Fl::event_button3", header: flh.}
proc visible_focus*(v: cint) {.importcpp: "Fl::visible_focus", header: flh.}
proc visible_focus*(): cint {.importcpp: "Fl::visible_focus", header: flh.}
proc dnd_text_ops*(v: cint) {.importcpp: "Fl::dnd_text_ops", header: flh.}
proc dnd_text_ops*(): cint {.importcpp: "Fl::dnd_text_ops", header: flh.}
proc lock*(): cint {.importcpp: "Fl::lock", header: flh.}
proc unlock*() {.importcpp: "Fl::unlock", header: flh.}
proc awake*(message: pointer = nil) {.importcpp: "Fl::awake", header: flh.}
proc awake*(h: Awake_Handler; message: pointer = nil): cint {.importcpp: "Fl::awake", header: flh.}
proc thread_message*(): pointer {.importcpp: "Fl::thread_message", header: flh.}
proc delete_widget*(w: Widget) {.importcpp: "Fl::delete_widget", header: flh.}
proc do_widget_deletion*() {.importcpp: "Fl::do_widget_deletion", header: flh.}
proc watch_widget_pointer*(w: ptr Widget) {.importcpp: "Fl::watch_widget_pointer", header: flh.}
proc release_widget_pointer*(w: ptr Widget) {.importcpp: "Fl::release_widget_pointer", header: flh.}
proc clear_widget_pointer*(w: Widget) {.importcpp: "Fl::clear_widget_pointer", header: flh.}
proc use_high_res_GL*(val: cint) {.importcpp: "Fl::use_high_res_GL", header: flh.}
proc use_high_res_GL*(): cint {.importcpp: "Fl::use_high_res_GL", header: flh.}

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

