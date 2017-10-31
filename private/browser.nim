
import widget
import enumerations
import image
import group
import valuator
import button

const
  flh_browser2 = "FL/Fl_Browser_.H"

const
  NORMAL_BROWSER_TYPE* = 0
  SELECT_BROWSER_TYPE* = 1
  HOLD_BROWSER_TYPE*   = 2
  MULTI_BROWSER_TYPE*  = 3

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

const
  flh_filebrowser = "FL/Fl_File_Browser.H"
type
  FileBrowserObj* {.importc: "Fl_File_Browser", header: flh_filebrowser.} = object of BrowserObj
  FileBrowser* = ptr FileBrowserObj

const
  FILEBROWSER_FILES* = 0
  FILEBROWSER_DIRECTORIES* = 1

proc make_file_browser*(X, Y, W, H: cint; text: cstring = nil): FileBrowser {.importcpp: "new Fl_File_Browser(@)", header: flh_filebrowser.}

proc iconsize*(): cuchar {.importcpp: "#.iconsize(@)", header: flh_filebrowser.}
proc `iconsize=`*(s: cuchar) {.importcpp: "#.iconsize(@)", header: flh_filebrowser.}
proc `filter=`*(pattern: cstring) {.importcpp: "#.filter(@)", header: flh_filebrowser.}
proc filter*(): cstring {.importcpp: "#.filter(@)", header: flh_filebrowser.}
proc load*(directory: cstring): cint {.importcpp: "#.load(@)", header: flh_filebrowser.}
#TODO proc load*(directory: cstring; sort: FileSortF = fl_numericsort): cint {.importcpp: "#.load(@)", header: flh_filebrowser.}
proc textsize*(): Fontsize {.importcpp: "#.textsize(@)", header: flh_filebrowser.}
proc `textsize=`*(s: Fontsize) {.importcpp: "#.textsize(@)", header: flh_filebrowser.}
proc filetype*(): cint {.importcpp: "#.filetype(@)", header: flh_filebrowser.}
proc `filetype=`*(t: cint) {.importcpp: "#.filetype(@)", header: flh_filebrowser.}

const
  flh_filechooser = "FL/Fl_File_Chooser.H"
type
  FileChooserObj* {.importc: "Fl_File_Chooser", header: flh_filechooser.} = object {.inheritable.}
    newButton*: Button
    previewButton*, showHiddenButton*: CheckButton
  FileChooser* = ptr FileChooserObj

const
  FILECHOOSER_SINGLE* = 0
  FILECHOOSER_MULTI* = 1
  FILECHOOSER_CREATE* = 2
  FILECHOOSER_DIRECTORY* = 4

proc make_file_chooser*(d, p: cstring; t: cint; title: cstring): FileChooser {.importcpp: "new Fl_File_Chooser(@)", header: flh_filechooser.}
proc free*(self: FileChooser) {.importcpp: "delete @", header: flh_filechooser.}

proc callback*(self: FileChooser; cb: proc(fc: FileChooser; d: pointer); d: pointer = nil) {.importcpp: "#.callback(@)", header: flh_filechooser.}
proc `color=`*(self: FileChooser; c: Color) {.importcpp: "#.color(@)", header: flh_filechooser.}
proc color*(self: FileChooser): Color {.importcpp: "#.color(@)", header: flh_filechooser.}
proc count*(self: FileChooser): cint {.importcpp: "#.count(@)", header: flh_filechooser.}
proc `directory=`*(self: FileChooser; dir: cstring) {.importcpp: "#.directory(@)", header: flh_filechooser.}
proc directory*(self: FileChooser): cstring {.importcpp: "#.directory(@)", header: flh_filechooser.}
proc `filter=`*(self: FileChooser; text: cstring) {.importcpp: "#.filter(@)", header: flh_filechooser.}
proc filter*(self: FileChooser): cstring {.importcpp: "#.filter(@)", header: flh_filechooser.}
proc filter_value*(self: FileChooser): cint {.importcpp: "#.filter_value(@)", header: flh_filechooser.}
proc `filter_value=`*(self: FileChooser; f: cint) {.importcpp: "#.filter_value(@)", header: flh_filechooser.}
proc hide*(self: FileChooser) {.importcpp: "#.hide(@)", header: flh_filechooser.}
proc `iconsize=`*(self: FileChooser; s: cuchar) {.importcpp: "#.iconsize(@)", header: flh_filechooser.}
proc iconsize*(self: FileChooser): cuchar {.importcpp: "#.iconsize(@)", header: flh_filechooser.}
proc `label=`*(self: FileChooser; text: cstring) {.importcpp: "#.label(@)", header: flh_filechooser.}
proc label*(self: FileChooser): cstring {.importcpp: "#.label(@)", header: flh_filechooser.}
proc `ok_label=`*(self: FileChooser; text: cstring) {.importcpp: "#.ok_label(@)", header: flh_filechooser.}
proc ok_label*(self: FileChooser): cstring {.importcpp: "#.ok_label(@)", header: flh_filechooser.}
proc `preview=`*(self: FileChooser; e: cint) {.importcpp: "#.preview(@)", header: flh_filechooser.}
proc preview*(self: FileChooser): cint {.importcpp: "#.preview(@)", header: flh_filechooser.}
proc rescan*(self: FileChooser) {.importcpp: "#.rescan(@)", header: flh_filechooser.}
proc rescan_keep_filename*(self: FileChooser) {.importcpp: "#.rescan_keep_filename(@)", header: flh_filechooser.}
proc show*(self: FileChooser) {.importcpp: "#.show(@)", header: flh_filechooser.}
proc shown*(self: FileChooser): cint {.importcpp: "#.shown(@)", header: flh_filechooser.}
proc `textcolor=`*(self: FileChooser; c: Color) {.importcpp: "#.textcolor(@)", header: flh_filechooser.}
proc textcolor*(self: FileChooser): Color {.importcpp: "#.textcolor(@)", header: flh_filechooser.}
proc `textfont=`*(self: FileChooser; f: Font) {.importcpp: "#.textfont(@)", header: flh_filechooser.}
proc textfont*(self: FileChooser): Font {.importcpp: "#.textfont(@)", header: flh_filechooser.}
proc `textsize=`*(self: FileChooser; s: Fontsize) {.importcpp: "#.textsize(@)", header: flh_filechooser.}
proc textsize*(self: FileChooser): Fontsize {.importcpp: "#.textsize(@)", header: flh_filechooser.}
proc `type=`*(self: FileChooser; t: cint) {.importcpp: "#.type(@)", header: flh_filechooser.}
proc `type`*(self: FileChooser): cint {.importcpp: "#.type(@)", header: flh_filechooser.}
proc user_data*(self: FileChooser): pointer {.importcpp: "#.user_data(@)", header: flh_filechooser.}
proc `user_data=`*(self: FileChooser; d: pointer) {.importcpp: "#.user_data(@)", header: flh_filechooser.}
proc value*(self: FileChooser; f: cint = 1): cstring {.importcpp: "#.value(@)", header: flh_filechooser.}
proc `value=`*(self: FileChooser; filename: cstring) {.importcpp: "#.value(@)", header: flh_filechooser.}
proc visible*(self: FileChooser): cint {.importcpp: "#.visible(@)", header: flh_filechooser.}
proc add_extra*(self: FileChooser; gr: Widget): Widget {.importcpp: "#.add_extra(@)", header: flh_filechooser.}

