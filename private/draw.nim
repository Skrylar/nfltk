
import window
import enumerations
import image

# XXX this belongs to the device file
type
  DrawImageCb* {.importcpp: "Fl_Draw_Image_Cb", header: "FL/Fl_Device.H".} = proc(data: pointer; x, y, w: cint; buf: ptr uint8)

const
  flh_draw = "FL/fl_draw.H"

const
  LINE_SOLID*      = 0
  LINE_DASH*       = 1
  LINE_DOT*        = 2
  LINE_DASHDOT*    = 3
  LINE_DASHDOTDOT* = 4

  LINE_CAP_FLAT*   = 0x100
  LINE_CAP_ROUND*  = 0x200
  LINE_CAP_SQUARE* = 0x300

  LINE_JOIN_MITER* = 0x1000
  LINE_JOIN_ROUND* = 0x2000
  LINE_JOIN_BEVEL* = 0x3000

var fl_draw_shortcut* {.importcpp: "fl_draw_shortcut", header: flh_draw.}: cchar

proc draw_color*(c: Color) {.importcpp: "fl_color(@)", header: flh_draw.}
#proc draw_color*(c: cint) {.importcpp: "fl_color(@)", header: flh_draw.}
proc draw_color*(r, g, b: uint8) {.importcpp: "fl_color(@)", header: flh_draw.}
proc draw_color*(): Color {.importcpp: "fl_color(@)", header: flh_draw.}
proc fl_push_clip*(x, y, w, h: cint) {.importcpp: "fl_push_clip(@)", header: flh_draw.}
proc fl_push_no_clip*() {.importcpp: "fl_push_no_clip(@)", header: flh_draw.}
proc fl_pop_clip*() {.importcpp: "fl_pop_clip(@)", header: flh_draw.}
proc fl_not_clipped*(x, y, w, h: cint): cint {.importcpp: "fl_not_clipped(@)", header: flh_draw.}
proc fl_clip_box*(x, y, w, h: cint; X, Y, W, H: out cint): cint {.importcpp: "fl_clip_box(@)", header: flh_draw.}
proc fl_restore_clip*() {.importcpp: "fl_restore_clip(@)", header: flh_draw.}
#proc fl_clip_region*(r: Region) {.importcpp: "fl_clip_region(@)", header: flh_draw.}
#proc fl_clip_region*(): Region {.importcpp: "fl_clip_region(@)", header: flh_draw.}
proc fl_point*(x, y: cint) {.importcpp: "fl_point(@)", header: flh_draw.}
proc fl_line_style*(style: cint; width: cint = 0; dashes: cstring = nil) {.importcpp: "fl_line_style(@)", header: flh_draw.}
proc fl_rect*(x, y, w, h: cint) {.importcpp: "fl_rect(@)", header: flh_draw.}
proc fl_rect*(x, y, w, h: cint; c: Color) {.importcpp: "fl_rect(@)", header: flh_draw.}
proc fl_rectf*(x, y, w, h: cint) {.importcpp: "fl_rectf(@)", header: flh_draw.}
proc fl_rectf*(x, y, w, h: cint; c: Color) {.importcpp: "fl_rectf(@)", header: flh_draw.}
proc fl_rectf*(x, y, w, h: cint; r, g, b: uint8) {.importcpp: "fl_rectf(@)", header: flh_draw.}
proc fl_line*(x, y, x1, y1: cint) {.importcpp: "fl_line(@)", header: flh_draw.}
proc fl_line*(x, y, x1, y1, x2, y2: cint) {.importcpp: "fl_line(@)", header: flh_draw.}
proc fl_loop*(x, y, x1, y1, x2, y2: cint) {.importcpp: "fl_loop(@)", header: flh_draw.}
proc fl_loop*(x, y, x1, y1, x2, y2, x3, y3: cint) {.importcpp: "fl_loop(@)", header: flh_draw.}
proc fl_polygon*(x, y, x1, y1, x2, y2: cint) {.importcpp: "fl_polygon(@)", header: flh_draw.}
proc fl_polygon*(x, y, x1, y1, x2, y2, x3, y3: cint) {.importcpp: "fl_polygon(@)", header: flh_draw.}
proc fl_xyline*(x, y, x1: cint) {.importcpp: "fl_xyline(@)", header: flh_draw.}
proc fl_xyline*(x, y, x1, y2: cint) {.importcpp: "fl_xyline(@)", header: flh_draw.}
proc fl_xyline*(x, y, x1, y2, x3: cint) {.importcpp: "fl_xyline(@)", header: flh_draw.}
proc fl_yxline*(x, y, y1: cint) {.importcpp: "fl_yxline(@)", header: flh_draw.}
proc fl_yxline*(x, y, y1, x2: cint) {.importcpp: "fl_yxline(@)", header: flh_draw.}
proc fl_yxline*(x, y, y1, x2, y3: cint) {.importcpp: "fl_yxline(@)", header: flh_draw.}
proc fl_arc*(x, y, w, h: cint; a1, a2: cdouble) {.importcpp: "fl_arc(@)", header: flh_draw.}
proc fl_pie*(x, y, w, h: cint; a1, a2: cdouble) {.importcpp: "fl_pie(@)", header: flh_draw.}
proc fl_chord*(x, y, w, h: cint; a1, a2: cdouble) {.importcpp: "fl_chord(@)", header: flh_draw.}
proc fl_push_matrix*() {.importcpp: "fl_push_matrix(@)", header: flh_draw.}
proc fl_pop_matrix*() {.importcpp: "fl_pop_matrix(@)", header: flh_draw.}
proc fl_scale*(x, y: cdouble) {.importcpp: "fl_scale(@)", header: flh_draw.}
proc fl_scale*(x: cdouble) {.importcpp: "fl_scale(@)", header: flh_draw.}
proc fl_translate*(x, y: cdouble) {.importcpp: "fl_translate(@)", header: flh_draw.}
proc fl_rotate*(d: cdouble) {.importcpp: "fl_rotate(@)", header: flh_draw.}
proc fl_mult_matrix*(a, b, c, d, x, y: cdouble) {.importcpp: "fl_mult_matrix(@)", header: flh_draw.}
proc fl_begin_points*() {.importcpp: "fl_begin_points(@)", header: flh_draw.}
proc fl_begin_line*() {.importcpp: "fl_begin_line(@)", header: flh_draw.}
proc fl_begin_loop*() {.importcpp: "fl_begin_loop(@)", header: flh_draw.}
proc fl_begin_polygon*() {.importcpp: "fl_begin_polygon(@)", header: flh_draw.}
proc fl_vertex*(x, y: cdouble) {.importcpp: "fl_vertex(@)", header: flh_draw.}
proc fl_curve*(X0, Y0, X1, Y1, X2, Y2, X3, Y3: cdouble) {.importcpp: "fl_curve(@)", header: flh_draw.}
proc fl_arc*(x, y, r, start, `end`: cdouble) {.importcpp: "fl_arc(@)", header: flh_draw.}
proc fl_circle*(x, y, r: cdouble) {.importcpp: "fl_circle(@)", header: flh_draw.}
proc fl_end_points*() {.importcpp: "fl_end_points(@)", header: flh_draw.}
proc fl_end_line*() {.importcpp: "fl_end_line(@)", header: flh_draw.}
proc fl_end_loop*() {.importcpp: "fl_end_loop(@)", header: flh_draw.}
proc fl_end_polygon*() {.importcpp: "fl_end_polygon(@)", header: flh_draw.}
proc fl_begin_complex_polygon*() {.importcpp: "fl_begin_complex_polygon(@)", header: flh_draw.}
proc fl_gap*() {.importcpp: "fl_gap(@)", header: flh_draw.}
proc fl_end_complex_polygon*() {.importcpp: "fl_end_complex_polygon(@)", header: flh_draw.}
proc fl_transform_x*(x, y: cdouble): cdouble {.importcpp: "fl_transform_x(@)", header: flh_draw.}
proc fl_transform_y*(x, y: cdouble): cdouble {.importcpp: "fl_transform_y(@)", header: flh_draw.}
proc fl_transform_dx*(x, y: cdouble): cdouble {.importcpp: "fl_transform_dx(@)", header: flh_draw.}
proc fl_transform_dy*(x, y: cdouble): cdouble {.importcpp: "fl_transform_dy(@)", header: flh_draw.}
proc fl_transformed_vertex*(xf, yf: cdouble) {.importcpp: "fl_transformed_vertex(@)", header: flh_draw.}
proc fl_font*(face, fsize: Fontsize) {.importcpp: "fl_font(@)", header: flh_draw.}
proc fl_font*(): Font {.importcpp: "fl_font(@)", header: flh_draw.}
proc fl_size*(): Fontsize {.importcpp: "fl_size(@)", header: flh_draw.}
proc fl_height*(): cint {.importcpp: "fl_height(@)", header: flh_draw.}
proc fl_height*(font, size: cint): cint {.importcpp: "fl_height(@)", header: flh_draw.}
proc fl_descent*(): cint {.importcpp: "fl_descent(@)", header: flh_draw.}
proc fl_width*(txt: cstring): cdouble {.importcpp: "fl_width(@)", header: flh_draw.}
proc fl_width*(txt: cstring; n: cint): cdouble {.importcpp: "fl_width(@)", header: flh_draw.}
proc fl_width*(c: cuint): cdouble {.importcpp: "fl_width(@)", header: flh_draw.}
proc fl_text_extents*(t: cstring; dx, dy, w, h: out cint) {.importcpp: "fl_text_extents(@)", header: flh_draw.}
proc fl_text_extents*(t: cstring; n: cint; dx, dy, w, h: out cint) {.importcpp: "fl_text_extents(@)", header: flh_draw.}
proc fl_latin1_to_local*(t: cstring; n: cint = -1): cstring {.importcpp: "fl_latin1_to_local(@)", header: flh_draw.}
proc fl_local_to_latin1*(t: cstring; n: cint = -1): cstring {.importcpp: "fl_local_to_latin1(@)", header: flh_draw.}
proc fl_mac_roman_to_local*(t: cstring; n: cint = -1): cstring {.importcpp: "fl_mac_roman_to_local(@)", header: flh_draw.}
proc fl_local_to_mac_roman*(t: cstring; n: cint = -1): cstring {.importcpp: "fl_local_to_mac_roman(@)", header: flh_draw.}
proc fl_draw*(str: cstring; x, y: cint) {.importcpp: "fl_draw(@)", header: flh_draw.}
proc fl_draw*(angle: cint; str: cstring; x, y: cint) {.importcpp: "fl_draw(@)", header: flh_draw.}
proc fl_draw*(str: cstring; n, x, y: cint) {.importcpp: "fl_draw(@)", header: flh_draw.}
proc fl_draw*(angle: cint; str: cstring; n, x, y: cint) {.importcpp: "fl_draw(@)", header: flh_draw.}
proc fl_rtl_draw*(str: cstring; n, x, y: cint) {.importcpp: "fl_rtl_draw(@)", header: flh_draw.}
proc fl_measure*(str: cstring; x, y: out cint; draw_symbols: cint = 1) {.importcpp: "fl_measure(@)", header: flh_draw.}
proc fl_draw*(str: cstring; x, y, w, h: cint; align: Align; img: Image = nil; draw_symbols: cint = 1) {.importcpp: "fl_draw(@)", header: flh_draw.}
proc fl_frame*(s: cstring; x, y, w, h: cint) {.importcpp: "fl_frame(@)", header: flh_draw.}
proc fl_frame2*(s: cstring; x, y, w, h: cint) {.importcpp: "fl_frame2(@)", header: flh_draw.}
proc fl_draw_box*(t: Boxtype; x, y, w, h: cint; c: Color) {.importcpp: "fl_draw_box(@)", header: flh_draw.}
proc fl_draw_image*(buf: ptr uint8; X, Y, W, H: cint; D: cint = 3; L: cint = 0) {.importcpp: "fl_draw_image(@)", header: flh_draw.}
proc fl_draw_image_mono*(buf: ptr uint8; X, Y, W, H: cint; D: cint = 1; L: cint = 0) {.importcpp: "fl_draw_image_mono(@)", header: flh_draw.}
proc fl_draw_image*(cb: DrawImageCb; data: pointer; X, Y, W, H: cint; D: cint = 3) {.importcpp: "fl_draw_image(@)", header: flh_draw.}
proc fl_draw_image_mono*(cb: DrawImageCb; data: pointer; X, Y, W, H: cint; D: cint = 1) {.importcpp: "fl_draw_image_mono(@)", header: flh_draw.}
proc fl_can_do_alpha_blending*(): char {.importcpp: "fl_can_do_alpha_blending(@)", header: flh_draw.}
proc fl_read_image*(p: ptr uint8; X, Y, W, H: cint; alpha: cint = 0): ptr uint8 {.importcpp: " *fl_read_image(@)", header: flh_draw.}
proc fl_draw_pixmap*(data: ptr cstring; x, y: cint; c: Color = GRAY): cint {.importcpp: "fl_draw_pixmap(@)", header: flh_draw.}
proc fl_draw_pixmap*(cdata: ptr cstring; x, y: cint; c: Color = GRAY): cint {.importcpp: "fl_draw_pixmap(@)", header: flh_draw.}
proc fl_measure_pixmap*(data: ptr cstring; w, h: out cint): cint {.importcpp: "fl_measure_pixmap(@)", header: flh_draw.}
proc fl_measure_pixmap*(cdata: ptr cstring; w, h: out cint): cint {.importcpp: "fl_measure_pixmap(@)", header: flh_draw.}
proc fl_shortcut_label*(shortcut: cuint): cstring {.importcpp: "fl_shortcut_label(@)", header: flh_draw.}
proc fl_shortcut_label*(shortcut: cuint; eom: ptr cstring): cstring {.importcpp: "fl_shortcut_label(@)", header: flh_draw.}
proc fl_old_shortcut*(s: cstring): cuint {.importcpp: "fl_old_shortcut(@)", header: flh_draw.}
proc fl_overlay_rect*(x, y, w, h: cint) {.importcpp: "fl_overlay_rect(@)", header: flh_draw.}
proc fl_overlay_clear*() {.importcpp: "fl_overlay_clear(@)", header: flh_draw.}
proc fl_cursor*(c: enumerations.Cursor) {.importcpp: "fl_cursor(@)", header: flh_draw.}
proc fl_cursor*(c: enumerations.Cursor; fg, bg: Color = WHITE) {.importcpp: "fl_cursor(@)", header: flh_draw.}
proc fl_expand_text*(`from`, buf: cstring; maxbuf: cint; maxw: cdouble; n: out cint, width: out cdouble; wrap: cint; draw_symbols: cint = 0): cstring {.importcpp: "fl_expand_text(@)", header: flh_draw.}
proc fl_set_status*(X, Y, W, H: cint) {.importcpp: "fl_set_status(@)", header: flh_draw.}
proc fl_set_spot*(font, size, X, Y, W, H: cint; win: Window = nil) {.importcpp: "fl_set_spot(@)", header: flh_draw.}
proc fl_reset_spot*() {.importcpp: "fl_reset_spot(@)", header: flh_draw.}
proc fl_draw_symbol*(label: cstring; x, y, w, h: cint; c: Color): cint {.importcpp: "fl_draw_symbol(@)", header: flh_draw.}
proc fl_draw*(str: cstring; x, y, w, h: cint; align: Align; callthis: proc(a: cstring; b: cint; c: cint; d: cint); img: Image = nil; draw_symbols: cint = 1) {.importcpp: "fl_draw(@)", header: flh_draw.}
proc fl_scroll*(X, Y, W, H, dx, dy: cint; draw_area = proc(a: pointer; b, c, d, e: cint); data: pointer) {.importcpp: "fl_scroll(@)", header: flh_draw.}
proc fl_add_symbol*(name: cstring; drawit = proc(c: Color); scalable: cint): cint {.importcpp: "fl_add_symbol(@)", header: flh_draw.}
