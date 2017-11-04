
#include <FL/x.H>
#include <FL/Fl_Plugin.H>
#include <FL/Fl_Image.H>
#include <FL/Fl_Bitmap.H>
#include <FL/Fl_Pixmap.H>
#include <FL/Fl_RGB_Image.H>
#include <stdlib.h>

class Fl_Graphics_Driver;
class Fl_Font_Descriptor;

FL_EXPORT extern Fl_Graphics_Driver *fl_graphics_driver;

typedef void (*Fl_Draw_Image_Cb)(void* data,int x,int y,int w,uchar* buf);

const
  REGION_STACK_SIZE* = 10
  MATRIX_STACK_SIZE* = 32

when defined(windows):
  Coord = cint
  #  define XPOINT XPoint
else defined(apple):
  Coord = cfloat
  typedef struct { float x; float y; } QPoint;
  #  define XPOINT QPoint
  extern float fl_quartz_line_width_;
else:
  Coord = cshort
  #  define XPOINT XPoint

type
  DeviceObj* {.importc: "Fl_Device", header: flh_driver.} = object {.inheritable.}
  Device* = ptr DeviceObj

static const char *class_id;

proc delete*(self: Device) {."delete @", header: flh_driver.}
proc class_name*(self: Device): cstring {.importcpp: "#.class_name(@)", header: flh_driver.}

# ______________________________________________________________________

type
  GraphicsDriverMatrix* = object
    a*, b*, c*, d*, x*, y*: cdouble

  GraphicsDriverObj* {.importc: "Fl_Graphics_Driver", header: flh_driver.} = object of DeviceObj
    matrix*: GraphicsDriverMatrix
  GraphicsDriver* = ptr GraphicsDriverObj

  static const char *class_id;

  proc font*(self: GraphicsDriver; face: Font; fsize: Fontsize) {.importcpp: "#.font(@)", header: flh_driver.}
  proc font*(self: GraphicsDriver): Font {.importcpp: "#.font(@)", header: flh_driver.}
  proc size*(self: GraphicsDriver): Fontsize {.importcpp: "#.size(@)", header: flh_driver.}
  proc width*(self: GraphicsDriver; str: cstring; n: cint): cdouble {.importcpp: "#.width(@)", header: flh_driver.}
  proc width*(self: GraphicsDriver; unsigned int c): cdouble {.importcpp: "#.width(@)", header: flh_driver.}
  proc text_extents*(self: GraphicsDriver; text: cstring; n: cint; dx, dy, w, h: out cint) {.importcpp: "#.text_extents(@)", header: flh_driver.}
  proc height*(self: GraphicsDriver): cint {.importcpp: "#.height(@)", header: flh_driver.}
  proc descent*(self: GraphicsDriver): cint {.importcpp: "#.descent(@)", header: flh_driver.}
  proc color*(self: GraphicsDriver): Color {.importcpp: "#.color(@)", header: flh_driver.}
  proc font_descriptor*(self: GraphicsDriver): FontDescriptor {.importcpp: "#.font_descriptor(@)", header: flh_driver.}
  proc font_descriptor*(self: GraphicsDriver; d: FontDescriptor) {.importcpp: "#.font_descriptor(@)", header: flh_driver.}
  proc draw_scaled*(self: GraphicsDriver; img: Image; x, y, w, h: cint): cint {.importcpp: "#.draw_scaled(@)", header: flh_driver.}

