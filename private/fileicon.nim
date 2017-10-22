
import enumerations
import widget

const
  flh_fileicon = "FL/Fl_File_Icon.H"
type
  FileIconObj* {.importc: "Fl_File_Icon", header: flh_fileicon.} = object {.inheritable.}
  FileIcon* = ptr FileIconObj

const
  ICON_COLOR* = 0xffffffff.Color

const
  FILETYPE_ANY*       = 0
  FILETYPE_PLAIN*     = 1
  FILETYPE_FIFO*      = 2
  FILETYPE_DEVICE*    = 3
  FILETYPE_LINK*      = 4
  FILETYPE_DIRECTORY* = 5

const
  FILETYPE_OPCODE_END*            = 0
  FILETYPE_OPCODE_COLOR*          = 1
  FILETYPE_OPCODE_LINE*           = 2
  FILETYPE_OPCODE_CLOSEDLINE*     = 3
  FILETYPE_OPCODE_POLYGON*        = 4
  FILETYPE_OPCODE_OUTLINEPOLYGON* = 5
  FILETYPE_OPCODE_VERTEX*         = 6

proc make_fileicon*(p: cstring; t: cint; nd: cint = 0; d: ptr cshort = nil): FileIcon {.importcpp: "new Fl_File_Icon(@)", header: flh_fileicon.}
proc free*(self: FileIcon) {.importcpp: "delete @", header: flh_fileicon.}

proc add*(self: FileIconObj; d: cshort): ptr cshort {.importcpp: "#.add(@)", header: flh_fileicon.}
proc add_color*(self: FileIconObj; c: Color): ptr cshort {.importcpp: "#.add_color(@)", header: flh_fileicon.}
proc add_vertex*(self: FileIconObj; x, y: cint): ptr cshort {.importcpp: "#.add_vertex(@)", header: flh_fileicon.}
proc add_vertex*(self: FileIconObj; x, y: cfloat): ptr cshort {.importcpp: "#.add_vertex(@)", header: flh_fileicon.}
proc clear*(self: FileIconObj) {.importcpp: "#.clear(@)", header: flh_fileicon.}
proc draw*(self: FileIconObj; x, y, w, h: cint; ic: Color; active: cint = 1) {.importcpp: "#.draw(@)", header: flh_fileicon.}
proc label*(self: FileIconObj; w: Widget) {.importcpp: "#.label(@)", header: flh_fileicon.}
proc load*(self: FileIconObj; f: cstring) {.importcpp: "#.load(@)", header: flh_fileicon.}
proc load_fti*(self: FileIconObj; fti: cstring) {.importcpp: "#.load_fti(@)", header: flh_fileicon.}
proc load_image*(self: FileIconObj; i: cstring) {.importcpp: "#.load_image(@)", header: flh_fileicon.}
proc next*(self: FileIconObj): ptr FileIcon {.importcpp: "#.next(@)", header: flh_fileicon.}
proc pattern*(self: FileIconObj): cstring {.importcpp: "#.pattern(@)", header: flh_fileicon.}
proc size*(self: FileIconObj): cint {.importcpp: "#.size(@)", header: flh_fileicon.}
proc type*(self: FileIconObj): cint {.importcpp: "#.type(@)", header: flh_fileicon.}
proc value*(self: FileIconObj): ptr cshort {.importcpp: "#.value(@)", header: flh_fileicon.}

proc fileicon_labeltype*(o: Label; x, y, w, h: cint; a: Align) {.importcpp: "Fl_File_Icon::labeltype(@)", header: flh_fileicon.}
proc fileicon_find*(filename: cstring; filetype: cint = FILETYPE_ANY): ptr FileIcon {.importcpp: "Fl_File_Icon::find(@)", header: flh_fileicon.}
proc fileicon_first*(): ptr FileIcon {.importcpp: "Fl_File_Icon::first(@)", header: flh_fileicon.}
proc fileicon_load_system_icons*() {.importcpp: "Fl_File_Icon::load_system_icons(@)", header: flh_fileicon.}

