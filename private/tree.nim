
import widget
import enumerations
import group
import image

# tree prefs
const
  flh_prefs = "FL/Fl_Tree_Prefs.H"
  flh_treeitem = "FL/Fl_Tree_Item.H"
  flh_tree = "FL/Fl_Tree.H"

type
  TreeSort* = cint
const
  TREE_SORT_NONE*       = 0
  TREE_SORT_ASCENDING*  = 1
  TREE_SORT_DESCENDING* = 2

type
  TreeConnector* = cint
const
  TREE_CONNECTOR_NONE*   = 0
  TREE_CONNECTOR_DOTTED* = 1
  TREE_CONNECTOR_SOLID*  = 2

type
  TreeSelect* = cint
const
  TREE_SELECT_NONE*             = 0
  TREE_SELECT_SINGLE*           = 1
  TREE_SELECT_MULTI*            = 2
  TREE_SELECT_SINGLE_DRAGGABLE* = 3

type
  TreeItemReselectMode* = cint
const
  TREE_SELECTABLE_ONCE*   = 0
  TREE_SELECTABLE_ALWAYS* = 1

type
  TreeItemDrawMode* = cint
const
  TREE_ITEM_DRAW_DEFAULT*          = 0
  TREE_ITEM_DRAW_LABEL_AND_WIDGET* = 1
  TREE_ITEM_HEIGHT_FROM_WIDGET*    = 2

type
  TreeItemFlags* = cint
const
  TREE_ITEM_OPEN*     = 1 shl 0
  TREE_ITEM_VISIBLE*  = 1 shl 1
  TREE_ITEM_ACTIVE*   = 1 shl 2
  TREE_ITEM_SELECTED* = 1 shl 3

type
  TreeReason* = cint
const
  TREE_REASON_NONE*       = 0
  TREE_REASON_SELECTED*   = 1
  TREE_REASON_DESELECTED* = 2
  TREE_REASON_RESELECTED* = 3
  TREE_REASON_OPENED*     = 4
  TREE_REASON_CLOSED*     = 5
  TREE_REASON_DRAGGED*    = 6

type
  TreePrefsObj* {.importc: "Fl_Tree_Prefs", header: flh_prefs.} = object
  TreePrefs* = ptr TreePrefsObj

  TreeItemObj* {.importc: "Fl_Tree_Item", header: flh_treeitem.} = object
  TreeItem* = ptr TreeItemObj

  TreeObj* {.importc: "Fl_Tree", header: flh_tree.} = object of GroupObj
  Tree* = ptr TreeObj

  TreeItemDrawCallback* = proc(a: TreeItem; b: pointer);

# tree procs

proc make_tree*(X, Y, W, H: cint; text: cstring = nil): Tree {.importcpp: "new Fl_Tree(@)", header: flh_tree.}