when defined(apple):
  type
    QuartzGraphicsDriverObj* {.importc: "Fl_Quartz_Graphics_Driver", header: flh_driver.} = object of GraphicsDriverObj
    QuartzGraphicsDriver* = ptr QuartzGraphicsDriverObj

  static const char *class_id;

  proc color*(self: QuartzGraphicsDriver; c: Color) {.importcpp: "#.color(@)", header: flh_driver.}
  proc color*(self: QuartzGraphicsDriver; r, g, b: cuchar) {.importcpp: "#.color(@)", header: flh_driver.}
  proc draw*(self: QuartzGraphicsDriver; str: cstring; n, x, y: cint) {.importcpp: "#.draw(@)", header: flh_driver.}
  proc draw*(self: QuartzGraphicsDriver; str: cstring; n: cint; x, y: cfloat) {.importcpp: "#.draw(@)", header: flh_driver.}
  proc draw*(self: QuartzGraphicsDriver; angle: cint; str: cstring; n, x, y: cint) {.importcpp: "#.draw(@)", header: flh_driver.}
  proc rtl_draw*(self: QuartzGraphicsDriver; str: cstring; n, x, y: cint) {.importcpp: "#.rtl_draw(@)", header: flh_driver.}
  proc font*(self: QuartzGraphicsDriver; face: Font; size: Fontsize) {.importcpp: "#.font(@)", header: flh_driver.}
  proc draw*(self: QuartzGraphicsDriver; pxm: Pixmap; XP, YP, WP, HP, cx, cy: cint) {.importcpp: "#.draw(@)", header: flh_driver.}
  proc draw*(self: QuartzGraphicsDriver; pxm: Bitmap; XP, YP, WP, HP, cx, cy: cint) {.importcpp: "#.draw(@)", header: flh_driver.}
  proc draw*(self: QuartzGraphicsDriver; img: RgbImage; XP, YP, WP, HP, cx, cy: cint) {.importcpp: "#.draw(@)", header: flh_driver.}
  proc draw_scaled*(self: QuartzGraphicsDriver; img: Image; XP, YP, WP, HP: cint): cint {.importcpp: "#.draw_scaled(@)", header: flh_driver.}
  proc draw_image*(self: QuartzGraphicsDriver; buf: ptr cuchar; X, Y, W, H: cint; D: cint = 3; L: cint = 0) {.importcpp: "#.draw_image(@)", header: flh_driver.}
  proc draw_image*(self: QuartzGraphicsDriver; cb: DrawImageCb; data: pointer; X, Y, W, H: cint; D: cint = 3) {.importcpp: "#.draw_image(@)", header: flh_driver.}
  proc draw_image_mono*(self: QuartzGraphicsDriver; bufptr: cuchar; X, Y, W, H: cint; D: cint = 1; L: cint = 0) {.importcpp: "#.draw_image_mono(@)", header: flh_driver.}
  proc draw_image_mono*(self: QuartzGraphicsDriver; cb: DrawImageCb; data: pointer; X, Y, W, H: cint; D: cint = 1) {.importcpp: "#.draw_image_mono(@)", header: flh_driver.}
  proc width*(self: QuartzGraphicsDriver; str: cstring; n: cint): cdouble {.importcpp: "#.width(@)", header: flh_driver.}
  proc width*(self: QuartzGraphicsDriver; c: cuint): cdouble {.importcpp: "#.width(@)", header: flh_driver.}
  proc text_extents*(self: QuartzGraphicsDriver; text: cstring; n: cint; dx, dy, w, h: out cint) {.importcpp: "#.text_extents(@)", header: flh_driver.}
  proc height*(self: QuartzGraphicsDriver): cint {.importcpp: "#.height(@)", header: flh_driver.}
  proc descent*(self: QuartzGraphicsDriver): cint {.importcpp: "#.descent(@)", header: flh_driver.}
  proc copy_offscreen*(self: QuartzGraphicsDriver; x, y, w, h; cint; pixmap: Offscreen; srcx, srcy: cint) {.importcpp: "#.copy_offscreen(@)", header: flh_driver.}

  proc create_offscreen_with_alpha(w, h: cint): Offscreen {.importcpp: "Fl_Quartz_Graphics_Driver::create_offscreen_with_alpha(@)", header: flh_driver.}

