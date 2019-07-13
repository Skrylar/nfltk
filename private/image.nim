
import enumerations

const
  flh = "FL/Fl_Image.H"
  flh_pixmap = "FL/Fl_Pixmap.H"

type
  Fl_RGB_Scaling* = cint
const
  RGB_SCALING_NEAREST*  = 0
  RGB_SCALING_BILINEAR* = 1

const
  Image_ERR_NO_IMAGE*    = -1
  Image_ERR_FILE_ACCESS* = -2
  Image_ERR_FORMAT*      = -3

type
  ImageObj* {.importc: "Fl_Image", header: flh, inheritable.} = object
  Image* = ptr ImageObj

proc make_image*(W, H, D: cint): Image {.importcpp: "new Fl_Image(@)", header: flh.}
proc free*(self: Image) {.importcpp: "delete @", header: flh.}

# methods
proc copy*(self: Image; W, H: cint): Image {.importcpp: "#.copy(@)", header: flh.}
proc copy*(self: Image): Image {.importcpp: "#.copy(@)", header: flh.}
proc w*(self: Image): cint {.importcpp: "#.w(@)", header: flh.}
proc h*(self: Image): cint {.importcpp: "#.h(@)", header: flh.}
proc d*(self: Image): cint {.importcpp: "#.d(@)", header: flh.}
proc ld*(self: Image): cint {.importcpp: "#.ld(@)", header: flh.}
proc count*(self: Image): cint {.importcpp: "#.count(@)", header: flh.}
proc data*(self: Image): cstring {.importcpp: "#.data(@)", header: flh.}
proc fail*(self: Image): cint {.importcpp: "#.fail(@)", header: flh.}
proc color_average*(self: Image; c: Color; i: cfloat) {.importcpp: "#.color_average(@)", header: flh.}
proc inactive*(self: Image) {.importcpp: "#.inactive(@)", header: flh.}
proc desaturate*(self: Image) {.importcpp: "#.desaturate(@)", header: flh.}
proc draw*(self: Image; X, Y, W, H: cint; cx, cy: cint = 0) {.importcpp: "#.draw(@)", header: flh.}
proc draw*(self: Image; X, Y: cint) {.importcpp: "#.draw(@)", header: flh.}
proc uncache*(self: Image) {.importcpp: "#.uncache(@)", header: flh.}

# static methods
proc RGB_scaling*(v: Fl_RGB_Scaling) {.importcpp: "Fl_Image::RGB_scaling(@)", header: flh.}
proc RGB_scaling*(): Fl_RGB_Scaling {.importcpp: "Fl_Image::RGB_scaling(@)", header: flh.}

type
  PixmapObj* {.importc: "Fl_Pixmap".} = object of ImageObj
    alloc_data: cint
  Pixmap* = ptr PixmapObj

#proc make_pixmap*(D: ptr ptr cchar): Pixmap {.importcpp: "new Fl_Pixmap(@)", header: flh_pixmap.}
proc make_pixmap*(D: ptr ptr cuchar): Pixmap {.importcpp: "new Fl_Pixmap(@)", header: flh_pixmap.}

proc copy*(self: Pixmap; W, H: cint): Image {.importcpp: "#.copy(@)", header: flh_pixmap.}
proc copy*(self: Pixmap): Image {.importcpp: "#.copy(@)", header: flh_pixmap.}
proc color_average*(self: Pixmap; c: Color; i: cfloat) {.importcpp: "#.color_average(@)", header: flh_pixmap.}
proc desaturate*(self: Pixmap) {.importcpp: "#.desaturate(@)", header: flh_pixmap.}
proc draw*(self: Pixmap; X, Y, W, H: cint; cx, cy: cint = 0) {.importcpp: "#.draw(@)", header: flh_pixmap.}
proc draw*(self: Pixmap; X, Y: cint) {.importcpp: "#.draw(@)", header: flh_pixmap.}
proc uncache*(self: Pixmap) {.importcpp: "#.uncache(@)", header: flh_pixmap.}

type
  RGB_Image_Obj* {.importc: "Fl_RGB_Image", header: flh.} = object of ImageObj
    array: ptr cuchar
    alloc_array: cint

  RGB_Image* = ptr RGB_Image_Obj

proc make_rgb_image*(bits: ptr cuchar; W, H: cint; D: cint = 3; LD: cint = 0): RGB_Image {.importcpp: "new Fl_RGB_Image(@)", header: flh.}
proc make_rgb_image*(pxm: Pixmap; bg: Color = GRAY): RGB_Image {.importcpp: "new Fl_RGB_Image(@)", header: flh.}

