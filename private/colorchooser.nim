
const
  flh_colorchooser = "FL/Fl_Color_Chooser.H"

import group
import valuator

type
  ColorChooserObj* {.importc: "Fl_Color_Chooser", header: flh_colorchooser.} = object of GroupObj
  ColorChooser* = ptr ColorChooserObj

proc make_color_chooser*(x, y, w, h: cint; text: cstring = nil): ColorChooser {.importcpp: "new Fl_Color_Chooser(@)", header: flh_colorchooser.}

proc mode*(self: ColorChooser): cint {.importcpp: "#.mode(@)", header: flh_colorchooser.}
proc mode*(self: ColorChooser; newMode: cint) {.importcpp: "#.mode(@)", header: flh_colorchooser.}
proc hue*(self: ColorChooser): cdouble {.importcpp: "#.hue(@)", header: flh_colorchooser.}
proc saturation*(self: ColorChooser): cdouble {.importcpp: "#.saturation(@)", header: flh_colorchooser.}
proc value*(self: ColorChooser): cdouble {.importcpp: "#.value(@)", header: flh_colorchooser.}
proc r*(self: ColorChooser): cdouble {.importcpp: "#.r(@)", header: flh_colorchooser.}
proc g*(self: ColorChooser): cdouble {.importcpp: "#.g(@)", header: flh_colorchooser.}
proc b*(self: ColorChooser): cdouble {.importcpp: "#.b(@)", header: flh_colorchooser.}
proc hsv*(self: ColorChooser; H, S, V: cdouble): cint {.importcpp: "#.hsv(@)", header: flh_colorchooser.}
proc rgb*(self: ColorChooser; R, G, B: cdouble): cint {.importcpp: "#.rgb(@)", header: flh_colorchooser.}

proc fl_color_chooser*(name: cstring; r, g, b: ref cdouble; m: cint = -1): cint {.importcpp, header: flh_colorchooser.}
proc fl_color_chooser*(name: cstring; r, g, b: ref cuchar; m: cint = -1): cint {.importcpp, header: flh_colorchooser.}

proc hsv2rgb*(H, S, V: cdouble; R, G, B: ref cdouble) {.importcpp: "Fl_Color_Chooser::hsv2rgb(@)", header: flh_colorchooser.}
proc rgb2hsv*(R, G, B: cdouble; H, S, V: ref cdouble) {.importcpp: "Fl_Color_Chooser::rgb2hsv(@)", header: flh_colorchooser.}

const
  flh_nativefilechooser = "FL/Fl_Native_File_Chooser.H"

#when defined(windows):
# TODO
# typedef OPENFILENAMEW fl_OPENFILENAMEW;
# typedef BROWSEINFOW fl_BROWSEINFOW;
#else:
#typedef void fl_OPENFILENAMEW;
#typedef void fl_BROWSEINFOW;

when defined(apple):
  const
    MAXFILTERS = 80

const
  #enum Type {
  BROWSE_FILE* = 0
  BROWSE_DIRECTORY* = 1
  BROWSE_MULTI_FILE* = 2
  BROWSE_MULTI_DIRECTORY* = 3
  BROWSE_SAVE_FILE* = 4
  BROWSE_SAVE_DIRECTORY* = 5

  #enum Option {
  NO_OPTIONS*     = 0x0000
  SAVEAS_CONFIRM* = 0x0001
  NEW_FOLDER*     = 0x0002
  PREVIEW*        = 0x0004
  USE_FILTER_EXT* = 0x0008

type
  NativeFileChooserObj* {.importc: "Fl_Native_File_chooser", header: flh_nativefilechooser.} = object
  NativeFileChooser* = ptr NativeFileChooserObj

var native_file_chooser_file_exists_message* {.importcpp: "Fl_Native_File_Chooser::file_exists_message", header: flh_nativefilechooser.}: cstring;

proc make_NativeFileChooser*(val: cint = BROWSE_FILE): NativeFileChooser {.importcpp: "new Fl_Native_File_chooser(@)", header: flh_nativefilechooser.}
proc free*(self: NativeFileChooser) {.importcpp: "delete @", header: flh_nativefilechooser.}

proc `type=`*(self: NativeFileChooser; t: cint) {.importcpp: "#.type(@)", header: flh_nativefilechooser.}
proc `type`*(self: NativeFileChooser): cint {.importcpp: "#.type(@)", header: flh_nativefilechooser.}
proc `options=`*(self: NativeFileChooser; o: cint) {.importcpp: "#.options(@)", header: flh_nativefilechooser.}
proc options*(self: NativeFileChooser): cint {.importcpp: "#.options(@)", header: flh_nativefilechooser.}
proc `filename=`*(self: NativeFileChooser): cstring {.importcpp: "#.filename(@)", header: flh_nativefilechooser.}
proc filename*(self: NativeFileChooser; i: cint): cstring {.importcpp: "#.filename(@)", header: flh_nativefilechooser.}
proc `directory=`*(self: NativeFileChooser; val: cstring) {.importcpp: "#.directory(@)", header: flh_nativefilechooser.}
proc directory*(self: NativeFileChooser): cstring {.importcpp: "#.directory(@)", header: flh_nativefilechooser.}
proc `title=`*(self: NativeFileChooser; t: cstring) {.importcpp: "#.title(@)", header: flh_nativefilechooser.}
proc title*(self: NativeFileChooser): cstring {.importcpp: "#.title(@)", header: flh_nativefilechooser.}
proc `filter=`*(self: NativeFileChooser): cstring {.importcpp: "#.filter(@)", header: flh_nativefilechooser.}
proc filter*(self: NativeFileChooser; f: cstring) {.importcpp: "#.filter(@)", header: flh_nativefilechooser.}
proc `filter_value=`*(self: NativeFileChooser; i: cint) {.importcpp: "#.filter_value(@)", header: flh_nativefilechooser.}
proc filter_value*(self: NativeFileChooser): cint {.importcpp: "#.filter_value(@)", header: flh_nativefilechooser.}
proc `preset_file=`*(self: NativeFileChooser; f: cstring) {.importcpp: "#.preset_file(@)", header: flh_nativefilechooser.}
proc preset_file*(self: NativeFileChooser): cstring {.importcpp: "#.preset_file(@)", header: flh_nativefilechooser.}
proc filters*(self: NativeFileChooser): cint {.importcpp: "#.filters(@)", header: flh_nativefilechooser.}
proc count*(self: NativeFileChooser): cint {.importcpp: "#.count(@)", header: flh_nativefilechooser.}
proc errmsg*(self: NativeFileChooser): cstring {.importcpp: "#.errmsg(@)", header: flh_nativefilechooser.}
proc show*(self: NativeFileChooser): cint {.importcpp: "#.show(@)", header: flh_nativefilechooser.}

# XXX if these have no public values, what is their point?
#when not defined(apple) and not defined(windows):
#class FL_EXPORT Fl_FLTK_File_Chooser {
#class FL_EXPORT Fl_GTK_File_Chooser : public Fl_FLTK_File_Chooser {
