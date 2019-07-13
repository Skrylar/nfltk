
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
proc measure*(self: Label; w, h: var cint) {.importcpp: "#.measure(@)", header: flh.}

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
proc measure_label*(self: Widget; ww, hh: var cint) {.importcpp: "#.measure_label(@)", header: flh.}
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

const
  flh_multilabel = "FL/Fl_Multi_Label.H"
type
  MultiLabel* {.importcpp: "Fl_Multi_Label", header: flh_multilabel.} = object
    labela*, labelb*: cstring
    typea*, typeb*: cuchar

# TODO
#label(self: MultiLabel; w: Widget)
#label(self: MultiLabel; menu: MenuItem)

# ________________________________________________________________________

proc show_colormap(old: Color): Color {.importcpp: "fl_show_colormap(@)", header: "FL/fl_show_colormap.H".}

# ________________________________________________________________________

const
  flh_preferences = "FL/Fl_Preferences.H"

  #enum Root {
  PREFERENCES_SYSTEM* = 0
  PREFERENCES_USER* = 1

type
  PreferenceID* = pointer

  PreferencesObj* {.importc: "Fl_Preferences", header: flh_preferences.} = object {.inheritable.}
  Preferences* = ptr PreferencesObj

  PreferenceEntry* {.importcpp: "Fl_Preferences::Entry", header: flh_preferences.} = object
    name*, value*: cstring

  PreferenceName* {.importcpp: "Fl_Preferences::Name", header: flh_preferences.} = object
  PreferenceNode* {.importcpp: "Fl_Preferences::Node", header: flh_preferences.} = object
  PreferenceRootNode* {.importcpp: "Fl_Preferences::RootNode", header: flh_preferences.} = object

#class FL_EXPORT Fl_Preferences {
proc preferences_newUUID*() {.importcpp: "Fl_Preferences::newUUID", header: flh_preferences.}

proc make_preferences*(root: cint; vendor, application: cstring): Preferences {.importcpp: "new Fl_Preferences(@)", header: flh_preferences.}
proc make_preferences*(path, vendor, application: cstring): Preferences {.importcpp: "new Fl_Preferences(@)", header: flh_preferences.}
proc make_preferences*(parent: Preferences; group: cstring): Preferences {.importcpp: "new Fl_Preferences(@)", header: flh_preferences.}
proc make_preferences*(parent: Preferences; groupIndex: cint): Preferences {.importcpp: "new Fl_Preferences(@)", header: flh_preferences.}
proc make_preferences*(id: PreferenceID): Preferences {.importcpp: "new Fl_Preferences(@)", header: flh_preferences.}

# TODO
#Preferences(const Fl_Preferences&)

proc free*(self: Preferences) {.importcpp: "delete @", header: flh_preferences.}

proc remove*(id: PreferenceID): cchar {.importcpp: "Fl_Preferences::remove(@)", header: flh_preferences.}