else defined(windows):
  # ______________________________________________________________________
  type
    GdiGraphicsDriverObj* {.importc: "Fl_GDI_Graphics_Driver", header: flh_driver.} = object of GraphicsDriverObj
    GdiGraphicsDriver* = ptr GdiGraphicsDriverObj

  static const char *class_id;

  proc color*(self: GdiGraphicsDriver; c: Color) {.importcpp: "#.color(@)", header: flh_driver.}
  proc color*(self: GdiGraphicsDriver; r, g, b: cuchar) {.importcpp: "#.color(@)", header: flh_driver.}
  proc draw*(self: GdiGraphicsDriver; str: cstring; n, x, y: cint) {.importcpp: "#.draw(@)", header: flh_driver.}
  proc draw*(self: GdiGraphicsDriver; angle: cint; str: cstring; n, x, y: cint) {.importcpp: "#.draw(@)", header: flh_driver.}
  proc rtl_draw*(self: GdiGraphicsDriver; str: cstring; n, x, y: cint) {.importcpp: "#.rtl_draw(@)", header: flh_driver.}
  proc font*(self: GdiGraphicsDriver; face: Font; size: Fontsize) {.importcpp: "#.font(@)", header: flh_driver.}
  proc draw*(self: GdiGraphicsDriver; pxm: Pixmap; XP, YP, WP, HP, cx, cy: cint) {.importcpp: "#.draw(@)", header: flh_driver.}
  proc draw*(self: GdiGraphicsDriver; pxm: Bitmap; XP, YP, WP, HP, cx, cy: cint) {.importcpp: "#.draw(@)", header: flh_driver.}
  proc draw*(self: GdiGraphicsDriver; img: RgbImage; XP, YP, WP, HP, cx, cy: cint) {.importcpp: "#.draw(@)", header: flh_driver.}
  proc draw_image*(self: GdiGraphicsDriver; buf: ptr cuchar; X, Y, W, H; D: cint = 3, L: cint = 0) {.importcpp: "#.draw_image(@)", header: flh_driver.}
  proc draw_image*(self: GdiGraphicsDriver; cb: DrawImageCb; data: pointer; X, Y, W, H: cint; D: cint = 3) {.importcpp: "#.draw_image(@)", header: flh_driver.}
  proc draw_image_mono*(self: GdiGraphicsDriver; buf: ptr cuchar; X, Y, W, H: cint; D: cint = 1; L: cint = 0) {.importcpp: "#.draw_image_mono(@)", header: flh_driver.}
  proc draw_image_mono*(self: GdiGraphicsDriver; cb: DrawImageCb; data: pointer; X, Y, W, H: cint; D: cint = 1) {.importcpp: "#.draw_image_mono(@)", header: flh_driver.}
  proc width*(self: GdiGraphicsDriver; str: cstring; n: cint) {.importcpp: "#.width(@)", header: flh_driver.}
  proc width*(self: GdiGraphicsDriver; c: cuint) {.importcpp: "#.width(@)", header: flh_driver.}
  proc text_extents*(self: GdiGraphicsDriver; text: cstring; n: cint; dx, dy, w, h: out cint) {.importcpp: "#.text_extents(@)", header: flh_driver.}
  proc height*(self: GdiGraphicsDriver) {.importcpp: "#.height(@)", header: flh_driver.}
  proc descent*(self: GdiGraphicsDriver): cint {.importcpp: "#.descent(@)", header: flh_driver.}
  # XXX need a windows unit for the hbitmap
  #copy_offscreen_with_alpha(int x,int y,int w,int h,HBITMAP bitmap,int srcx,int srcy)
  proc copy_offscreen*(self: GdiGraphicsDriver; x, y, w, h: cint; pixmap: Offscreen; srcx, srcy: cint) {.importcpp: "#.copy_offscreen(@)", header: flh_driver.}

  # ______________________________________________________________________
  type
    GdiPrinterGraphicsDriverObj* {.importc: "Fl_GDI_Printer_Graphics_Driver", header: flh_driver.} = object of GdiGraphicsDriverObj
    GdiPrinterGraphicsDriver* = ptr GdiPrinterGraphicsDriverObj

  static const char *class_id;

  proc draw*(self: GdiPrinterGraphicsDriver; pxm: Pixmap; XP, YP, WP, HP, cx, cy: cint) {.importcpp: "#.draw(@)", header: flh_driver.}
  proc draw*(self: GdiPrinterGraphicsDriver; bm: Bitmap; XP, YP, WP, HP, cx, cy: cint) {.importcpp: "#.draw(@)", header: flh_driver.}
  proc draw_scaled*(self: GdiPrinterGraphicsDriver; img: Image; XP, YP, WP, HP: cint): cint {.importcpp: "#.draw_scaled(@)", header: flh_driver.}