proc draw*() {.importcpp: "#.draw(@)", header: flh_tree.}
proc show_self*() {.importcpp: "#.show_self(@)", header: flh_tree.}
proc resize*(x, y, w, h: cint) {.importcpp: "#.resize(@)", header: flh_tree.}
proc root_label*(new_label: cstring) {.importcpp: "#.root_label(@)", header: flh_tree.}
proc root*(): TreeItem {.importcpp: "#.root(@)", header: flh_tree.}
proc `root=`*(newitem: TreeItem) {.importcpp: "#.root(@)", header: flh_tree.}
proc add*(path: cstring; newitem: TreeItem = nil): TreeItem {.importcpp: "#.add(@)", header: flh_tree.}
proc add*(parent_item: TreeItem; name: cstring): TreeItem {.importcpp: "#.add(@)", header: flh_tree.}
proc insert_above*(above: TreeItem; name: cstring): TreeItem {.importcpp: "#.insert_above(@)", header: flh_tree.}
proc insert*(item: TreeItem; name: cstring; pos: cint): TreeItem {.importcpp: "#.insert(@)", header: flh_tree.}
proc remove*(item: TreeItem): cint {.importcpp: "#.remove(@)", header: flh_tree.}
proc clear*() {.importcpp: "#.clear(@)", header: flh_tree.}
proc clear_children*(item: TreeItem) {.importcpp: "#.clear_children(@)", header: flh_tree.}
proc find_item*(path: cstring): TreeItem {.importcpp: "#.find_item(@)", header: flh_tree.}
proc item_pathname*(pathname: cstring; pathnamelen: cstring; item: TreeItem): cint {.importcpp: "#.item_pathname(@)", header: flh_tree.}
proc find_clicked*(yonly: cint = 0): TreeItem {.importcpp: "#.find_clicked(@)", header: flh_tree.}
proc item_clicked*(): TreeItem {.importcpp: "#.item_clicked(@)", header: flh_tree.}
proc first*(): TreeItem {.importcpp: "#.first(@)", header: flh_tree.}
proc first_visible*(): TreeItem {.importcpp: "#.first_visible(@)", header: flh_tree.}
proc first_visible_item*(): TreeItem {.importcpp: "#.first_visible_item(@)", header: flh_tree.}
proc next*(item: TreeItem = nil): TreeItem {.importcpp: "#.next(@)", header: flh_tree.}
proc prev*(item: TreeItem = nil): TreeItem {.importcpp: "#.prev(@)", header: flh_tree.}
proc last*(): TreeItem {.importcpp: "#.last(@)", header: flh_tree.}
proc last_visible*(): TreeItem {.importcpp: "#.last_visible(@)", header: flh_tree.}
proc last_visible_item*(): TreeItem {.importcpp: "#.last_visible_item(@)", header: flh_tree.}
proc next_visible_item*(start: TreeItem; dir: cint): TreeItem {.importcpp: "#.next_visible_item(@)", header: flh_tree.}
proc first_selected_item*(): TreeItem {.importcpp: "#.first_selected_item(@)", header: flh_tree.}
proc last_selected_item*(): TreeItem {.importcpp: "#.last_selected_item(@)", header: flh_tree.}
proc next_item*(item: TreeItem; dir: cint = Fl_Down; visible: bool = false): TreeItem {.importcpp: "#.next_item(@)", header: flh_tree.}
proc next_selected_item*(item: TreeItem = nil; dir: cint = Fl_Down): TreeItem {.importcpp: "#.next_selected_item(@)", header: flh_tree.}
# TODO get_selected_items(Fl_Tree_Item_Array &ret_items): cint
proc open*(item: TreeItem; docallback: cint = 1): cint {.importcpp: "#.open(@)", header: flh_tree.}
proc open*(path: cstring; docallback: cint = 1): cint {.importcpp: "#.open(@)", header: flh_tree.}
proc open_toggle*(item: TreeItem; docallback: cint = 1) {.importcpp: "#.open_toggle(@)", header: flh_tree.}
proc close*(item: TreeItem; docallback: cint = 1): cint {.importcpp: "#.close(@)", header: flh_tree.}
proc close*(path: cstring; docallback: cint = 1): cint {.importcpp: "#.close(@)", header: flh_tree.}
proc is_open*(item: TreeItem): cint {.importcpp: "#.is_open(@)", header: flh_tree.}
proc is_open*(path: cstring): cint {.importcpp: "#.is_open(@)", header: flh_tree.}
proc is_close*(item: TreeItem): cint {.importcpp: "#.is_close(@)", header: flh_tree.}
proc is_close*(path: cstring): cint {.importcpp: "#.is_close(@)", header: flh_tree.}
proc select*(item: TreeItem; docallback: cint = 1): cint {.importcpp: "#.select(@)", header: flh_tree.}
proc select*(path: cstring; docallback: cint = 1): cint {.importcpp: "#.select(@)", header: flh_tree.}
proc select_toggle*(item: TreeItem; docallback: cint = 1) {.importcpp: "#.select_toggle(@)", header: flh_tree.}
proc deselect*(item: TreeItem; docallback: cint = 1): cint {.importcpp: "#.deselect(@)", header: flh_tree.}
proc deselect*(path: cstring; docallback: cint = 1): cint {.importcpp: "#.deselect(@)", header: flh_tree.}
proc deselect_all*(item: TreeItem = nil; docallback: cint = 1): cint {.importcpp: "#.deselect_all(@)", header: flh_tree.}
proc select_only*(selitem: TreeItem; docallback: cint = 1): cint {.importcpp: "#.select_only(@)", header: flh_tree.}
proc select_all*(item: TreeItem = nil; docallback: cint = 1): cint {.importcpp: "#.select_all(@)", header: flh_tree.}
proc extend_selection_dir*(`from`, to: TreeItem; dir, val: cint; visible: bool): cint {.importcpp: "#.extend_selection_dir(@)", header: flh_tree.}
proc extend_selection*(`from`, to: TreeItem; val: cint = 1; visible: bool = false): cint {.importcpp: "#.extend_selection(@)", header: flh_tree.}
proc `item_focus=`*(item: TreeItem) {.importcpp: "#.set_item_focus(@)", header: flh_tree.}
proc item_focus*(): TreeItem {.importcpp: "#.get_item_focus(@)", header: flh_tree.}
proc is_selected*(item: TreeItem): cint {.importcpp: "#.is_selected(@)", header: flh_tree.}
proc is_selected*(path: cstring): cint {.importcpp: "#.is_selected(@)", header: flh_tree.}
proc item_labelfont*(): Font {.importcpp: "#.item_labelfont(@)", header: flh_tree.}
proc `item_labelfont=`*(val: Font) {.importcpp: "#.item_labelfont(@)", header: flh_tree.}
proc item_labelsize*(): Fontsize {.importcpp: "#.item_labelsize(@)", header: flh_tree.}
proc `item_labelsize=`*(val: Fontsize) {.importcpp: "#.item_labelsize(@)", header: flh_tree.}
proc item_labelfgcolor*(): Color {.importcpp: "#.item_labelfgcolor(@)", header: flh_tree.}
proc `item_labelfgcolor=`*(val: Color) {.importcpp: "#.item_labelfgcolor(@)", header: flh_tree.}
proc item_labelbgcolor*(): Color {.importcpp: "#.item_labelbgcolor(@)", header: flh_tree.}
proc `item_labelbgcolor=`*(val: Color) {.importcpp: "#.item_labelbgcolor(@)", header: flh_tree.}
proc connectorcolor*(): Color {.importcpp: "#.connectorcolor(@)", header: flh_tree.}
proc `connectorcolor=`*(val: Color) {.importcpp: "#.connectorcolor(@)", header: flh_tree.}
proc marginleft*(): cint {.importcpp: "#.marginleft(@)", header: flh_tree.}
proc `marginleft=`*(val: cint) {.importcpp: "#.marginleft(@)", header: flh_tree.}
proc margintop*(): cint {.importcpp: "#.margintop(@)", header: flh_tree.}
proc `margintop=`*(val: cint) {.importcpp: "#.margintop(@)", header: flh_tree.}
proc marginbottom*(): cint {.importcpp: "#.marginbottom(@)", header: flh_tree.}
proc `marginbottom=`*(val: cint) {.importcpp: "#.marginbottom(@)", header: flh_tree.}
proc linespacing*(): cint {.importcpp: "#.linespacing(@)", header: flh_tree.}
proc `linespacing=`*(val: cint) {.importcpp: "#.linespacing(@)", header: flh_tree.}
proc openchild_marginbottom*(): cint {.importcpp: "#.openchild_marginbottom(@)", header: flh_tree.}
proc `openchild_marginbottom=`*(val: cint) {.importcpp: "#.openchild_marginbottom(@)", header: flh_tree.}
proc usericonmarginleft*(): cint {.importcpp: "#.usericonmarginleft(@)", header: flh_tree.}
proc `usericonmarginleft=`*(val: cint) {.importcpp: "#.usericonmarginleft(@)", header: flh_tree.}
proc labelmarginleft*(): cint {.importcpp: "#.labelmarginleft(@)", header: flh_tree.}
proc `labelmarginleft=`*(val: cint) {.importcpp: "#.labelmarginleft(@)", header: flh_tree.}
proc widgetmarginleft*(): cint {.importcpp: "#.widgetmarginleft(@)", header: flh_tree.}
proc `widgetmarginleft=`*(val: cint) {.importcpp: "#.widgetmarginleft(@)", header: flh_tree.}
proc connectorwidth*(): cint {.importcpp: "#.connectorwidth(@)", header: flh_tree.}
proc `connectorwidth=`*(val: cint) {.importcpp: "#.connectorwidth(@)", header: flh_tree.}
proc usericon*(): Image {.importcpp: "#.usericon(@)", header: flh_tree.}
proc `usericon=`*(val: Image) {.importcpp: "#.usericon(@)", header: flh_tree.}
proc openicon*(): Image {.importcpp: "#.openicon(@)", header: flh_tree.}
proc `openicon=`*(val: Image) {.importcpp: "#.openicon(@)", header: flh_tree.}
proc closeicon*(): Image {.importcpp: "#.closeicon(@)", header: flh_tree.}
proc `closeicon=`*(val: Image) {.importcpp: "#.closeicon(@)", header: flh_tree.}
proc showcollapse*(): cint {.importcpp: "#.showcollapse(@)", header: flh_tree.}
proc `showcollapse=`*(val: cint) {.importcpp: "#.showcollapse(@)", header: flh_tree.}
proc showroot*(): cint {.importcpp: "#.showroot(@)", header: flh_tree.}
proc `showroot=`*(val: cint) {.importcpp: "#.showroot(@)", header: flh_tree.}
proc connectorstyle*(): TreeConnector {.importcpp: "#.connectorstyle(@)", header: flh_tree.}
proc `connectorstyle=`*(val: TreeConnector) {.importcpp: "#.connectorstyle(@)", header: flh_tree.}
proc sortorder*(): TreeSort {.importcpp: "#.sortorder(@)", header: flh_tree.}
proc `sortorder=`*(val: TreeSort) {.importcpp: "#.sortorder(@)", header: flh_tree.}
proc selectbox*(): Boxtype {.importcpp: "#.selectbox(@)", header: flh_tree.}
proc `selectbox=`*(val: Boxtype) {.importcpp: "#.selectbox(@)", header: flh_tree.}
proc selectmode*(): TreeSelect {.importcpp: "#.selectmode(@)", header: flh_tree.}
proc `selectmode=`*(val: TreeSelect) {.importcpp: "#.selectmode(@)", header: flh_tree.}
proc item_reselect_mode*(): TreeItemReselectMode {.importcpp: "#.item_reselect_mode(@)", header: flh_tree.}
proc `item_reselect_mode=`*(mode: TreeItemReselectMode) {.importcpp: "#.item_reselect_mode(@)", header: flh_tree.}
proc item_draw_mode*(): TreeItemDrawMode {.importcpp: "#.item_draw_mode(@)", header: flh_tree.}
proc `item_draw_mode=`*(mode: cint) {.importcpp: "#.item_draw_mode(@)", header: flh_tree.}
proc calc_dimensions*() {.importcpp: "#.calc_dimensions(@)", header: flh_tree.}
proc calc_tree*() {.importcpp: "#.calc_tree(@)", header: flh_tree.}
proc recalc_tree*() {.importcpp: "#.recalc_tree(@)", header: flh_tree.}
proc displayed*(item: TreeItem): cint {.importcpp: "#.displayed(@)", header: flh_tree.}
proc show_item*(item: TreeItem; yoff: cint) {.importcpp: "#.show_item(@)", header: flh_tree.}
proc show_item*(item: TreeItem) {.importcpp: "#.show_item(@)", header: flh_tree.}
proc show_item_top*(item: TreeItem) {.importcpp: "#.show_item_top(@)", header: flh_tree.}
proc show_item_middle*(item: TreeItem) {.importcpp: "#.show_item_middle(@)", header: flh_tree.}
proc show_item_bottom*(item: TreeItem) {.importcpp: "#.show_item_bottom(@)", header: flh_tree.}
proc display*(item: TreeItem) {.importcpp: "#.display(@)", header: flh_tree.}
proc vposition*(): cint {.importcpp: "#.vposition(@)", header: flh_tree.}
proc `vposition=`*(pos: cint) {.importcpp: "#.vposition(@)", header: flh_tree.}
proc hposition*(): cint {.importcpp: "#.hposition(@)", header: flh_tree.}
proc `hposition=`*(pos: cint) {.importcpp: "#.hposition(@)", header: flh_tree.}
proc is_scrollbar*(w: Widget): cint {.importcpp: "#.is_scrollbar(@)", header: flh_tree.}
proc scrollbar_size*(): cint {.importcpp: "#.scrollbar_size(@)", header: flh_tree.}
proc `scrollbar_size=`*(size: cint) {.importcpp: "#.scrollbar_size(@)", header: flh_tree.}
proc is_vscroll_visible*(): cint {.importcpp: "#.is_vscroll_visible(@)", header: flh_tree.}
proc is_hscroll_visible*(): cint {.importcpp: "#.is_hscroll_visible(@)", header: flh_tree.}
proc `callback_item=`*(item: TreeItem) {.importcpp: "#.callback_item(@)", header: flh_tree.}
proc callback_item*(): TreeItem {.importcpp: "#.callback_item(@)", header: flh_tree.}
proc `callback_reason=`*(reason: TreeReason) {.importcpp: "#.callback_reason(@)", header: flh_tree.}
proc callback_reason*(): TreeReason {.importcpp: "#.callback_reason(@)", header: flh_tree.}
proc prefs*(): TreePrefs {.importcpp: "reinterpret_cast<Fl_Tree_Prefs*>(#.prefs(@))", header: flh_treeitem.}
# TODO load(class Fl_Preferences&)

