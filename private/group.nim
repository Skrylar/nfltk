
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
  WizardObj* {.importc: "Fl_Wizard".} = object of Group
  Wizard* = ptr WizardObj

proc make_wizard*(x, y, w, h: cint; text: cstring = nil): Wizard {.importcpp: "new Fl_Wizard(@)", header: flh_wizard.}

proc next*(self: Wizard) {.importcpp: "#.next(@)", header: flh_wizard.}
proc prev*(self: Wizard) {.importcpp: "#.prev(@)", header: flh_wizard.}
proc value*(self: Wizard): Widget {.importcpp: "#.value(@)", header: flh_wizard.}
proc value*(self: Wizard; w: Widget) {.importcpp: "#.value(@)", header: flh_wizard.}

