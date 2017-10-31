
import widget

const
  flh = "FL/Fl_Group.H"

type
  GroupObj* {.importc: "Fl_Group", header: flh.} = object of WidgetObj
  Group* = ptr GroupObj

proc current*(): Group {.importcpp: "Fl_Group::current(@)".}
proc `current=`*(g: Group) {.importcpp: "Fl_Group::current(@)".}

proc make_group*(x, y, w, h: cint; text: cstring = nil): Group {.importcpp: "new Fl_Group(@)", header: flh.}

proc add*(self: Group; o: Widget) {.importcpp: "#->add(@)", header: flh.}
proc array*(self: Group): ptr Widget {.importcpp: "#->array(@)", header: flh.}
proc as_group*(self: Group): Group {.importcpp: "#->as_group(@)", header: flh.}
proc begin*(self: Group) {.importcpp: "#->begin(@)", header: flh.}
proc child*(self: Group; n: cint): Widget {.importcpp: "#->child(@)", header: flh.}
proc children*(self: Group): cint {.importcpp: "#->children(@)", header: flh.}
proc clear*(self: Group) {.importcpp: "#->clear(@)", header: flh.}
proc clip_children*(self: Group): cuint {.importcpp: "#->clip_children(@)", header: flh.}
proc clip_children*(self: Group; c: cint) {.importcpp: "#->clip_children(@)", header: flh.}
proc endd*(self: Group) {.importcpp: "#->end(@)", header: flh.}
proc find*(self: Group; w: Widget): cint {.importcpp: "#->find(@)", header: flh.}
proc focus*(self: Group; W: Widget) {.importcpp: "#->focus(@)", header: flh.}
proc forms_end*(self: Group) {.importcpp: "#->forms_end(@)", header: flh.}
proc handle*(self: Group; h: cint): cint {.importcpp: "#->handle(@)", header: flh.}
proc init_sizes*(self: Group) {.importcpp: "#->init_sizes(@)", header: flh.}
proc remove*(self: Group; index: cint) {.importcpp: "#->remove(@)", header: flh.}
proc remove*(self: Group; o: Widget) {.importcpp: "#->remove(@)", header: flh.}
proc resizable*(self: Group): Widget {.importcpp: "#->resizable(@)", header: flh.}
proc resizable*(self: Group; o: Widget) {.importcpp: "#->resizable(@)", header: flh.}
proc resize*(self: Group; X, Y, W, H: cint) {.importcpp: "#->resize(@)", header: flh.}

proc parent*(self: Widget): Group {.importcpp: "#.parent(@)", header: flh.}

const
  flh_wizard = "FL/Fl_Wizard.H"
type
  WizardObj* {.importc: "Fl_Wizard".} = object of GroupObj
  Wizard* = ptr WizardObj

proc make_wizard*(x, y, w, h: cint; text: cstring = nil): Wizard {.importcpp: "new Fl_Wizard(@)", header: flh_wizard.}

proc next*(self: Wizard) {.importcpp: "#.next(@)", header: flh_wizard.}
proc prev*(self: Wizard) {.importcpp: "#.prev(@)", header: flh_wizard.}
proc value*(self: Wizard): Widget {.importcpp: "#.value(@)", header: flh_wizard.}
proc `value=`*(self: Wizard; w: Widget) {.importcpp: "#.value(@)", header: flh_wizard.}

const
  flh_tabs = "FL/Fl_Tabs.H"

type
  TabsObj* {.importc: "Fl_Tabs".} = object of GroupObj
    tab_pos: ptr cint
    tab_width: ptr cint
    tab_count: cint
  Tabs* = ptr TabsObj

proc make_tabs*(x, y, w, h: cint; text: cstring = nil): Tabs {.importcpp: "new Fl_Wizard(@)", header: flh_tabs.}

proc value*(self: Tabs): Widget {.importcpp: "#.value(@)", header: flh_tabs.}
proc tab_positions*(self: Tabs): cint {.importcpp: "#.tab_positions(@)", header: flh_tabs.}
proc clear_tab_positions*(self: Tabs) {.importcpp: "#.clear_tab_positions(@)", header: flh_tabs.}
proc tab_height*(self: Tabs): cint {.importcpp: "#.tab_height(@)", header: flh_tabs.}
proc draw_tab*(self: Tabs; x1, x2, W, H: cint; o: Widget; sel: cint = 0) {.importcpp: "#.draw_tab(@)", header: flh_tabs.}
proc value*(self: Tabs; w: Widget): cint {.importcpp: "#.value(@)", header: flh_tabs.}
proc push*(self: Tabs): Widget {.importcpp: "#.push(@)", header: flh_tabs.}
proc push*(self: Tabs; w: Widget): cint {.importcpp: "#.push(@)", header: flh_tabs.}
proc which*(self: Tabs; event_x, event_y: cint): Widget {.importcpp: "#.which(@)", header: flh_tabs.}
proc client_area*(self: Tabs; rx, ry, rw, rh: out cint; tabh: cint = 0) {.importcpp: "#.client_area(@)", header: flh_tabs.}

const
  flh_pack = "FL/Fl_Pack.H"

  PACK_VERTICAL* = 0
  PACK_HORIZONTAL* = 1

type
  PackObj* {.importc: "Fl_Pack", header: flh_pack.} = object of GroupObj
  Pack* = ptr PackObj

proc make_Pack*(x, y, w, h: cint; text: cstring = nil): Pack {.importcpp: "new Fl_Pack(@)", header: flh_pack.}

proc spacing*(self: Pack): cint {.importcpp: "#.spacing(@)", header: flh_pack.}
proc spacing*(self: Pack; i: cint) {.importcpp: "#.spacing(@)", header: flh_pack.}
proc horizontal*(self: Pack): cuchar {.importcpp: "#.horizontal(@)", header: flh_pack.}