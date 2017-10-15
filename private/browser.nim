
import enumerations
import image
import group
import valuator

const
  flh_browser2 = "FL/Fl_Browser_.H"

const
  NORMAL_BROWSER* = 0
  SELECT_BROWSER* = 1
  HOLD_BROWSER*   = 2
  MULTI_BROWSER*  = 3

const
  SORT_ASCENDING*  = 0
  SORT_DESCENDING* = 1

# Anonymous enum bit flags for has_scrollbar().
 # -  bit 0: horizontal
 # -  bit 1: vertical
 # -  bit 2: 'always' (to be combined with bits 0 and 1)
 # -  bit 3-31: reserved for future use

const
  BROWSER_SCROLL_HORIZONTAL* = 1
  BROWSER_SCROLL_VERTICAL* = 2
  BROWSER_SCROLL_BOTH* = 3
  BROWSER_SCROLL_ALWAYS_ON* = 4
  BROWSER_SCROLL_HORIZONTAL_ALWAYS* = 5
  BROWSER_SCROLL_VERTICAL_ALWAYS* = 6
  BROWSER_SCROLL_BOTH_ALWAYS* = 7

type
  BrowserXObj {.importc: "Fl_Browser_", header: flh_browser2.} = object of GroupObj
    scrollbar*, hscrollbar*: Scrollbar
  BrowserX = ptr BrowserXObj

proc select*(self: BrowserX; item: pointer; val: cint = 1; docallbacks: cint = 0): cint {.importcpp: "#.select(@)", header: flh_browser2.}
proc select_only*(self: BrowserX; item: pointer; docallbacks: cint = 0): cint {.importcpp: "#.select_only(@)", header: flh_browser2.}
proc deselect*(self: BrowserX; docallbacks: cint = 0): cint {.importcpp: "#.deselect(@)", header: flh_browser2.}
proc position*(self: BrowserX): cint {.importcpp: "#.position(@)", header: flh_browser2.}
proc `position=`*(self: BrowserX; pos: cint) {.importcpp: "#.position(@)", header: flh_browser2.}
proc hposition*(self: BrowserX): cint {.importcpp: "#.hposition(@)", header: flh_browser2.}
proc `hposition=`*(self: BrowserX; pos: cint) {.importcpp: "#.hposition(@)", header: flh_browser2.}
proc display*(self: BrowserX; item: pointer) {.importcpp: "#.display(@)", header: flh_browser2.}
proc has_scrollbar*(self: BrowserX): cuchar {.importcpp: "#.has_scrollbar(@)", header: flh_browser2.}
proc `has_scrollbar=`*(self: BrowserX; mode: cuchar) {.importcpp: "#.has_scrollbar(@)", header: flh_browser2.}
proc textfont*(self: BrowserX): Font {.importcpp: "#.textfont(@)", header: flh_browser2.}
proc `textfont=`*(self: BrowserX; font: Font) {.importcpp: "#.textfont(@)", header: flh_browser2.}
proc textsize*(self: BrowserX): Fontsize {.importcpp: "#.textsize(@)", header: flh_browser2.}
proc `textsize=`*(self: BrowserX; newSize: Fontsize) {.importcpp: "#.textsize(@)", header: flh_browser2.}
proc textcolor*(self: BrowserX): Color {.importcpp: "#.textcolor(@)", header: flh_browser2.}
proc `textcolor=`*(self: BrowserX; col: Color) {.importcpp: "#.textcolor(@)", header: flh_browser2.}
proc scrollbar_size*(self: BrowserX): cint {.importcpp: "#.scrollbar_size(@)", header: flh_browser2.}
proc `scrollbar_size=`*(self: BrowserX; newSize: cint) {.importcpp: "#.scrollbar_size(@)", header: flh_browser2.}
proc scrollbar_width*(self: BrowserX): cint {.importcpp: "#.scrollbar_width(@)", header: flh_browser2.}
proc `scrollbar_width=`*(self: BrowserX; width: cint) {.importcpp: "#.scrollbar_width(@)", header: flh_browser2.}
proc scrollbar_right*(self: BrowserX) {.importcpp: "#.scrollbar_right(@)", header: flh_browser2.}
proc scrollbar_left*(self: BrowserX) {.importcpp: "#.scrollbar_left(@)", header: flh_browser2.}
proc sort*(self: BrowserX; flags: cint = 0) {.importcpp: "#.sort(@)", header: flh_browser2.}

const
  flh_browser = "FL/Fl_Browser.H"
type
  BrowserObj* {.importc: "Fl_Browser", header: flh_browser.} = object of BrowserXObj
  Browser* = ptr BrowserObj

type
  LinePosition* = cint
const
  LINE_TOP* = 0
  LINE_BOTTOM* = 1
  LINE_MIDDLE* = 2

proc make_browser*(X, Y, W, H: cint; text: cstring = nil): Browser {.importcpp: "new Fl_Browser(@)", header: flh_browser.}