proc id*(self: Preferences): PreferenceID {.importcpp: "#.id(@)", header: flh_preferences.}
proc name*(self: Preferences): cstring {.importcpp: "#.name(@)", header: flh_preferences.}
proc path*(self: Preferences): cstring {.importcpp: "#.path(@)", header: flh_preferences.}
proc groups*(self: Preferences): cint {.importcpp: "#.groups(@)", header: flh_preferences.}
proc group*(self: Preferences; num_group: cint): cstring {.importcpp: "#.group(@)", header: flh_preferences.}
proc groupExists*(self: Preferences; key: cstring): cchar {.importcpp: "#.groupExists(@)", header: flh_preferences.}
proc deleteGroup*(self: Preferences; group: cstring): cchar {.importcpp: "#.deleteGroup(@)", header: flh_preferences.}
proc deleteAllGroups*(self: Preferences): cchar {.importcpp: "#.deleteAllGroups(@)", header: flh_preferences.}
proc entries*(self: Preferences): cint {.importcpp: "#.entries(@)", header: flh_preferences.}
proc entry*(self: Preferences; index: cint): cstring {.importcpp: "#.entry(@)", header: flh_preferences.}
proc entryExists*(self: Preferences; key: cstring): cchar {.importcpp: "#.entryExists(@)", header: flh_preferences.}
proc deleteEntry*(self: Preferences; entry: cstring): cchar {.importcpp: "#.deleteEntry(@)", header: flh_preferences.}
proc deleteAllEntries*(self: Preferences): cchar {.importcpp: "#.deleteAllEntries(@)", header: flh_preferences.}
proc clear*(self: Preferences): cchar {.importcpp: "#.clear(@)", header: flh_preferences.}
proc set*(self: Preferences; entry: cstring; value: cint): cchar {.importcpp: "#.set(@)", header: flh_preferences.}
proc set*(self: Preferences; entry: cstring; value: cfloat): cchar {.importcpp: "#.set(@)", header: flh_preferences.}
proc set*(self: Preferences; entry: cstring; value: cfloat; precision: cint): cchar {.importcpp: "#.set(@)", header: flh_preferences.}
proc set*(self: Preferences; entry: cstring; value: cdouble): cchar {.importcpp: "#.set(@)", header: flh_preferences.}
proc set*(self: Preferences; entry: cstring; value: cdouble; precision: cint): cchar {.importcpp: "#.set(@)", header: flh_preferences.}
proc set*(self: Preferences; entry, value: cstring): cchar {.importcpp: "#.set(@)", header: flh_preferences.}
proc set*(self: Preferences; entry: cstring; value: pointer; size: cint): cchar {.importcpp: "#.set(@)", header: flh_preferences.}
proc get*(self: Preferences; entry: cstring; value: ref cint; defaultValue: cint): cchar {.importcpp: "#.get(@)", header: flh_preferences.}
proc get*(self: Preferences; entry: cstring; value: ref cfloat; defaultValue: float): cchar {.importcpp: "#.get(@)", header: flh_preferences.}
proc get*(self: Preferences; entry: cstring; value: ref cdouble; defaultValue: cdouble): cchar {.importcpp: "#.get(@)", header: flh_preferences.}
proc get*(self: Preferences; entry: cstring; value: ref cstring; defaultValue: cstring): cchar {.importcpp: "#.get(@)", header: flh_preferences.}
proc get*(self: Preferences; entry, value, defaultValue: cstring; maxSize: cint): cchar {.importcpp: "#.get(@)", header: flh_preferences.}
proc get*(self: Preferences; entry: cstring; value: ref pointer; defaultValue: pointer; defaultSize: cint ): cchar {.importcpp: "#.get(@)", header: flh_preferences.}
proc get*(self: Preferences; entry: cstring; value, defaultValue: pointer; defaultSize, maxSize: cint): cchar {.importcpp: "#.get(@)", header: flh_preferences.}
proc size*(self: Preferences; entry: cstring): cint {.importcpp: "#.size(@)", header: flh_preferences.}
proc getUserdataPath*(self: Preferences; path: cstring; pathlen: cint): cchar {.importcpp: "#.getUserdataPath(@)", header: flh_preferences.}
proc flush*(self: Preferences) {.importcpp: "#.flush(@)", header: flh_preferences.}

#class FL_EXPORT PreferenceName {
proc make_preference_name*(n: cuint): PreferenceName {.importcpp: "new Fl_Preferences::Name(@)", header: flh_preferences.}
proc make_preference_name*(format: cstring): PreferenceName {.importcpp: "new Fl_Preferences::Name(@)", header: flh_preferences, varargs.}
# XXX in C++ this is the operator()
proc data*(self: PreferenceName) {.importcpp: "#()", header: flh_preferences}
proc free*(self: PreferenceName) {.importcpp: "delete @", header: flh_preferences.}

#class FL_EXPORT Node {
var preference_node_lastEntrySet {.importcpp: "Fl_Preferences::Node::lastEntrySet", header: flh_preferences.}: cint

proc make_node*(path: cstring): PreferenceNode {.importcpp: "new Fl_Preferences::Node(@)", header: flh_preferences.}
proc free*(self: PreferenceNode) {.importcpp: "delete @", header: flh_preferences.}

# TODO
#write(FILE *f): cint