var filechooser_add_favorites_label* {.importcpp: "Fl_File_Chooser::add_favorites_label", header: flh_filechooser.}: cstring
var filechooser_all_files_label* {.importcpp: "Fl_File_Chooser::all_files_label", header: flh_filechooser.}: cstring
var filechooser_custom_filter_label* {.importcpp: "Fl_File_Chooser::custom_filter_label", header: flh_filechooser.}: cstring
var filechooser_existing_file_label* {.importcpp: "Fl_File_Chooser::existing_file_label", header: flh_filechooser.}: cstring
var filechooser_favorites_label* {.importcpp: "Fl_File_Chooser::favorites_label", header: flh_filechooser.}: cstring
var filechooser_filename_label* {.importcpp: "Fl_File_Chooser::filename_label", header: flh_filechooser.}: cstring
var filechooser_filesystems_label* {.importcpp: "Fl_File_Chooser::filesystems_label", header: flh_filechooser.}: cstring
var filechooser_manage_favorites_label* {.importcpp: "Fl_File_Chooser::manage_favorites_label", header: flh_filechooser.}: cstring
var filechooser_new_directory_label* {.importcpp: "Fl_File_Chooser::new_directory_label", header: flh_filechooser.}: cstring
var filechooser_new_directory_tooltip* {.importcpp: "Fl_File_Chooser::new_directory_tooltip", header: flh_filechooser.}: cstring
var filechooser_preview_label* {.importcpp: "Fl_File_Chooser::preview_label", header: flh_filechooser.}: cstring
var filechooser_save_label* {.importcpp: "Fl_File_Chooser::save_label", header: flh_filechooser.}: cstring
var filechooser_show_label* {.importcpp: "Fl_File_Chooser::show_label", header: flh_filechooser.}: cstring
var filechooser_hidden_label* {.importcpp: "Fl_File_Chooser::hidden_label", header: flh_filechooser.}: cstring
#TODO var filechooser_sort* {.importcpp: "Fl_File_Chooser::sort", header: flh_filechooser.}: FileSortF

proc fl_dir_chooser*(message, fname: cstring; relative: cint = 0): cstring {.importcpp: "fl_dir_chooser(@)", header: flh_filechooser.}
proc fl_file_chooser*(message, pat, fname: cstring; relative: cint = 0): cstring {.importcpp: "fl_file_chooser(@)", header: flh_filechooser.}
proc fl_file_chooser_callback*(cb: proc(c: cstring)) {.importcpp: "fl_file_chooser_callback(@)", header: flh_filechooser.}
proc fl_file_chooser_ok_label*(text: cstring) {.importcpp: "fl_file_chooser_ok_label(@)", header: flh_filechooser.}

const
  flh_holdbrowser = "FL/Fl_Hold_Browser.H"
type
  HoldBrowserObj* {.importc: "Fl_Hold_Browser", header: flh_holdbrowser.} = object of BrowserObj
  HoldBrowser* = ptr HoldBrowserObj

proc make_HoldBrowser*(x, y, w, h: cint; text: cstring = nil): HoldBrowser {.importcpp: "new Fl_Hold_Browser(@)", header: flh_holdbrowser.}

const
  flh_multibrowser = "FL/Fl_Multi_Browser.H"
type
  MultiBrowserObj* {.importc: "Fl_Multi_Browser", header: flh_multibrowser.} = object of BrowserObj
  MultiBrowser* = ptr MultiBrowserObj

proc make_MultiBrowser*(x, y, w, h: cint; text: cstring = nil): MultiBrowser {.importcpp: "new Fl_Multi_Browser(@)", header: flh_multibrowser.}
