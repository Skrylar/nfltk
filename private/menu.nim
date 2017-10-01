
import enumerations
import widget
import image

const
  flh = "FL/Fl_Menu.H"
  flh_menubar = "FL/Fl_Menu_Bar.H"
  flh_menubutton = "FL/Fl_Menu_Button.H"
  flh_menuitem = "FL/Fl_Menu_Item.H"

type
  MenuObj* {.importcpp: "Fl_Menu_" , header: flh.} = object of Widget
  Menu* = ptr MenuObj

  MenuBarObj* {.importcpp: "Fl_Menu_Bar" , header: flh_menubar.} = object of MenuObj
  MenuBar* = ptr MenuBarObj

  MenuButtonObj* {.importcpp: "Fl_Menu_Button" , header: flh_menubutton.} = object of MenuObj
  MenuButton* = ptr MenuButtonObj

  MenuItemObj* {.importcpp: "Fl_Menu_Item", header: flh_menuitem.} = object of MenuObj
    mtext* {.importc: "text".}: cstring
    mshortcut* {.importc: "shortcut_".}: cint
    mcallback* {.importc: "callback_".}: Callback
    muser_data* {.importc: "user_data_".}: pointer
    mflags* {.importc: "flags".}: cint
    mlabeltype* {.importc: "labeltype_".}: cuchar
    mlabelfont* {.importc: "labelfont_".}: Font
    mlabelsize* {.importc: "labelsize_".}: Fontsize
    mlabelcolor* {.importc: "labelcolor_".}: Color
  MenuItem* = ptr MenuItemObj

# Fl_Widget
proc make_menu*(x, y, w, h: cint; text: cstring = nil): Menu {.importcpp: "new Fl_Menu_(@)", header: flh.}

proc item_pathname*(self: Menu; name: cstring; namelen: cint; finditem: MenuItem = nil): cint {.importcpp: "#.item_pathname(@)", header: flh.}
proc picked*(self: Menu; item: MenuItem): MenuItem {.importcpp: "#.picked(@)", header: flh.}
proc find_item*(self: Menu; name: cstring): MenuItem {.importcpp: "#.find_item(@)", header: flh.}
proc find_item*(self: Menu; cb: Callback): MenuItem {.importcpp: "#.find_item(@)", header: flh.}
proc find_index*(self: Menu; name: cstring): cint {.importcpp: "#.find_index(@)", header: flh.}
proc find_index*(self: Menu; item: MenuItem): cint {.importcpp: "#.find_index(@)", header: flh.}
proc find_index*(self: Menu; cb: Callback): cint {.importcpp: "#.find_index(@)", header: flh.}
proc test_shortcut*(self: Menu): Menu {.importcpp: "#.test_shortcut(@)", header: flh.}
proc global*(self: Menu) {.importcpp: "#.global(@)", header: flh.}
proc menu*(self: Menu): MenuItem {.importcpp: "#.menu(@)", header: flh.}
proc menu*(self: Menu; m: MenuItem) {.importcpp: "#.menu(@)", header: flh.}
proc copy*(self: Menu; m: MenuItem; user_data: pointer = nil) {.importcpp: "#.copy(@)", header: flh.}
proc insert*(self: Menu; index: cint; text: cstring; shortcut: cint; cb: Callback; p: pointer = nil; x: cint = 0): cint {.importcpp: "#.insert(@)", header: flh.}
proc add*(self: Menu; a: cstring; shortcut: cint; cb: Callback; p: pointer = nil, x: cint = 0): cint {.importcpp: "#.add(@)", header: flh.}
proc add*(self: Menu; a, b: cstring; c: Callback; d: pointer = nil; e: cint = 0): cint {.importcpp: "#.add(@)", header: flh.}
proc insert*(self: Menu; index: cint; a, b: cstring; cb: Callback; d: pointer = nil; e: cint = 0): cint {.importcpp: "#.insert(@)", header: flh.}
proc add*(self: Menu; a: cstring): cint {.importcpp: "#.add(@)", header: flh.}
proc size*(self: Menu): cint {.importcpp: "#.size(@)", header: flh.}
proc size*(self: Menu; W, H: cint) {.importcpp: "#.size(@)", header: flh.}
proc clear*(self: Menu) {.importcpp: "#.clear(@)", header: flh.}
proc clear_submenu*(self: Menu; index: cint): cint {.importcpp: "#.clear_submenu(@)", header: flh.}
proc replace*(self: Menu; a: cint; b: cstring) {.importcpp: "#.replace(@)", header: flh.}
proc remove*(self: Menu; a: cint) {.importcpp: "#.remove(@)", header: flh.}
proc shortcut*(self: Menu; i, s: cint) {.importcpp: "#.shortcut(@)", header: flh.}
proc mode*(self: Menu; i, fl: cint) {.importcpp: "#.mode(@)", header: flh.}
proc mode*(self: Menu; i: cint): cint {.importcpp: "#.mode(@)", header: flh.}
proc mvalue*(self: Menu): MenuItem {.importcpp: "#.mvalue(@)", header: flh.}
proc value*(self: Menu): cint {.importcpp: "#.value(@)", header: flh.}
proc `value=`*(self: Menu; item: MenuItem): cint {.importcpp: "#.value(@)", header: flh.}
proc `value=`*(self: Menu; i: cint): cint {.importcpp: "#.value(@)", header: flh.}
proc text*(self: Menu): cstring {.importcpp: "#.text(@)", header: flh.}
proc text*(self: Menu; i: cint): cstring {.importcpp: "#.text(@)", header: flh.}
proc textfont*(self: Menu): Font {.importcpp: "#.textfont(@)", header: flh.}
proc `textfont=`*(self: Menu; c: Font) {.importcpp: "#.textfont(@)", header: flh.}
proc textsize*(self: Menu): Fontsize {.importcpp: "#.textsize(@)", header: flh.}
proc `textsize=`*(self: Menu; s: Fontsize) {.importcpp: "#.textsize(@)", header: flh.}
proc textcolor*(self: Menu): Color {.importcpp: "#.textcolor(@)", header: flh.}
proc `textcolor=`*(self: Menu; c: Color) {.importcpp: "#.textcolor(@)", header: flh.}
proc down_box*(self: Menu): Boxtype {.importcpp: "#.down_box(@)", header: flh.}
proc `down_box=`*(self: Menu; b: Boxtype) {.importcpp: "#.down_box(@)", header: flh.}
proc down_color*(self: Menu): Color {.importcpp: "#.down_color(@)", header: flh.}
proc `down_color=`*(self: Menu; x: cuint) {.importcpp: "#.down_color(@)", header: flh.}
proc setonly*(self: Menu; tem: MenuItem) {.importcpp: "#.setonly(@)", header: flh.}