proc name*(self: PreferenceNode): cstring {.importcpp: "#.name(@)", header: flh_preferences.}
proc path*(self: PreferenceNode): cstring {.importcpp: "#.path(@)", header: flh_preferences.}
proc find*(self: PreferenceNode; path: cstring): ptr PreferenceNode {.importcpp: "#.find(@)", header: flh_preferences.}
proc search*(self: PreferenceNode; path: cstring; offset: cint = 0): ptr PreferenceNode {.importcpp: "#.search(@)", header: flh_preferences.}
proc childNode*(self: PreferenceNode; ix: cint): ptr PreferenceNode {.importcpp: "#.childNode(@)", header: flh_preferences.}
proc addChild*(self: PreferenceNode; path: cstring): ptr PreferenceNode {.importcpp: "#.addChild(@)", header: flh_preferences.}
proc setParent*(self: PreferenceNode; parent: ptr PreferenceNode) {.importcpp: "#.setParent(@)", header: flh_preferences.}
proc parent*(self: PreferenceNode): ptr PreferenceNode {.importcpp: "#.parent(@)", header: flh_preferences.}
proc setRoot*(self: PreferenceNode; r: ptr PreferenceRootNode) {.importcpp: "#.setRoot(@)", header: flh_preferences.}
proc findRoot*(self: PreferenceNode): ptr PreferenceRootNode {.importcpp: "#.findRoot(@)", header: flh_preferences.}
proc remove*(self: PreferenceNode): cchar {.importcpp: "#.remove(@)", header: flh_preferences.}
proc dirty*(self: PreferenceNode): cchar {.importcpp: "#.dirty(@)", header: flh_preferences.}
proc deleteAllChildren*(self: PreferenceNode) {.importcpp: "#.deleteAllChildren(@)", header: flh_preferences.}
proc nChildren*(self: PreferenceNode): cint {.importcpp: "#.nChildren(@)", header: flh_preferences.}
proc child*(self: PreferenceNode; ix: cint): cstring {.importcpp: "#.child(@)", header: flh_preferences.}
proc set*(self: PreferenceNode; name, value: cstring) {.importcpp: "#.set(@)", header: flh_preferences.}
proc set*(self: PreferenceNode; line: cstring) {.importcpp: "#.set(@)", header: flh_preferences.}
proc add*(self: PreferenceNode; line: cstring) {.importcpp: "#.add(@)", header: flh_preferences.}
proc get*(self: PreferenceNode; name: cstring): cstring {.importcpp: "#.get(@)", header: flh_preferences.}
proc getEntry*(self: PreferenceNode; name: cstring): cint {.importcpp: "#.getEntry(@)", header: flh_preferences.}
proc deleteEntry*(self: PreferenceNode; name: cstring): cchar {.importcpp: "#.deleteEntry(@)", header: flh_preferences.}
proc deleteAllEntries*(self: PreferenceNode) {.importcpp: "#.deleteAllEntries(@)", header: flh_preferences.}
proc nEntry*(self: PreferenceNode): cint {.importcpp: "#.nEntry(@)", header: flh_preferences.}

# TODO
#PreferenceEntry &entry(i: cint)

#class FL_EXPORT RootNode {
proc make_preference_root_node*(p: ptr Preferences; root: cint; vendor, application: cstring): PreferenceRootNode {.importcpp: "new Fl_Preferences::RootNode(@)", header: flh_preferences.}
proc make_preference_root_node*(p: ptr Preferences; path, vendor, application: cstring): PreferenceRootNode {.importcpp: "new Fl_Preferences::RootNode(@)", header: flh_preferences.}
proc make_preference_root_node*(p: ptr Preferences): PreferenceRootNode {.importcpp: "new Fl_Preferences::RootNode(@)", header: flh_preferences.}

proc free*(self: PreferenceRootNode) {.importcpp: "delete @", header: flh_preferences.}

proc read*(self: PreferenceRootNode): cint {.importcpp: "#.read(@)", header: flh_preferences.}
proc write*(self: PreferenceRootNode): cint {.importcpp: "#.write(@)", header: flh_preferences.}
proc getPath*(self: PreferenceRootNode; path: cstring; pathlen: cint): cchar {.importcpp: "#.getPath(@)", header: flh_preferences.}

# ________________________________________________________________________

const
  flh_plugin = "FL/Fl_Plugin.H"
type
  PluginObj* {.importc: "Fl_Plugin", header: flh_plugin.} = object
  Plugin* = ptr PluginObj

  PluginManagerObj* {.importc: "Fl_Plugin_Manager", header: flh_plugin.} = object of PreferencesObj
  PluginManager* = ptr PluginManagerObj

proc make_plugin*(klass, name: cstring): Plugin {.importcpp: "new Fl_Plugin(@)", header: flh_plugin.}
proc free*(self: Plugin) {.importcpp: "delete @", header: flh_plugin.}

proc make_plugin_manager*(klass: cstring): PluginManager {.importcpp: "new Fl_Plugin_Manager(@)", header: flh_plugin.}
proc free*(self: PluginManager) {.importcpp: "delete @", header: flh_plugin.}