# tree item procs

proc make_tree_item*(t: Tree): TreeItem {.importcpp: "new Fl_Tree_Item(@)", header: flh_treeitem.}
proc make_tree_item*(t: TreeItem): TreeItem {.importcpp: "new Fl_Tree_Item(@)", header: flh_treeitem.}

proc x*(self: TreeItem): cint {.importcpp: "#.x(@)", header: flh_treeitem.}
proc y*(self: TreeItem): cint {.importcpp: "#.y(@)", header: flh_treeitem.}
proc w*(self: TreeItem): cint {.importcpp: "#.w(@)", header: flh_treeitem.}
proc h*(self: TreeItem): cint {.importcpp: "#.h(@)", header: flh_treeitem.}
proc label_x*(self: TreeItem): cint {.importcpp: "#.label_x(@)", header: flh_treeitem.}
proc label_y*(self: TreeItem): cint {.importcpp: "#.label_y(@)", header: flh_treeitem.}
proc label_w*(self: TreeItem): cint {.importcpp: "#.label_w(@)", header: flh_treeitem.}
proc label_h*(self: TreeItem): cint {.importcpp: "#.label_h(@)", header: flh_treeitem.}
proc draw_item_content*(self: TreeItem; render: cint): cint {.importcpp: "#.draw_item_content(@)", header: flh_treeitem.}
proc draw*(self: TreeItem; X: cint; Y: ref cint; W: cint; itemfocus: TreeItem; tree_item_xmax: ref cint; lastchild, render: cint = 1) {.importcpp: "#.draw(@)", header: flh_treeitem.}
proc show_self*(self: TreeItem; indent: cstring = "") {.importcpp: "#.show_self(@)", header: flh_treeitem.}
proc `label=`*(self: TreeItem; val: cstring) {.importcpp: "#.label(@)", header: flh_treeitem.}
proc label*(self: TreeItem): cstring {.importcpp: "#.label(@)", header: flh_treeitem.}
proc `user_data=`*(self: TreeItem; data: pointer) {.importcpp: "#.user_data(@)", header: flh_treeitem.}
proc user_data*(self: TreeItem): pointer {.importcpp: "#.user_data(@)", header: flh_treeitem.}
proc `labelfont=`*(self: TreeItem; val: Font) {.importcpp: "#.labelfont(@)", header: flh_treeitem.}
proc labelfont*(self: TreeItem): Font {.importcpp: "#.labelfont(@)", header: flh_treeitem.}
proc `labelsize=`*(self: TreeItem; val: Fontsize) {.importcpp: "#.labelsize(@)", header: flh_treeitem.}
proc labelsize*(self: TreeItem): Fontsize {.importcpp: "#.labelsize(@)", header: flh_treeitem.}
proc `labelfgcolor=`*(self: TreeItem; val: Color) {.importcpp: "#.labelfgcolor(@)", header: flh_treeitem.}
proc labelfgcolor*(self: TreeItem): Color {.importcpp: "#.labelfgcolor(@)", header: flh_treeitem.}
proc `labelcolor=`*(self: TreeItem; val: Color) {.importcpp: "#.labelcolor(@)", header: flh_treeitem.}
proc labelcolor*(self: TreeItem): Color {.importcpp: "#.labelcolor(@)", header: flh_treeitem.}
proc `labelbgcolor=`*(self: TreeItem; val: Color) {.importcpp: "#.labelbgcolor(@)", header: flh_treeitem.}
proc labelbgcolor*(self: TreeItem): Color {.importcpp: "#.labelbgcolor(@)", header: flh_treeitem.}
proc `widget=`*(self: TreeItem; val: Widget) {.importcpp: "#.widget(@)", header: flh_treeitem.}
proc widget*(self: TreeItem): Widget {.importcpp: "#.widget(@)", header: flh_treeitem.}
proc children*(self: TreeItem): cint {.importcpp: "#.children(@)", header: flh_treeitem.}
proc child*(self: TreeItem; index: cint): TreeItem {.importcpp: "#.child(@)", header: flh_treeitem.}
proc has_children*(self: TreeItem): cint {.importcpp: "#.has_children(@)", header: flh_treeitem.}
proc find_child*(self: TreeItem; name: cstring): cint {.importcpp: "#.find_child(@)", header: flh_treeitem.}
proc find_child*(self: TreeItem; item: TreeItem): cint {.importcpp: "#.find_child(@)", header: flh_treeitem.}
proc remove_child*(self: TreeItem; item: TreeItem): cint {.importcpp: "#.remove_child(@)", header: flh_treeitem.}
proc remove_child*(self: TreeItem; new_label: cstring): cint {.importcpp: "#.remove_child(@)", header: flh_treeitem.}
proc clear_children*(self: TreeItem) {.importcpp: "#.clear_children(@)", header: flh_treeitem.}
proc swap_children*(self: TreeItem; ax, bx: cint) {.importcpp: "#.swap_children(@)", header: flh_treeitem.}
proc swap_children*(self: TreeItem; a, b: TreeItem): cint {.importcpp: "#.swap_children(@)", header: flh_treeitem.}
proc find_child_item*(self: TreeItem; name: cstring): TreeItem {.importcpp: "#.find_child_item(@)", header: flh_treeitem.}
proc find_child_item*(self: TreeItem; arr: ptr ptr cchar): TreeItem {.importcpp: "#.find_child_item(@)", header: flh_treeitem.}
proc find_item*(self: TreeItem; arr: ptr ptr cchar): TreeItem {.importcpp: "#.find_item(@)", header: flh_treeitem.}
proc add*(self: TreeItem; prefs: TreePrefs; new_label: cstring; newitem: TreeItem): TreeItem {.importcpp: "#.add(*#, @)", header: flh_treeitem.}
proc add*(self: TreeItem; prefs: TreePrefs; new_label: cstring): TreeItem {.importcpp: "#.add(*#, @)", header: flh_treeitem.}
proc add*(self: TreeItem; prefs: TreePrefs; arr: ptr ptr cchar; newitem: TreeItem): TreeItem {.importcpp: "#.add(*#, @)", header: flh_treeitem.}
proc add*(self: TreeItem; prefs: TreePrefs; arr: ptr ptr cchar): TreeItem {.importcpp: "#.add(*#, @)", header: flh_treeitem.}
proc replace*(self: TreeItem; new_item: TreeItem): TreeItem {.importcpp: "#.replace(@)", header: flh_treeitem.}
proc replace_child*(self: TreeItem; olditem, newitem: TreeItem): TreeItem {.importcpp: "#.replace_child(@)", header: flh_treeitem.}
proc insert*(self: TreeItem; prefs: TreePrefs; new_label: cstring, pos: cint = 0): TreeItem {.importcpp: "#.insert(*#, @)", header: flh_treeitem.}
proc insert_above*(self: TreeItem; prefs: TreePrefs; new_label: cstring): TreeItem {.importcpp: "#.insert_above(*#, @)", header: flh_treeitem.}
proc deparent*(self: TreeItem; index: cint): TreeItem {.importcpp: "#.deparent(@)", header: flh_treeitem.}
proc reparent*(self: TreeItem; newchild: TreeItem; index: cint): cint {.importcpp: "#.reparent(@)", header: flh_treeitem.}
proc move*(self: TreeItem; to, `from`: cint): cint {.importcpp: "#.move(@)", header: flh_treeitem.}
proc move*(self: TreeItem; item: TreeItem; op, pos: cint = 0): cint {.importcpp: "#.move(@)", header: flh_treeitem.}
proc move_above*(self: TreeItem; item: TreeItem): cint {.importcpp: "#.move_above(@)", header: flh_treeitem.}
proc move_below*(self: TreeItem; item: TreeItem): cint {.importcpp: "#.move_below(@)", header: flh_treeitem.}
proc move_into*(self: TreeItem; item: TreeItem; pos: cint = 0): cint {.importcpp: "#.move_into(@)", header: flh_treeitem.}
proc depth*(self: TreeItem): cint {.importcpp: "#.depth(@)", header: flh_treeitem.}
proc prev*(self: TreeItem): TreeItem {.importcpp: "#.prev(@)", header: flh_treeitem.}
proc next*(self: TreeItem): TreeItem {.importcpp: "#.next(@)", header: flh_treeitem.}
proc next_sibling*(self: TreeItem): TreeItem {.importcpp: "#.next_sibling(@)", header: flh_treeitem.}
proc prev_sibling*(self: TreeItem): TreeItem {.importcpp: "#.prev_sibling(@)", header: flh_treeitem.}
proc update_prev_next*(self: TreeItem; index: cint) {.importcpp: "#.update_prev_next(@)", header: flh_treeitem.}
proc next_displayed*(self: TreeItem; prefs: TreePrefs): TreeItem {.importcpp: "#.next_displayed(*#, @)", header: flh_treeitem.}
proc prev_displayed*(self: TreeItem; prefs: TreePrefs): TreeItem {.importcpp: "#.prev_displayed(*#, @)", header: flh_treeitem.}
proc next_visible*(self: TreeItem; prefs: TreePrefs): TreeItem {.importcpp: "#.next_visible(*#, @)", header: flh_treeitem.}
proc prev_visible*(self: TreeItem; prefs: TreePrefs): TreeItem {.importcpp: "#.prev_visible(*#, @)", header: flh_treeitem.}
proc parent*(self: TreeItem): TreeItem {.importcpp: "#.parent(@)", header: flh_treeitem.}
proc `parent=`*(self: TreeItem; val: TreeItem) {.importcpp: "#.parent(@)", header: flh_treeitem.}
proc tree*(self: TreeItem): TreeItem {.importcpp: "#.tree(@)", header: flh_treeitem.}
proc open*(self: TreeItem) {.importcpp: "#.open(@)", header: flh_treeitem.}
proc close*(self: TreeItem) {.importcpp: "#.close(@)", header: flh_treeitem.}
proc is_open*(self: TreeItem): cint {.importcpp: "#.is_open(@)", header: flh_treeitem.}
proc is_close*(self: TreeItem): cint {.importcpp: "#.is_close(@)", header: flh_treeitem.}
proc open_toggle*(self: TreeItem) {.importcpp: "#.open_toggle(@)", header: flh_treeitem.}
proc select*(self: TreeItem; val: cint = 1) {.importcpp: "#.select(@)", header: flh_treeitem.}
proc select_toggle*(self: TreeItem) {.importcpp: "#.select_toggle(@)", header: flh_treeitem.}
proc select_all*(self: TreeItem): cint {.importcpp: "#.select_all(@)", header: flh_treeitem.}
proc deselect*(self: TreeItem) {.importcpp: "#.deselect(@)", header: flh_treeitem.}
proc deselect_all*(self: TreeItem): cint {.importcpp: "#.deselect_all(@)", header: flh_treeitem.}
proc is_selected*(self: TreeItem): cchar {.importcpp: "#.is_selected(@)", header: flh_treeitem.}
proc activate*(self: TreeItem; val: cint = 1) {.importcpp: "#.activate(@)", header: flh_treeitem.}
proc deactivate*(self: TreeItem) {.importcpp: "#.deactivate(@)", header: flh_treeitem.}
proc is_activated*(self: TreeItem): cchar {.importcpp: "#.is_activated(@)", header: flh_treeitem.}
proc is_active*(self: TreeItem): cchar {.importcpp: "#.is_active(@)", header: flh_treeitem.}
proc visible*(self: TreeItem): cint {.importcpp: "#.visible(@)", header: flh_treeitem.}
proc is_visible*(self: TreeItem): cint {.importcpp: "#.is_visible(@)", header: flh_treeitem.}
proc visible_r*(self: TreeItem): cint {.importcpp: "#.visible_r(@)", header: flh_treeitem.}
proc `usericon=`*(self: TreeItem; val: Image) {.importcpp: "#.usericon(@)", header: flh_treeitem.}
proc usericon*(self: TreeItem): Image {.importcpp: "#.usericon(@)", header: flh_treeitem.}
proc `userdeicon=`*(self: TreeItem; val: Image) {.importcpp: "#.userdeicon(@)", header: flh_treeitem.}
proc userdeicon*(self: TreeItem): Image {.importcpp: "#.userdeicon(@)", header: flh_treeitem.}
proc find_clicked*(self: TreeItem; prefs: TreePrefs; yonly: cint =0): TreeItem {.importcpp: "#.find_clicked(@)", header: flh_treeitem.}
proc event_on_collapse_icon*(self: TreeItem; prefs: TreePrefs): cint {.importcpp: "#.event_on_collapse_icon(@)", header: flh_treeitem.}
proc event_on_label*(self: TreeItem; prefs: TreePrefs): cint {.importcpp: "#.event_on_label(@)", header: flh_treeitem.}
proc is_root*(self: TreeItem): cint {.importcpp: "#.is_root(@)", header: flh_treeitem.}
proc prefs*(self: TreeItem): TreePrefs {.importcpp: "reinterpret_cast<Fl_Tree_Prefs*>(#.prefs(@))", header: flh_treeitem.}