# methods
proc copy*(self: RGB_Image; W, H: cint): Image {.importcpp: "#.copy(@)", header: flh.}
proc copy*(self: RGB_Image): Image {.importcpp: "#.copy(@)", header: flh.}
proc color_average*(self: RGB_Image; c: Color; i: cfloat) {.importcpp: "#.color_average(@)", header: flh.}
proc desaturate*(self: RGB_Image) {.importcpp: "#.desaturate(@)", header: flh.}
proc draw*(self: RGB_Image; X, Y, W, H = cint; cx, cy: cint = 0) {.importcpp: "#.draw(@)", header: flh.}
proc draw*(self: RGB_Image; X, Y: cint) {.importcpp: "#.draw(@)", header: flh.}
proc uncache*(self: RGB_Image) {.importcpp: "#.uncache(@)", header: flh.}

# static methods
proc max_size*(size: csize) {.importcpp: "Fl_RGB_Image::max_size(@)", header: flh.}
proc max_size*(): csize {.importcpp: "Fl_RGB_Image::max_size(@)", header: flh.}

const
  flh_bmpimage = "FL/Fl_BMP_Image.H"
type
  BmpImageObj* {.importc: "Fl_BMP_Image", header: flh_bmpimage.} = object of RGB_Image_Obj
  BmpImage* = ptr BmpImageObj

proc make_bmp_image*(filename: cstring): BmpImage {.importcpp: "new Fl_BMP_Image(@)", header: flh_bmpimage.}

const
  flh_bitmap = "FL/Fl_Bitmap.H"
type
  BitmapObj* = object of ImageObj
    `array`*: ptr cuchar
    alloc_array*: cint
  Bitmap* = ptr BitmapObj

proc make_bitmap*(bits: cstring; W, H: cint): Bitmap {.importcpp: "new Fl_Bitmap(@)", header: flh_bitmap.}

proc copy*(self: Bitmap; W, H: cint): Image {.importcpp: "#.copy(@)", header: flh_bitmap.}
proc copy*(self: Bitmap): Image {.importcpp: "#.copy(@)", header: flh_bitmap.}
proc draw*(self: Bitmap; X, Y, W, H: cint; cx, cy: cint = 0) {.importcpp: "#.draw(@)", header: flh_bitmap.}
proc draw*(self: Bitmap; X, Y: cint) {.importcpp: "#.draw(@)", header: flh_bitmap.}
proc uncache*(self: Bitmap) {.importcpp: "#.uncache(@)", header: flh_bitmap.}

const
  flh_xbmimage = "FL/Fl_XBM_Image.H"
type
  XbmImageObj* {.importc: "Fl_XBM_Image", header: flh_xbmimage.} = object of BitmapObj
  XbmImage* = ptr XbmImageObj

proc make_xbm_image*(filename: cstring): XbmImage {.importcpp: "new Fl_XBM_Image(@)", header: flh_xbmimage.}

const
  flh_xpmimage = "FL/Fl_XPM_Image.H"
type
  XpmImageObj* {.importc: "Fl_XPM_Image", header: flh_xpmimage.} = object of PixmapObj
  XpmImage* = ptr XpmImageObj

proc make_xpm_image*(filename: cstring): XbmImage {.importcpp: "new Fl_XPM_Image(@)", header: flh_xpmimage.}

const
  flh_gif = "FL/Fl_GIF_Image.H"
type
  GifImageObj* {.importc: "Fl_GIF_Image", header: flh_gif.} = object of PixmapObj
  GifImage* = ptr GifImageObj

proc make_gif_image*(filename: cstring): GifImage {.importcpp: "new Fl_GIF_Image(@)", header: flh_gif.}

const
  flh_jpeg = "FL/Fl_JPEG_Image.H"
type
  JpegImageObj* {.importc: "Fl_JPEG_Image", header: flh_jpeg.} = object of RgbImageObj
  JpegImage* = ptr JpegImageObj

proc make_jpeg_image*(filename: cstring): JpegImage {.importcpp: "new Fl_JPEG_Image(@)", header: flh_jpeg.}
proc make_jpeg_image*(name: cstring; data: cuchar): JpegImage {.importcpp: "new Fl_JPEG_Image(@)", header: flh_jpeg.}

const
  flh_pngimage = "FL/Fl_PNG_Image.H"
type
  PngImageObj* {.importc: "Fl_PNG_Image", header: flh_pngimage.} = object of RgbImageObj
  PngImage* = ptr PngImageObj

proc make_png_image*(filename: cstring): PngImage {.importcpp: "new Fl_PNG_Image(@)", header: flh_pngimage.}
proc make_png_image*(name: cstring; data: cuchar; datasize: cint): PngImage {.importcpp: "new Fl_PNG_Image(@)", header: flh_pngimage.}

const
  flh_pnmimage = "FL/Fl_PNM_Image.H"
type
  PnmImageObj* {.importc: "Fl_PNM_Image", header: flh_pnmimage.} = object of RgbImageObj
  PnmImage* = ptr PnmImageObj