proc plugins*(self: Plugin): cint {.importcpp: "#.plugins(@)", header: flh_plugin.}
proc plugin*(self: Plugin; index: cint): Plugin {.importcpp: "#.plugin(@)", header: flh_plugin.}
proc plugin*(self: Plugin; name: cstring): Plugin {.importcpp: "#.plugin(@)", header: flh_plugin.}
proc addPlugin*(self: Plugin; name: cstring; plugin: Plugin): PreferenceID {.importcpp: "#.addPlugin(@)", header: flh_plugin.}

proc removePlugin*(self: Plugin): PreferenceID {.importcpp: "Fl_Plugin_Manager::removePlugin(@)", header: flh_plugin.}
proc load*(self: Plugin; filename: cstring): cint {.importcpp: "Fl_Plugin_Manager::load(@)", header: flh_plugin.}
proc loadAll*(self: Plugin; filepath: cstring; pattern: cstring = nil): cint {.importcpp: "Fl_Plugin_Manager::loadAll(@)", header: flh_plugin.}

# ________________________________________________________________________

const
  flh_positioner = "FL/Fl_Positioner.H"
type
  PositionerObj* {.importc: "Fl_Positioner", header: flh_positioner.} = object of WidgetObj
  Positioner* = ptr PositionerObj

proc make_Positioner*(x, y, w, h: cint; text: cstring = nil): Positioner {.importcpp: "new Fl_Positioner(@)", header: flh_positioner.}

proc xvalue*(self: Positioner): cdouble {.importcpp: "#.xvalue(@)", header: flh_positioner.}
proc yvalue*(self: Positioner): cdouble {.importcpp: "#.yvalue(@)", header: flh_positioner.}
proc `xvalue=`*(self: Positioner; a: cdouble): cint {.importcpp: "#.xvalue(@)", header: flh_positioner.}
proc `yvalue=`*(self: Positioner; a: cdouble): cint {.importcpp: "#.yvalue(@)", header: flh_positioner.}
proc value*(self: Positioner; x, y: cdouble): cint {.importcpp: "#.value(@)", header: flh_positioner.}
proc xbounds*(self: Positioner; x, y: cdouble) {.importcpp: "#.xbounds(@)", header: flh_positioner.}
proc xminimum*(self: Positioner): cdouble {.importcpp: "#.xminimum(@)", header: flh_positioner.}
proc `xminimum=`*(self: Positioner; a: cdouble) {.importcpp: "#.xminimum(@)", header: flh_positioner.}
proc xmaximum*(self: Positioner): cdouble {.importcpp: "#.xmaximum(@)", header: flh_positioner.}
proc `xmaximum=`*(self: Positioner; a: cdouble) {.importcpp: "#.xmaximum(@)", header: flh_positioner.}
proc ybounds*(self: Positioner; a, b: cdouble) {.importcpp: "#.ybounds(@)", header: flh_positioner.}
proc yminimum*(self: Positioner): cdouble {.importcpp: "#.yminimum(@)", header: flh_positioner.}
proc `yminimum=`*(self: Positioner; a: cdouble) {.importcpp: "#.yminimum(@)", header: flh_positioner.}
proc ymaximum*(self: Positioner): cdouble {.importcpp: "#.ymaximum(@)", header: flh_positioner.}
proc `ymaximum=`*(self: Positioner; a: cdouble) {.importcpp: "#.ymaximum(@)", header: flh_positioner.}
proc `xstep=`*(self: Positioner; a: cdouble) {.importcpp: "#.xstep(@)", header: flh_positioner.}
proc `ystep=`*(self: Positioner; a: cdouble) {.importcpp: "#.ystep(@)", header: flh_positioner.}

# ________________________________________________________________________

const
  flh_progress = "FL/Fl_Progress.H"

type
  ProgressObj* {.importc: "Fl_Progress", header: flh_progress.} = object of WidgetObj
  Progress* = ptr ProgressObj

proc make_Progress*(x, y, w, h: cint; text: cstring = nil): Progress {.importcpp: "new Fl_Progress(@)", header: flh_progress.}

proc maximum*(self: Progress): cfloat {.importcpp: "#.maximum(@)", header: flh_progress.}
proc `maximum=`*(self: Progress; value: cfloat) {.importcpp: "#.maximum(@)", header: flh_progress.}
proc minimum*(self: Progress): cfloat {.importcpp: "#.minimum(@)", header: flh_progress.}
proc `minimum=`*(self: Progress; value: cfloat) {.importcpp: "#.minimum(@)", header: flh_progress.}
proc value*(self: Progress): cfloat {.importcpp: "#.value(@)", header: flh_progress.}
proc `value=`*(self: Progress; value: cfloat) {.importcpp: "#.value(@)", header: flh_progress.}