# Fl_Menu_Bar
proc make_menubar*(X, Y, W, H: cint; text: cstring = nil): MenuBar {.importcpp: "new Fl_Menu_Bar(@)", header: flh_menubar.}

type
  MenuButtonPopupButtons* = cint
const
  Menu_Button_POPUP1*   = 1
  Menu_Button_POPUP2*   = 2
  Menu_Button_POPUP12*  = 3
  Menu_Button_POPUP3*   = 4
  Menu_Button_POPUP13*  = 5
  Menu_Button_POPUP23*  = 6
  Menu_Button_POPUP123* = 7

# Fl_Menu_Button
proc make_menubutton*(x, y, w, h: cint; text: cstring = nil): MenuButton {.importcpp: "new Fl_Menu_Button(@)", header: flh_menubutton.}
proc popup*(self: MenuButton): MenuItem {.importcpp: "#.popup(@)", header: flh_menuitem.}

# menu items

const
  MENU_INACTIVE*   = 1
  MENU_TOGGLE*     = 2
  MENU_VALUE*      = 4
  MENU_RADIO*      = 8
  MENU_INVISIBLE*  = 0x10
  SUBMENU_POINTER* = 0x20
  SUBMENU*         = 0x40
  MENU_DIVIDER*    = 0x80
  MENU_HORIZONTAL* = 0x100

#proc fl_old_shortcut*(s: cstring): Shortcut {.importc, header: flh_menuitem.}

# Fl_Menu_Item
proc next*(self: MenuItem; i: cint = 1): MenuItem {.importcpp: "#.next(@)", header: flh_menuitem.}

proc first*(self: MenuItem): MenuItem {.importcpp: "#.first(@)", header: flh_menuitem.}

proc label*(self: MenuItem): cstring {.importcpp: "#.label(@)", header: flh_menuitem.}
proc `label=`*(self: MenuItem; a: cstring) {.importcpp: "#.label(@)".}
proc label*(self: MenuItem; a: Labeltype; b: cstring) {.importcpp: "#.label(@)", header: flh_menuitem.}

proc labeltype*(self: MenuItem): Labeltype {.importcpp: "#.labeltype(@)", header: flh_menuitem.}
proc `labeltype=`*(self: MenuItem; a: Labeltype) {.importcpp: "#.labeltype(@)".}

proc labelcolor*(self: MenuItem): Color {.importcpp: "#.labelcolor(@)", header: flh_menuitem.}
proc `labelcolor=`*(self: MenuItem; a: Color) {.importcpp: "#.labelcolor(@)".}

proc labelfont*(self: MenuItem): Font {.importcpp: "#.labelfont(@)", header: flh_menuitem.}
proc `labelfont=`*(self: MenuItem; a: Font) {.importcpp: "#.labelfont(@)".}

proc labelsize*(self: MenuItem): Fontsize {.importcpp: "#.labelsize(@)", header: flh_menuitem.}
proc `labelsize=`*(self: MenuItem; a: Fontsize) {.importcpp: "#.labelsize(@)".}

proc callback*(self: MenuItem): Callback {.importcpp: "#.callback(@)", header: flh_menuitem.}
proc callback*(self: MenuItem; c: Callback; p: pointer) {.importcpp: "#.callback(@)".}
proc callback*(self: MenuItem; c: Callback) {.importcpp: "#.callback(@)", header: flh_menuitem.}
proc callback*(self: MenuItem; c: Callback0) {.importcpp: "#.callback(@)".}
proc callback*(self: MenuItem; c: Callback1; p: clong = 0) {.importcpp: "#.callback(@)", header: flh_menuitem.}