proc remove*(self: Browser; line: cint) {.importcpp: "#.remove(@)", header: flh_browser.}
proc add*(self: Browser; newtext: cstring; d: pointer = nil) {.importcpp: "#.add(@)", header: flh_browser.}
proc insert*(self: Browser; line: cint; newtext: cstring; d: pointer = nil) {.importcpp: "#.insert(@)", header: flh_browser.}
proc move*(self: Browser; to, `from`: cint) {.importcpp: "#.move(@)", header: flh_browser.}
proc load*(self: Browser; filename: cstring): cint {.importcpp: "#.load(@)", header: flh_browser.}
proc swap*(self: Browser; a, b: cstring) {.importcpp: "#.swap(@)", header: flh_browser.}
proc clear*(self: Browser) {.importcpp: "#.clear(@)", header: flh_browser.}
proc size*(self: Browser): cint {.importcpp: "#.size(@)", header: flh_browser.}
proc size*(self: Browser; W, H: cint) {.importcpp: "#.size(@)", header: flh_browser.}
proc textsize*(self: Browser): Fontsize {.importcpp: "#.textsize(@)", header: flh_browser.}
proc `textsize=`*(self: Browser; newSize: Fontsize) {.importcpp: "#.textsize(@)", header: flh_browser.}
proc topline*(self: Browser): cint {.importcpp: "#.topline(@)", header: flh_browser.}
proc lineposition*(self: Browser; line: cint; pos: LinePosition) {.importcpp: "#.lineposition(@)", header: flh_browser.}
proc topline*(self: Browser; line: cint) {.importcpp: "#.topline(@)", header: flh_browser.}
proc bottomline*(self: Browser; line: cint) {.importcpp: "#.bottomline(@)", header: flh_browser.}
proc middleline*(self: Browser; line: cint) {.importcpp: "#.middleline(@)", header: flh_browser.}
proc select*(self: Browser; line: cint; val: cint = 1): cint {.importcpp: "#.select(@)", header: flh_browser.}
proc selected*(self: Browser; line: cint): cint {.importcpp: "#.selected(@)", header: flh_browser.}
proc show*(self: Browser; line: cint) {.importcpp: "#.show(@)", header: flh_browser.}
proc show*(self: Browser) {.importcpp: "#.show(@)", header: flh_browser.}
proc hide*(self: Browser; line: cint) {.importcpp: "#.hide(@)", header: flh_browser.}
proc hide*(self: Browser) {.importcpp: "#.hide(@)", header: flh_browser.}
proc visible*(self: Browser; line: cint): cint {.importcpp: "#.visible(@)", header: flh_browser.}
proc value*(self: Browser): cint {.importcpp: "#.value(@)", header: flh_browser.}
proc value*(self: Browser; line: cint) {.importcpp: "#.value(@)", header: flh_browser.}
proc text*(self: Browser; line: cint): cstring {.importcpp: "#.text(@)", header: flh_browser.}
proc text*(self: Browser; line: cint; newtext: cstring) {.importcpp: "#.text(@)", header: flh_browser.}
proc data*(self: Browser; line: cint) {.importcpp: "#.data(@)", header: flh_browser.}
proc data*(self: Browser; line: cint; d: pointer) {.importcpp: "#.data(@)", header: flh_browser.}
proc format_char*(self: Browser): cchar {.importcpp: "#.format_char(@)", header: flh_browser.}
proc `format_char=`*(self: Browser; c: cchar) {.importcpp: "#.format_char(@)", header: flh_browser.}
proc column_char*(self: Browser): cchar {.importcpp: "#.column_char(@)", header: flh_browser.}
proc `column_char=`*(self: Browser; c: cchar) {.importcpp: "#.column_char(@)", header: flh_browser.}
proc column_widths*(self: Browser): ptr cint {.importcpp: "#.column_widths(@)", header: flh_browser.}
proc `column_widths=`*(self: Browser; arr: ptr cint) {.importcpp: "#.column_widths(@)", header: flh_browser.}
proc displayed*(self: Browser; line: cint): cint {.importcpp: "#.displayed(@)", header: flh_browser.}
proc make_visible*(self: Browser; line: cint) {.importcpp: "#.make_visible(@)", header: flh_browser.}
proc icon*(self: Browser; line: cint; icon: Image) {.importcpp: "#.icon(@)", header: flh_browser.}
proc icon*(self: Browser; line: cint): Image {.importcpp: "#.icon(@)", header: flh_browser.}
proc remove_icon*(self: Browser; line: cint) {.importcpp: "#.remove_icon(@)", header: flh_browser.}
proc replace*(self: Browser; a: cint; b: cstring) {.importcpp: "#.replace(@)", header: flh_browser.}
proc display*(self: Browser; line: cint; val: cint = 1) {.importcpp: "#.display(@)", header: flh_browser.}