proc make_pnm_image*(filename: cstring): PnmImage {.importcpp: "new Fl_PNM_Image(@)", header: flh_pnmimage.}

# ________________________________________________________________________

const
  flh_shared_image = "FL/Fl_Shared_Image.H"

type
  SharedHandler* {.importcpp: "Fl_Shared_Handler", header: flh_shared_image.} = proc(name: cstring; header: ptr cuchar; headerlen: cint): Image

  SharedImageObj* {.importc: "Fl_Shared_Image", header: flh_shared_image.} = object of ImageObj
  SharedImage* = ptr SharedImageObj

proc name*(self: SharedImage): cstring {.importcpp: "#.name(@)", header: flh_shared_image.}
proc refcount*(self: SharedImage): cint {.importcpp: "#.refcount(@)", header: flh_shared_image.}
proc release*(self: SharedImage) {.importcpp: "#.release(@)", header: flh_shared_image.}
proc reload*(self: SharedImage) {.importcpp: "#.reload(@)", header: flh_shared_image.}
proc copy*(self: SharedImage; W, H: cint): Image {.importcpp: "#.copy(@)", header: flh_shared_image.}
proc copy*(self: SharedImage): Image {.importcpp: "#.copy(@)", header: flh_shared_image.}
proc color_average*(self: SharedImage; c: Color; i: float) {.importcpp: "#.color_average(@)", header: flh_shared_image.}
proc desaturate*(self: SharedImage) {.importcpp: "#.desaturate(@)", header: flh_shared_image.}
proc draw*(self: SharedImage; X, Y, W, H, cx, cy: cint) {.importcpp: "#.draw(@)", header: flh_shared_image.}
proc draw*(self: SharedImage; X, Y: cint) {.importcpp: "#.draw(@)", header: flh_shared_image.}
proc scale*(self: SharedImage; width, height: cint; proportional: cint = 1; can_expand: cint = 0) {.importcpp: "#.scale(@)", header: flh_shared_image.}
proc uncache*(self: SharedImage) {.importcpp: "#.uncache(@)", header: flh_shared_image.}

proc sharedimage_find*(name: cstring; W, H: cint = 0): SharedImage {.importcpp: "Fl_Shared_Image::find(@)", header: flh_shared_image.}
proc sharedimage_get*(name: cstring; W, H: cint = 0): SharedImage {.importcpp: "Fl_Shared_Image::get(@)", header: flh_shared_image.}
proc sharedimage_get*(rgb: RgbImage; own_it: cint = 1): SharedImage {.importcpp: "Fl_Shared_Image::get(@)", header: flh_shared_image.}
proc sharedimage_images*(): ptr SharedImage {.importcpp: "Fl_Shared_Image::images(@)", header: flh_shared_image.}
proc sharedimage_num_images*(): cint {.importcpp: "Fl_Shared_Image::num_images(@)", header: flh_shared_image.}
proc sharedimage_add_handler*(f: SharedHandler) {.importcpp: "Fl_Shared_Image::add_handler(@)", header: flh_shared_image.}
proc sharedimage_remove_handler*(f: SharedHandler) {.importcpp: "Fl_Shared_Image::remove_handler(@)", header: flh_shared_image.}
proc sharedimage_scaling_algorithm*(algorithm: cint) {.importcpp: "Fl_Shared_Image::scaling_algorithm(@)", header: flh_shared_image.}

proc fl_register_images*() {.importcpp: "fl_register_image(@)", header: flh_shared_image.}

# ----------------------------------------------------------------------

const
  flh_tiled_image = "FL/Fl_Tiled_Image.H"
type
  TiledImageObj* {.importc: "Fl_Tiled_Image", header: flh_tiled_image.} = object of ImageObj
  TiledImage* = ptr TiledImageObj

proc make_TiledImage*(i: Image; w, h: cint = 0): TiledImage {.importcpp: "new Fl_Tiled_Image(@)", header: flh_tiled_image.}

proc copy*(self: TiledImage; W, H: cint): Image {.importcpp: "#.copy(@)", header: flh_tiled_image.}
proc copy*(self: TiledImage): Image {.importcpp: "#.copy(@)", header: flh_tiled_image.}
proc color_average*(self: TiledImage; c: Color; i: float) {.importcpp: "#.color_average(@)", header: flh_tiled_image.}
proc desaturate*(self: TiledImage) {.importcpp: "#.desaturate(@)", header: flh_tiled_image.}
proc draw*(self: TiledImage; X, Y, W, H, cx, cy: cint) {.importcpp: "#.draw(@)", header: flh_tiled_image.}
proc draw*(self: TiledImage; X, Y: cint) {.importcpp: "#.draw(@)", header: flh_tiled_image.}
proc image*(self: TiledImage): Image {.importcpp: "#.image(@)", header: flh_tiled_image.}