# tree pref procs
proc make_tree_prefs*(): TreePrefs {.importcpp: "new Fl_Tree_Prefs(@)", header: flh_prefs.}

proc item_labelfont*(self: TreePrefs): Font {.importcpp: "#.item_labelfont(@)", header: flh_prefs.}
proc `item_labelfont=`*(self: TreePrefs; val: Font) {.importcpp: "#.item_labelfont(@)", header: flh_prefs.}
proc item_labelsize*(self: TreePrefs): Fontsize {.importcpp: "#.item_labelsize(@)", header: flh_prefs.}
proc `item_labelsize=`*(self: TreePrefs; val: Fontsize) {.importcpp: "#.item_labelsize(@)", header: flh_prefs.}
proc item_labelfgcolor*(self: TreePrefs): Color {.importcpp: "#.item_labelfgcolor(@)", header: flh_prefs.}
proc `item_labelfgcolor=`*(self: TreePrefs; val: Color) {.importcpp: "#.item_labelfgcolor(@)", header: flh_prefs.}
proc item_labelbgcolor*(self: TreePrefs): Color {.importcpp: "#.item_labelbgcolor(@)", header: flh_prefs.}
proc `item_labelbgcolor=`*(self: TreePrefs; val: Color) {.importcpp: "#.item_labelbgcolor(@)", header: flh_prefs.}
proc marginleft*(self: TreePrefs): cint {.importcpp: "#.marginleft(@)", header: flh_prefs.}
proc `marginleft=`*(self: TreePrefs; val: cint) {.importcpp: "#.marginleft(@)", header: flh_prefs.}
proc margintop*(self: TreePrefs): cint {.importcpp: "#.margintop(@)", header: flh_prefs.}
proc `margintop=`*(self: TreePrefs; val: cint) {.importcpp: "#.margintop(@)", header: flh_prefs.}
proc marginbottom*(self: TreePrefs): cint {.importcpp: "#.marginbottom(@)", header: flh_prefs.}
proc `marginbottom=`*(self: TreePrefs; val: cint) {.importcpp: "#.marginbottom(@)", header: flh_prefs.}
proc openchild_marginbottom*(self: TreePrefs): cint {.importcpp: "#.openchild_marginbottom(@)", header: flh_prefs.}
proc `openchild_marginbottom=`*(self: TreePrefs; val: cint) {.importcpp: "#.openchild_marginbottom(@)", header: flh_prefs.}
proc usericonmarginleft*(self: TreePrefs): cint {.importcpp: "#.usericonmarginleft(@)", header: flh_prefs.}
proc `usericonmarginleft=`*(self: TreePrefs; val: cint) {.importcpp: "#.usericonmarginleft(@)", header: flh_prefs.}
proc labelmarginleft*(self: TreePrefs): cint {.importcpp: "#.labelmarginleft(@)", header: flh_prefs.}
proc `labelmarginleft=`*(self: TreePrefs; val: cint) {.importcpp: "#.labelmarginleft(@)", header: flh_prefs.}
proc widgetmarginleft*(self: TreePrefs): cint {.importcpp: "#.widgetmarginleft(@)", header: flh_prefs.}
proc `widgetmarginleft=`*(self: TreePrefs; val: cint) {.importcpp: "#.widgetmarginleft(@)", header: flh_prefs.}
proc linespacing*(self: TreePrefs): cint {.importcpp: "#.linespacing(@)", header: flh_prefs.}
proc `linespacing=`*(self: TreePrefs; val: cint) {.importcpp: "#.linespacing(@)", header: flh_prefs.}
proc connectorcolor*(self: TreePrefs): Color {.importcpp: "#.connectorcolor(@)", header: flh_prefs.}
proc `connectorcolor=`*(self: TreePrefs; val: Color) {.importcpp: "#.connectorcolor(@)", header: flh_prefs.}
proc connectorstyle*(self: TreePrefs): TreeConnector {.importcpp: "#.connectorstyle(@)", header: flh_prefs.}
proc connectorstyle*(self: TreePrefs; val: TreeConnector) {.importcpp: "#.connectorstyle(@)", header: flh_prefs.}
proc connectorwidth*(self: TreePrefs): cint {.importcpp: "#.connectorwidth(@)", header: flh_prefs.}
proc `connectorwidth=`*(self: TreePrefs; val: cint) {.importcpp: "#.connectorwidth(@)", header: flh_prefs.}
proc openicon*(self: TreePrefs): Image {.importcpp: "#.openicon(@)", header: flh_prefs.}
proc `openicon=`*(self: TreePrefs; val: Image) {.importcpp: "#.openicon(@)", header: flh_prefs.}
proc closeicon*(self: TreePrefs): Image {.importcpp: "#.closeicon(@)", header: flh_prefs.}
proc `closeicon=`*(self: TreePrefs; val: Image) {.importcpp: "#.closeicon(@)", header: flh_prefs.}
proc usericon*(self: TreePrefs): Image {.importcpp: "#.usericon(@)", header: flh_prefs.}
proc `usericon=`*(self: TreePrefs; val: Image) {.importcpp: "#.usericon(@)", header: flh_prefs.}
proc opendeicon*(self: TreePrefs): Image {.importcpp: "#.opendeicon(@)", header: flh_prefs.}
proc closedeicon*(self: TreePrefs): Image {.importcpp: "#.closedeicon(@)", header: flh_prefs.}
proc userdeicon*(self: TreePrefs): Image {.importcpp: "#.userdeicon(@)", header: flh_prefs.}
proc showcollapse*(self: TreePrefs): cchar {.importcpp: "#.showcollapse(@)", header: flh_prefs.}
proc `showcollapse=`*(self: TreePrefs; val: cint) {.importcpp: "#.showcollapse(@)", header: flh_prefs.}
proc sortorder*(self: TreePrefs): TreeSort {.importcpp: "#.sortorder(@)", header: flh_prefs.}
proc `sortorder=`*(self: TreePrefs; val: TreeSort) {.importcpp: "#.sortorder(@)", header: flh_prefs.}
proc selectbox*(self: TreePrefs): Boxtype {.importcpp: "#.selectbox(@)", header: flh_prefs.}
proc `selectbox=`*(self: TreePrefs; val: Boxtype) {.importcpp: "#.selectbox(@)", header: flh_prefs.}
proc showroot*(self: TreePrefs): cint {.importcpp: "#.showroot(@)", header: flh_prefs.}
proc `showroot=`*(self: TreePrefs; val: cint) {.importcpp: "#.showroot(@)", header: flh_prefs.}
proc selectmode*(self: TreePrefs): TreeSelect {.importcpp: "#.selectmode(@)", header: flh_prefs.}
proc `selectmode=`*(self: TreePrefs; val: TreeSelect) {.importcpp: "#.selectmode(@)", header: flh_prefs.}
proc item_reselect_mode*(self: TreePrefs): TreeItemReselectMode {.importcpp: "#.item_reselect_mode(@)", header: flh_prefs.}
proc `item_reselect_mode=`*(self: TreePrefs; mode: TreeItemReselectMode) {.importcpp: "#.item_reselect_mode(@)", header: flh_prefs.}
proc item_draw_mode*(self: TreePrefs): TreeItemDrawMode {.importcpp: "#.item_draw_mode(@)", header: flh_prefs.}
proc `item_draw_mode=`*(self: TreePrefs; val: TreeItemDrawMode) {.importcpp: "#.item_draw_mode(@)", header: flh_prefs.}
proc item_draw_callback*(self: TreePrefs): TreeItemDrawCallback {.importcpp: "#.item_draw_callback(@)", header: flh_prefs.}
proc `item_draw_callback=`*(self: TreePrefs; cb: TreeItemDrawCallback; data: pointer = nil) {.importcpp: "#.item_draw_callback(@)", header: flh_prefs.}
proc item_draw_user_data*(self: TreePrefs): pointer {.importcpp: "#.item_draw_user_data(@)", header: flh_prefs.}
proc `do_item_draw_callback=`*(self: TreePrefs; o: TreeItem) {.importcpp: "#.do_item_draw_callback(@)", header: flh_prefs.}

