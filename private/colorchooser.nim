
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

