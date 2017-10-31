
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