else:
  # ______________________________________________________________________
  class FL_EXPORT Fl_Xlib_Graphics_Driver : public Fl_Graphics_Driver {
  public:
    static const char *class_id;

    color(c: Color)
    color(r, g, b: cuchar)
    draw(str: cstring; n, x, y: cint)
    draw(angle: cint; str: cstring; n, x, y: cint)
    rtl_draw(str: cstring; n, x, y: cint)
    font(face: Font; size: Fontsize)
    draw(pxm: Pixmap; XP, YP, WP, HP, cx, cy: cint)
    draw(pxm: Bitmap; XP, YP, WP, HP, cx, cy: cint)
    draw(img: RgbImage; XP, YP, WP, HP, cx, cy: cint)
    draw_image(buf: ptr cuchar; X, Y, W, H: cint; D: cint = 3; L: cint = 0)
    draw_image(cb: DrawImageCb; data: pointer; X, Y, W, H: cint; D: cint=3)
    draw_image_mono(buf: ptr cuchar; X, Y, W, H: cint; D: cint = 1; L: cint = 0)
    draw_image_mono(cb: DrawImageCb; data: pointer; X, Y, W, H: cint; D: cint=1)
    width(str: cstring; n: cint): cdouble
    width(c: cuint): cdouble
    text_extents(text: cstring; n: cint; dx, dy, w, h: out cint)
    height(): cint
    descent(): cint
    copy_offscreen(x, y, w, h: cint; pixmap: Offscreen; srcx, srcy: cint)
    copy_offscreen_with_alpha(x, y, w, h: cint; pixmap: Offscreen; srcx, srcy: cint)

# ______________________________________________________________________

type
  SurfaceDeviceObj* {.importc: "Fl_Surface_Device", header: flh_device.} = object of DeviceObj
  SurfaceDevice* = ptr SurfaceDeviceObj

virtual ~Fl_Surface_Device() {}

static const char *class_id;

proc set_current*(self: SurfaceDevice) {.importcpp: "#.set_current(@)", header: flh_device.}
proc driver*(self: SurfaceDevice; graphics_driver: GraphicsDriver) {.importcpp: "#.driver(@)", header: flh_device.}
proc driver*(self: SurfaceDevice): GraphicsDriver {.importcpp: "#.driver(@)", header: flh_device.}

static inline Fl_Surface_Device *surface()

# ______________________________________________________________________

type
  DisplayDeviceObj* {.importc: "Fl_Display_Device", header: flh_device.} = object of SurfaceDeviceObj
  DisplayDevice* = ptr DisplayDeviceObj

static const char *class_id;

proc make_display_device(driver: GraphicsDriver): DisplayDevice {.importcpp: "new Fl_Display_Device(@)", header: flh_device.}

static Fl_Display_Device *display_device()

# ______________________________________________________________________

type
  DevicePluginObj* {.importc: "Fl_Device_Plugin", header: flh_device.} = object of PluginObj
  DevicePlugin* = ptr DevicePluginObj

proc make_device_plugin*(pluginName: cstring): DevicePlugin {.importcpp: "new Fl_Device_Plugin(@)", header: flh_device.}

proc klass*(self: DevicePlugin): cstring {.importcpp: "@.klass(@)", header: flh_device.}
proc name*(self: DevicePlugin): cstring {.importcpp: "@.name(@)", header: flh_device.}
proc print*(self: DevicePlugin; w: Widget; x, y, height: cint): cint {.importcpp: "@.print(@)", header: flh_device.}
proc rectangle_capture*(self: DevicePlugin; widget: Widget; x, y, w, h: cint): RgbImage {.importcpp: "@.rectangle_capture(@)", header: flh_device.}

const
  flh_imagesurface = "FL/Fl_Image_Surface.H"
type
  ImageSurfaceObj* {.importc: "Fl_Image_Surface", header: flh_imagesurface.} = object of SurfaceDeviceObj
  ImageSurface* = ptr ImageSurfaceObj

var image_surface_class_id {.importcpp: "Fl_Image_Surface::class_id", header: flh_imagesurface.}: cstring

proc make_image_surface*(w, h, highres: cint = 0): ImageSurface {.importcpp: "new Fl_Image_Surface(@)", header: flh_imagesurface.}
proc free*(self: ImageSurface) {.importcpp: "delete @", header: flh_imagesurface.}

proc class_name*(self: ImageSurface): cstring {.importcpp: "#.class_name(@)", header: flh_imagesurface.}
proc set_current*(self: ImageSurface) {.importcpp: "#.set_current(@)", header: flh_imagesurface.}
proc draw*(self: ImageSurface; w: Widget; delta_x, delta_y: cint = 0) {.importcpp: "#.draw(@)", header: flh_imagesurface.}
proc draw_decorated_window*(self: ImageSurface; win: Window; delta_x, delta_y: cint = 0) {.importcpp: "#.draw_decorated_window(@)", header: flh_imagesurface.}
proc image*(self: ImageSurface): RgbImage {.importcpp: "#.image(@)", header: flh_imagesurface.}
proc highres_image*(self: ImageSurface): SharedImage {.importcpp: "#.highres_image(@)", header: flh_imagesurface.}

when defined(apple):
  type
    QuartzFlippedSurfaceObj* {.importc: "Fl_Quartz_Flipped_Surface_", header: flh_imagesurface.} = object of QuartzSurfaceObj
    QuartzFlippedSurface* = ptr QuartzFlippedSurfaceObj

  var quartz_flipped_surface_class_id {.importcpp: "Fl_Quartz_Surface_::class_id", header: flh_imagesurface.}: cstring

  proc make_quartz_flipped_surface*(w, h: cint): QuartzFlippedImageSurface {.importcpp: "new Fl_Quartz_Flipped_Surface_(@)", header: flh_imagesurface.}
  proc free*(self: QuartzFlippedImageSurface) {.importcpp: "delete @", header: flh_imagesurface.}

  proc class_name*(self: QuartzFlippedImageSurface): cstring {.importcpp: "#.class_name(@)", header: flh_imagesurface.}
  proc translate*(self: QuartzFlippedImageSurface; x, y: cint) {.importcpp: "#.translate(@)", header: flh_imagesurface.}
  proc untranslate*(self: QuartzFlippedImageSurface) {.importcpp: "#.untranslate(@)", header: flh_imagesurface.}

const
  flh_pageddevice = "FL/Fl_Paged_Device.H"
  NO_PAGE_FORMATS* = 30

const
  #enum Page_Format {
  PAGE_A0* = 0
  PAGE_A1* = 1
  PAGE_A2* = 2
  PAGE_A3* = 3
  PAGE_A4* = 4
  PAGE_A5* = 5
  PAGE_A6* = 6
  PAGE_A7* = 7
  PAGE_A8* = 8
  PAGE_A9* = 9
  PAGE_B0* = 10
  PAGE_B1* = 11
  PAGE_B2* = 12
  PAGE_B3* = 13
  PAGE_B4* = 14
  PAGE_B5* = 15
  PAGE_B6* = 16
  PAGE_B7* = 17
  PAGE_B8* = 18
  PAGE_B9* = 19
  PAGE_B10* = 20
  PAGE_C5E* = 21
  PAGE_DLE* = 22
  PAGE_EXECUTIVE* = 23
  PAGE_FOLIO* = 24
  PAGE_LEDGER* = 25
  PAGE_LEGAL* = 26
  PAGE_LETTER* = 27
  PAGE_TABLOID* = 28
  PAGE_ENVELOPE* = 29
  PAGE_MEDIA* = 0x1000

const
  #enum Page_Layout {
  LAYOUT_PORTRAIT* = 0
  LAYOUT_LANDSCAPE* = 0x100
  LAYOUT_REVERSED* = 0x200
  LAYOUT_ORIENTATION* = 0x300

#class FL_EXPORT Fl_Paged_Device : public Fl_Surface_Device {

type
  PageFormat* {.importcpp: "Fl_Paged_Device::page_format", header: flh_pageddevice.} = object
    width*, height*: cint
    name*: cstring

var paged_device_page_formats {.importcpp: "Fl_Paged_Device::page_formats", header: flh_pageddevice.}: array[0..(NO_PAGE_FORMATS-1), PageFormat]
var paged_device_class_id* {.importcpp: "Fl_Paged_Device::class_id", header: flh_pageddevice.}: cstring

proc free*(self: PagedDevice) {.importcpp: "delete @", header: flh_pageddevice.}

proc class_name*(self: PagedDevice): cstring {.importcpp: "#.class_name(@)", header: flh_pageddevice.}
proc start_job*(self: PagedDevice; pagecount: cint; frompage, topage: ptr cint = nil): cint {.importcpp: "#.start_job(@)", header: flh_pageddevice.}
proc start_page*(self: PagedDevice): cint {.importcpp: "#.start_page(@)", header: flh_pageddevice.}
proc printable_rect*(self: PagedDevice; w, h: ptr cint): cint {.importcpp: "#.printable_rect(@)", header: flh_pageddevice.}
proc margins*(self: PagedDevice; left, top, right, bottom: ptr cint) {.importcpp: "#.margins(@)", header: flh_pageddevice.}
proc origin*(self: PagedDevice; x, y: cint) {.importcpp: "#.origin(@)", header: flh_pageddevice.}
proc origin*(self: PagedDevice; x, y: out cint) {.importcpp: "#.origin(@)", header: flh_pageddevice.}
proc scale*(self: PagedDevice; scale_x, scale_y: cfloat = 0.0) {.importcpp: "#.scale(@)", header: flh_pageddevice.}
proc rotate*(self: PagedDevice; angle: cfloat) {.importcpp: "#.rotate(@)", header: flh_pageddevice.}
proc translate*(self: PagedDevice; x, y: cint) {.importcpp: "#.translate(@)", header: flh_pageddevice.}
proc untranslate*(self: PagedDevice) {.importcpp: "#.untranslate(@)", header: flh_pageddevice.}
proc print_widget*(self: PagedDevice; widget: Widget; delta_x, delta_y: cint = 0) {.importcpp: "#.print_widget(@)", header: flh_pageddevice.}
proc print_window*(self: PagedDevice; win: Window; x_offset, y_offset: cint = 0) {.importcpp: "#.print_window(@)", header: flh_pageddevice.}
proc print_window_part*(self: PagedDevice; win: Window; x, y, w, h: cint; delta_x, delta_y: cint = 0) {.importcpp: "#.print_window_part(@)", header: flh_pageddevice.}
proc end_page*(self: PagedDevice): cint {.importcpp: "#.end_page(@)", header: flh_pageddevice.}
proc end_job*(self: PagedDevice) {.importcpp: "#.end_job(@)", header: flh_pageddevice.}

# ______________________________________________________________________

const
  flh_post_script = "FL/Fl_PostScript.H"

#extern "C" {
#typedef int (Fl_PostScript_Close_Command)(FILE *);

const
  #enum SHAPE
  POSTSCRIPT_NONE* = 0
  POSTSCRIPT_LINE* = 1
  POSTSCRIPT_LOOP* = 2
  POSTSCRIPT_POLYGON* = 3
  POSTSCRIPT_POINTS* = 4

class Clip {
  public:
    int x, y, w, h;
    Clip *prev;
  };

type
  PostScriptGraphicsDriverObj* {.importc: "Fl_PostScript_Graphics_Driver", header: flh_post_script.} = object of GraphicsDriverObj
  PostScriptGraphicsDriver* = ptr PostScriptGraphicsDriverObj

proc make_postscript_graphics_driver(): PostScriptGraphicsDriver {.importcpp: "new Fl_PostScript_Graphics_Driver(@)", header: flh_post_script.}

# TODO
#FILE * file() {return output;};

proc concat*(self: PostScriptGraphicsDriver) {.importcpp: "#.concat(@)", header: flh_post_script.}
proc reconcat*(self: PostScriptGraphicsDriver) {.importcpp: "#.reconcat(@)", header: flh_post_script.}
proc recover*(self: PostScriptGraphicsDriver) {.importcpp: "#.recover(@)", header: flh_post_script.}
proc reset*(self: PostScriptGraphicsDriver) {.importcpp: "#.reset(@)", header: flh_post_script.}
proc start_postscript* (self: PostScriptGraphicsDriver; int pagecount, enum Fl_Paged_Device::Page_Format format, enum Fl_Paged_Device::Page_Layout layout): cint {.importcpp: "#.start_postscript (@)", header: flh_post_script.}
proc transformed_draw*(self: PostScriptGraphicsDriver; s: cstring; n: cint; x, y: cdouble) {.importcpp: "#.transformed_draw(@)", header: flh_post_script.}
proc transformed_draw*(self: PostScriptGraphicsDriver; s: cstring; x, y: cdouble) {.importcpp: "#.transformed_draw(@)", header: flh_post_script.}
proc alpha_mask*(self: PostScriptGraphicsDriver; data: ptr cuchar; w, h, D: cint; LD: cint = 0): cint {.importcpp: "#.alpha_mask(@)", header: flh_post_script.}
proc page_policy*(self: PostScriptGraphicsDriver; p: cint) {.importcpp: "#.page_policy(@)", header: flh_post_script.}
proc page_policy*(self: PostScriptGraphicsDriver): cint {.importcpp: "#.page_policy(@)", header: flh_post_script.}
# TODO
#proc close_command*(self: PostScriptGraphicsDriver; cmd: PostScriptCloseCommand) {.importcpp: "#.close_command(@)", header: flh_post_script.}
proc interpolate*(self: PostScriptGraphicsDriver; i: cint) {.importcpp: "#.interpolate(@)", header: flh_post_script.}
proc interpolate*(self: PostScriptGraphicsDriver): cint {.importcpp: "#.interpolate(@)", header: flh_post_script.}
proc page*(self: PostScriptGraphicsDriver; double pw, double ph, int media = 0) {.importcpp: "#.page(@)", header: flh_post_script.}
proc page*(self: PostScriptGraphicsDriver; format: cint) {.importcpp: "#.page(@)", header: flh_post_script.}
proc color*(self: PostScriptGraphicsDriver; c: Color) {.importcpp: "#.color(@)", header: flh_post_script.}
proc color*(self: PostScriptGraphicsDriver; r, g, b: uchar) {.importcpp: "#.color(@)", header: flh_post_script.}
proc push_clip*(self: PostScriptGraphicsDriver; x, y, w, h: cint) {.importcpp: "#.push_clip(@)", header: flh_post_script.}
proc clip_box*(self: PostScriptGraphicsDriver; x, y, w, h: cint; X, Y, W, H: out cint): cint {.importcpp: "#.clip_box(@)", header: flh_post_script.}
proc not_clipped*(self: PostScriptGraphicsDriver; x, y, w, h: cint): cint {.importcpp: "#.not_clipped(@)", header: flh_post_script.}
proc push_no_clip*(self: PostScriptGraphicsDriver) {.importcpp: "#.push_no_clip(@)", header: flh_post_script.}
proc pop_clip*(self: PostScriptGraphicsDriver) {.importcpp: "#.pop_clip(@)", header: flh_post_script.}
proc line_style*(self: PostScriptGraphicsDriver; style: cint; width: cint = 0; dashes: cstring = nil) {.importcpp: "#.line_style(@)", header: flh_post_script.}
proc rect*(self: PostScriptGraphicsDriver; x, y, w, h: cint) {.importcpp: "#.rect(@)", header: flh_post_script.}
proc rectf*(self: PostScriptGraphicsDriver; x, y, w, h: cint) {.importcpp: "#.rectf(@)", header: flh_post_script.}
proc xyline*(self: PostScriptGraphicsDriver; x, y, x1: cint) {.importcpp: "#.xyline(@)", header: flh_post_script.}
proc xyline*(self: PostScriptGraphicsDriver; x, y, x1, y2: cint) {.importcpp: "#.xyline(@)", header: flh_post_script.}
proc xyline*(self: PostScriptGraphicsDriver; x, y, x1, y2, x3: cint) {.importcpp: "#.xyline(@)", header: flh_post_script.}
proc yxline*(self: PostScriptGraphicsDriver; x, y, y1: cint) {.importcpp: "#.yxline(@)", header: flh_post_script.}
proc yxline*(self: PostScriptGraphicsDriver; x, y, y1, x2: cint) {.importcpp: "#.yxline(@)", header: flh_post_script.}
proc yxline*(self: PostScriptGraphicsDriver; x, y, y1, x2, y3: cint) {.importcpp: "#.yxline(@)", header: flh_post_script.}
proc line*(self: PostScriptGraphicsDriver; x1, y1, x2, y2: cint) {.importcpp: "#.line(@)", header: flh_post_script.}
proc line*(self: PostScriptGraphicsDriver; x1, y1, x2, y2, x3, y3: cint) {.importcpp: "#.line(@)", header: flh_post_script.}
proc loop*(self: PostScriptGraphicsDriver; x0, y0, x1, y1, x2, y2: cint) {.importcpp: "#.loop(@)", header: flh_post_script.}
proc loop*(self: PostScriptGraphicsDriver; x0, y0, x1, y1, x2, y2, x3, y3: cint) {.importcpp: "#.loop(@)", header: flh_post_script.}
proc polygon*(self: PostScriptGraphicsDriver; x0, y0, x1, y1, x2, y2: cint) {.importcpp: "#.polygon(@)", header: flh_post_script.}
proc polygon*(self: PostScriptGraphicsDriver; x0, y0, x1, y1, x2, y2, x3, y3: cint) {.importcpp: "#.polygon(@)", header: flh_post_script.}
proc point*(self: PostScriptGraphicsDriver; x, y: cint) {.importcpp: "#.point(@)", header: flh_post_script.}
proc begin_points*(self: PostScriptGraphicsDriver) {.importcpp: "#.begin_points(@)", header: flh_post_script.}
proc begin_line*(self: PostScriptGraphicsDriver) {.importcpp: "#.begin_line(@)", header: flh_post_script.}
proc begin_loop*(self: PostScriptGraphicsDriver) {.importcpp: "#.begin_loop(@)", header: flh_post_script.}
proc begin_polygon*(self: PostScriptGraphicsDriver) {.importcpp: "#.begin_polygon(@)", header: flh_post_script.}
proc vertex*(self: PostScriptGraphicsDriver; x, y: cdouble) {.importcpp: "#.vertex(@)", header: flh_post_script.}
proc curve*(self: PostScriptGraphicsDriver; x, y, x1, y1, x2, y2, x3, y3: cdouble) {.importcpp: "#.curve(@)", header: flh_post_script.}
proc circle*(self: PostScriptGraphicsDriver; x, y, r: cdouble) {.importcpp: "#.circle(@)", header: flh_post_script.}
proc arc*(self: PostScriptGraphicsDriver; x, y, r, start, a: cdouble) {.importcpp: "#.arc(@)", header: flh_post_script.}
proc arc*(self: PostScriptGraphicsDriver; x, y, w, h: cint; a1, a2: cdouble) {.importcpp: "#.arc(@)", header: flh_post_script.}
proc pie*(self: PostScriptGraphicsDriver; x, y, w, h: cint; a1, a2: cdouble) {.importcpp: "#.pie(@)", header: flh_post_script.}
proc end_points*(self: PostScriptGraphicsDriver) {.importcpp: "#.end_points(@)", header: flh_post_script.}
proc end_line*(self: PostScriptGraphicsDriver) {.importcpp: "#.end_line(@)", header: flh_post_script.}
proc end_loop*(self: PostScriptGraphicsDriver) {.importcpp: "#.end_loop(@)", header: flh_post_script.}
proc end_polygon*(self: PostScriptGraphicsDriver) {.importcpp: "#.end_polygon(@)", header: flh_post_script.}
proc begin_complex_polygon*(self: PostScriptGraphicsDriver) {.importcpp: "#.begin_complex_polygon(@)", header: flh_post_script.}
proc gap*(self: PostScriptGraphicsDriver) {.importcpp: "#.gap(@)", header: flh_post_script.}
proc end_complex_polygon*(self: PostScriptGraphicsDriver) {.importcpp: "#.end_complex_polygon(@)", header: flh_post_script.}
proc transformed_vertex*(self: PostScriptGraphicsDriver; x, y: cdouble) {.importcpp: "#.transformed_vertex(@)", header: flh_post_script.}
proc draw_image*(self: PostScriptGraphicsDriver; d: ptr cpuchar; x, y, w, h: cint; delta: cint = 3; ldelta: cint = 0) {.importcpp: "#.draw_image(@)", header: flh_post_script.}
proc draw_image_mono*(self: PostScriptGraphicsDriver; d: ptr cuchar; x, y, w, h: cint; delta: cint = 1; ld: cint = 0) {.importcpp: "#.draw_image_mono(@)", header: flh_post_script.}
proc draw_image*(self: PostScriptGraphicsDriver; call: DrawImageCb; data: pointer; x, y, w, h: cint; delta: cint = 3) {.importcpp: "#.draw_image(@)", header: flh_post_script.}
proc draw_image_mono*(self: PostScriptGraphicsDriver; call: DrawImageCb; data: pointer; x, y, w, h: cint; delta: cint=1) {.importcpp: "#.draw_image_mono(@)", header: flh_post_script.}
proc draw*(self: PostScriptGraphicsDriver; s: cstring; nBytes, x, y: cint) {.importcpp: "#.draw(@)", header: flh_post_script.}
proc draw*(self: PostScriptGraphicsDriver; angle: cint; str: cstring; n, x, y: cint) {.importcpp: "#.draw(@)", header: flh_post_script.}
proc rtl_draw*(self: PostScriptGraphicsDriver; s: cstring; n, x, y: cint) {.importcpp: "#.rtl_draw(@)", header: flh_post_script.}
proc font*(self: PostScriptGraphicsDriver; face, size: cint) {.importcpp: "#.font(@)", header: flh_post_script.}
proc width*(self: PostScriptGraphicsDriver; a: cstring; b: cint): cdouble {.importcpp: "#.width(@)", header: flh_post_script.}
proc width*(self: PostScriptGraphicsDriver; u: cuint): cdouble {.importcpp: "#.width(@)", header: flh_post_script.}
proc text_extents*(self: PostScriptGraphicsDriver; c: cstring; n: cint; dx, dy, w, h: out cint) {.importcpp: "#.text_extents(@)", header: flh_post_script.}
proc height*(self: PostScriptGraphicsDriver): cint {.importcpp: "#.height(@)", header: flh_post_script.}
proc descent*(self: PostScriptGraphicsDriver): cint {.importcpp: "#.descent(@)", header: flh_post_script.}
proc draw*(self: PostScriptGraphicsDriver; pxm: Pixmap; XP, YP, WP, HP, cx, cy: cint) {.importcpp: "#.draw(@)", header: flh_post_script.}
proc draw*(self: PostScriptGraphicsDriver; bitmap: Bitmap; XP, YP, WP, HP, cx, cy: cint) {.importcpp: "#.draw(@)", header: flh_post_script.}
proc draw*(self: PostScriptGraphicsDriver; rgb: RgbImage; XP, YP, WP, HP, cx, cy: cint) {.importcpp: "#.draw(@)", header: flh_post_script.}
proc draw_scaled*(self: PostScriptGraphicsDriver; img: Image; XP, YP, WP, HP: cint): cint {.importcpp: "#.draw_scaled(@)", header: flh_post_script.}
proc clocale_printf*(self: PostScriptGraphicsDriver; format: cstring): cint {.varargs.} {.importcpp: "#.clocale_printf(@)", header: flh_post_script.}

when defined(apple):
  proc draw*(self: PostScriptGraphicsDriver; s: cstring; nBytes: cint; x, y: float) {.importcpp: "#.draw(@)", header: flh_post_script.}

type
  PostScriptFileDeviceObj* {.importc: "Fl_PostScript_File_Device", header: flh_post_script.} = object of PagedDeviceObj
  PostScriptFileDevice* = ptr PostScriptFileDeviceObj

var postscript_file_device_file_chooser_title {.importcpp: "Fl_PostScript_File_Device::file_chooser_title", header: flh_post_script.}: cstring

proc make_postscript_file_device(): PostScriptFileDevice {.importcpp: "new Fl_PostScript_File_Device(@)", header: flh_post_script.}

proc start_job*(self: PostScriptFileDevice; pagecount: cint; `from`, to: ptr cint): cint {.importcpp: "#.start_job(@)", header: flh_post_script.}
proc start_job*(self: PostScriptFileDevice; pagecount: cint; format: cint = PAGE_A4; layout: cint = LAYOUT_PORTRAIT): cint {.importcpp: "#.start_job(@)", header: flh_post_script.}
proc start_page*(self: PostScriptFileDevice): cint {.importcpp: "#.start_page(@)", header: flh_post_script.}
proc printable_rect*(self: PostScriptFileDevice; w; h: ptr cint): cint {.importcpp: "#.printable_rect(@)", header: flh_post_script.}
proc margins*(self: PostScriptFileDevice; left, top, right, bottom: ptr cint) {.importcpp: "#.margins(@)", header: flh_post_script.}
proc origin*(self: PostScriptFileDevice; x, y: ptr cint) {.importcpp: "#.origin(@)", header: flh_post_script.}
proc origin*(self: PostScriptFileDevice; x, y: cint) {.importcpp: "#.origin(@)", header: flh_post_script.}
proc scale*(self: PostScriptFileDevice; scale_x: cfloat; scale_y: cfloat = 0.0) {.importcpp: "#.scale(@)", header: flh_post_script.}
proc rotate*(self: PostScriptFileDevice; angle: float) {.importcpp: "#.rotate(@)", header: flh_post_script.}
proc translate*(self: PostScriptFileDevice; x, y: cint {.importcpp: "#.translate(@)", header: flh_post_script.}
proc untranslate*(self: PostScriptFileDevice) {.importcpp: "#.untranslate(@)", header: flh_post_script.}
proc end_page*(self: PostScriptFileDevice): cint {.importcpp: "#.end_page(@)", header: flh_post_script.}
proc end_job*(self: PostScriptFileDevice) {.importcpp: "#.end_job(@)", header: flh_post_script.}

# TODO
#start_job(FILE *ps_output, int pagecount, enum Fl_Paged_Device::Page_Format format = Fl_Paged_Device::A4, enum Fl_Paged_Device::Page_Layout layout = Fl_Paged_Device::PORTRAIT): cint

when defined(apple):
  proc set_current*(self: PostScriptFileDevice) {.importcpp: "#.set_current(@)", header: flh_post_script.}