proc user_data*(self: MenuItem): pointer {.importcpp: "#.user_data(@)", header: flh_menuitem.}
proc `user_data=`*(self: MenuItem; v: pointer) {.importcpp: "#.user_data(@)".}

proc argument*(self: MenuItem): clong {.importcpp: "#.argument(@)", header: flh_menuitem.}
proc `argument=`*(self: MenuItem; v: clong) {.importcpp: "#.argument(@)".}

proc shortcut*(self: MenuItem): cint {.importcpp: "#.shortcut(@)", header: flh_menuitem.}
proc `shortcut=`*(self: MenuItem; s: cint) {.importcpp: "#.shortcut(@)", header: flh_menuitem.}

proc submenu*(self: MenuItem): cint {.importcpp: "#.submenu(@)", header: flh_menuitem.}
proc checkbox*(self: MenuItem): cint {.importcpp: "#.checkbox(@)", header: flh_menuitem.}
proc radio*(self: MenuItem): cint {.importcpp: "#.radio(@)", header: flh_menuitem.}
proc value*(self: MenuItem): cint {.importcpp: "#.value(@)", header: flh_menuitem.}
proc set*(self: MenuItem) {.importcpp: "#.set(@)", header: flh_menuitem.}
proc clear*(self: MenuItem) {.importcpp: "#.clear(@)", header: flh_menuitem.}
proc setonly*(self: MenuItem) {.importcpp: "#.setonly(@)", header: flh_menuitem.}
proc visible*(self: MenuItem): cint {.importcpp: "#.visible(@)", header: flh_menuitem.}
proc show*(self: MenuItem) {.importcpp: "#.show(@)", header: flh_menuitem.}
proc hide*(self: MenuItem) {.importcpp: "#.hide(@)", header: flh_menuitem.}
proc active*(self: MenuItem): cint {.importcpp: "#.active(@)", header: flh_menuitem.}
proc activate*(self: MenuItem) {.importcpp: "#.activate(@)", header: flh_menuitem.}
proc deactivate*(self: MenuItem) {.importcpp: "#.deactivate(@)", header: flh_menuitem.}
proc activevisible*(self: MenuItem): cint {.importcpp: "#.activevisible(@)", header: flh_menuitem.}

proc `image=`*(self: MenuItem; a: Image) {.importcpp: "#.image(@)", header: flh_menuitem.}

#void image(Fl_Image& a)
proc measure*(self: MenuItem; h: out cint; m: Menu): cint {.importcpp: "#.measure(@)".}
proc draw*(self: MenuItem; x, y, w, h: cint; m: Menu, t: cint = 0) {.importcpp: "#.draw(@)", header: flh_menuitem.}
proc popup*(self: MenuItem; X, Y: cint; title: cstring = nil; picked: MenuItem = nil; m: Menu = nil): MenuItem {.importcpp: "#.popup(@)", header: flh_menuitem.}
proc pulldown*(self: MenuItem; X, Y, W, H: cint; picked: MenuItem = nil; m: Menu = nil; title: MenuItem = nil; menubar: cint = 0): MenuItem {.importcpp: "#.pulldown(@)", header: flh_menuitem.}
proc test_shortcut*(self: MenuItem): MenuItem {.importcpp: "#.test_shortcut(@)", header: flh_menuitem.}
proc find_shortcut*(self: MenuItem; ip: cint = 0; require_alt: bool = false): MenuItem {.importcpp: "#.find_shortcut(@)", header: flh_menuitem.}
proc do_callback*(self: MenuItem; o: Widget) {.importcpp: "#.do_callback(@)", header: flh_menuitem.}
proc do_callback*(self: MenuItem; o: Widget; arg: pointer) {.importcpp: "#.do_callback(@)", header: flh_menuitem.}
proc do_callback*(self: MenuItem; o: Widget; arg: clong) {.importcpp: "#.do_callback(@)", header: flh_menuitem.}
proc insert*(self: MenuItem; a: cint; b: cstring; c: cint; cb: Callback; p: pointer = nil; d: cint = 0): cint {.importcpp: "#.insert(@)", header: flh_menuitem, header: flh_menuitem.}
proc add*(self: MenuItem; a: cstring; shortcut: cint; cb: Callback; p: pointer = nil; d: cint = 0): cint {.importcpp: "#.add(@)", header: flh_menuitem.}
proc add*(self: MenuItem; a, b: cstring; cb: Callback; d: pointer = nil; e: cint = 0): cint {.importcpp: "#.add(@)", header: flh_menuitem.}
proc size*(self: MenuItem): cint {.importcpp: "#.size(@)", header: flh_menuitem.}


proc label*(self: Image; m: Menu_Item) {.importcpp: "#.label(@)", header: "FL/Fl_Image.H".}
proc label*(self: Pixmap; m: Menu_Item) {.importcpp: "#.label(@)", header: "FL/Fl_Menu.H".}
proc label*(self: RGB_Image; m: Menu_Item) {.importcpp: "#.label(@)", header: "FL/Fl_RGB_Image.H".}

