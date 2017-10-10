
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
  ImageObj* {.importc: "Fl_Image", header: flh.} = object {.inheritable.}
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
