const
  flh = "FL/Fl.H"

  FL_MAJOR_VERSION* = 1
  FL_MINOR_VERSION* = 3
  FL_PATCH_VERSION* = 4

  FL_VERSION* = FL_MAJOR_VERSION.cdouble + FL_MINOR_VERSION.cdouble * 0.01 + FL_PATCH_VERSION.cdouble * 0.0001
  FL_API_VERSION* = (FL_MAJOR_VERSION*10000 + FL_MINOR_VERSION*100 + FL_PATCH_VERSION)
  FL_ABI_VERSION* = (FL_MAJOR_VERSION*10000 + FL_MINOR_VERSION*100)

type
  Event* {.importcpp: "Fl_Event", header: flh.} = cint
const
  FL_NO_EVENT*                     = 0
  FL_Event_PUSH*                         = 1
  FL_Event_RELEASE*                      = 2
  FL_Event_ENTER*                        = 3
  FL_Event_LEAVE*                        = 4
  FL_Event_DRAG*                         = 5
  FL_Event_FOCUS*                        = 6
  FL_Event_UNFOCUS*                      = 7
  FL_Event_KEYDOWN*                      = 8
  FL_Event_KEYBOARD*                     = 8
  FL_Event_KEYUP*                        = 9
  FL_Event_CLOSE*                        = 10
  FL_Event_MOVE*                         = 11
  FL_Event_SHORTCUT*                     = 12
  FL_Event_DEACTIVATE*                   = 13
  FL_Event_ACTIVATE*                     = 14
  FL_Event_HIDE*                         = 15
  FL_Event_SHOW*                         = 16
  FL_Event_PASTE*                        = 17
  FL_Event_SELECTIONCLEAR*               = 18
  FL_Event_MOUSEWHEEL*                   = 19
  FL_Event_DND_ENTER*                    = 20
  FL_Event_DND_DRAG*                     = 21
  FL_Event_DND_LEAVE*                    = 22
  FL_Event_DND_RELEASE*                  = 23
  FL_Event_SCREEN_CONFIGURATION_CHANGED* = 24
  FL_Event_FULLSCREEN*                   = 25
  FL_Event_ZOOM_GESTURE*                 = 26

type
  When* {.importcpp: "Fl_When", header: flh.} = cint
const
  FL_WHEN_NEVER*             = 0
  FL_WHEN_CHANGED*           = 1
  FL_WHEN_NOT_CHANGED*       = 2
  FL_WHEN_RELEASE*           = 4
  FL_WHEN_RELEASE_ALWAYS*    = 6
  FL_WHEN_ENTER_KEY*         = 8
  FL_WHEN_ENTER_KEY_ALWAYS*  = 10
  FL_WHEN_ENTER_KEY_CHANGED* = 11

const
  FL_Key_Button*         = 0xfee8
  FL_Key_BackSpace*      = 0xff08
  FL_Key_Tab*            = 0xff09
  FL_Key_Iso_Key*        = 0xff0c
  FL_Key_Enter*          = 0xff0d
  FL_Key_Pause*          = 0xff13
  FL_Key_Scroll_Lock*    = 0xff14
  FL_Key_Escape*         = 0xff1b
  FL_Key_Kana*           = 0xff2e
  FL_Key_Eisu*           = 0xff2f
  FL_Key_Yen*            = 0xff30
  FL_Key_JIS_Underscore* = 0xff31
  FL_Key_Home*           = 0xff50
  FL_Key_Left*           = 0xff51
  FL_Key_Up*             = 0xff52
  FL_Key_Right*          = 0xff53
  FL_Key_Down*           = 0xff54
  FL_Key_Page_Up*        = 0xff55
  FL_Key_Page_Down*      = 0xff56
  FL_Key_End*            = 0xff57
  FL_Key_Print*          = 0xff61
  FL_Key_Insert*         = 0xff63
  FL_Key_Menu*           = 0xff67
  FL_Key_Help*           = 0xff68
  FL_Key_Num_Lock*       = 0xff7f
  FL_Key_KP*             = 0xff80
  FL_Key_KP_Enter*       = 0xff8d
  FL_Key_KP_Last*        = 0xffbd
  FL_Key_F*              = 0xffbd
  FL_Key_F_Last*         = 0xffe0
  FL_Key_Shift_L*        = 0xffe1
  FL_Key_Shift_R*        = 0xffe2
  FL_Key_Control_L*      = 0xffe3
  FL_Key_Control_R*      = 0xffe4
  FL_Key_Caps_Lock*      = 0xffe5
  FL_Key_Meta_L*         = 0xffe7
  FL_Key_Meta_R*         = 0xffe8
  FL_Key_Alt_L*          = 0xffe9
  FL_Key_Alt_R*          = 0xffea
  FL_Key_Delete*         = 0xffff
  FL_Key_Volume_Down*  = 0xEF11   
  FL_Key_Volume_Mute*  = 0xEF12   
  FL_Key_Volume_Up*    = 0xEF13   
  FL_Key_Media_Play*   = 0xEF14   
  FL_Key_Media_Stop*   = 0xEF15   
  FL_Key_Media_Prev*   = 0xEF16   
  FL_Key_Media_Next*   = 0xEF17   
  FL_Key_Home_Page*    = 0xEF18   
  FL_Key_Mail*         = 0xEF19   
  FL_Key_Search*       = 0xEF1B   
  FL_Key_Back*         = 0xEF26   
  FL_Key_Forward*      = 0xEF27   
  FL_Key_Stop*         = 0xEF28   
  FL_Key_Refresh*      = 0xEF29   
  FL_Key_Sleep*        = 0xEF2F   
  FL_Key_Favorites*    = 0xEF30   

const
  FL_LEFT_MOUSE*   = 1
  FL_MIDDLE_MOUSE* = 2
  FL_RIGHT_MOUSE*  = 3

const
  FL_SHIFT*       = 0x00010000
  FL_CAPS_LOCK*   = 0x00020000
  FL_CTRL*        = 0x00040000
  FL_ALT*         = 0x00080000
  FL_NUM_LOCK*    = 0x00100000
  FL_META*        = 0x00400000
  FL_SCROLL_LOCK* = 0x00800000
  FL_BUTTON1*     = 0x01000000
  FL_BUTTON2*     = 0x02000000
  FL_BUTTON3*     = 0x04000000
  FL_BUTTONS*     = 0x7f000000
  FL_KEY_MASK*    = 0x0000ffff

template FL_BUTTON*(n: int): int =
  0x00800000 shl n

when defined(apple):
  const
    FL_COMMAND* = FL_META
    FL_CONTROL* = FL_CTRL
else:
  const
    FL_COMMAND* = FL_CTRL
    FL_CONTROL* = FL_META

type
  Boxtype* {.importcpp: "Fl_Boxtype", header: flh.} = cint
const
  FL_NO_BOX*                  = 0
  FL_FLAT_BOX*                = 1
  FL_UP_BOX*                  = 2
  FL_DOWN_BOX*                = 3
  FL_UP_FRAME*                = 4
  FL_DOWN_FRAME*              = 5
  FL_THIN_UP_BOX*             = 6
  FL_THIN_DOWN_BOX*           = 7
  FL_THIN_UP_FRAME*           = 8
  FL_THIN_DOWN_FRAME*         = 9
  FL_ENGRAVED_BOX*            = 10
  FL_EMBOSSED_BOX*            = 11
  FL_ENGRAVED_FRAME*          = 12
  FL_EMBOSSED_FRAME*          = 13
  FL_BORDER_BOX*              = 14
  XFL_SHADOW_BOX*             = 15
  FL_BORDER_FRAME*            = 16
  XFL_SHADOW_FRAME*           = 17
  XFL_ROUNDED_BOX*            = 18
  XFL_RSHADOW_BOX*            = 19
  XFL_ROUNDED_FRAME*          = 20
  XFL_RFLAT_BOX*              = 21
  XFL_ROUND_UP_BOX*           = 22
  XFL_ROUND_DOWN_BOX*         = 23
  XFL_DIAMOND_UP_BOX*         = 24
  XFL_DIAMOND_DOWN_BOX*       = 25
  XFL_OVAL_BOX*               = 26
  XFL_OSHADOW_BOX*            = 27
  XFL_OVAL_FRAME*             = 28
  XFL_OFLAT_BOX*              = 29
  XFL_PLASTIC_UP_BOX*         = 30
  XFL_PLASTIC_DOWN_BOX*       = 31
  XFL_PLASTIC_UP_FRAME*       = 32
  XFL_PLASTIC_DOWN_FRAME*     = 33
  XFL_PLASTIC_THIN_UP_BOX*    = 34
  XFL_PLASTIC_THIN_DOWN_BOX*  = 35
  XFL_PLASTIC_ROUND_UP_BOX*   = 36
  XFL_PLASTIC_ROUND_DOWN_BOX* = 37
  XFL_GTK_UP_BOX*             = 38
  XFL_GTK_DOWN_BOX*           = 39
  XFL_GTK_UP_FRAME*           = 40
  XFL_GTK_DOWN_FRAME*         = 41
  XFL_GTK_THIN_UP_BOX*        = 42
  XFL_GTK_THIN_DOWN_BOX*      = 43
  XFL_GTK_THIN_UP_FRAME*      = 44
  XFL_GTK_THIN_DOWN_FRAME*    = 45
  XFL_GTK_ROUND_UP_BOX*       = 46
  XFL_GTK_ROUND_DOWN_BOX*     = 47
  XFL_GLEAM_UP_BOX*           = 48
  XFL_GLEAM_DOWN_BOX*         = 49
  XFL_GLEAM_UP_FRAME*         = 50
  XFL_GLEAM_DOWN_FRAME*       = 51
  XFL_GLEAM_THIN_UP_BOX*      = 52
  XFL_GLEAM_THIN_DOWN_BOX*    = 53
  XFL_GLEAM_ROUND_UP_BOX*     = 54
  XFL_GLEAM_ROUND_DOWN_BOX*   = 55
  FL_FREE_BOXTYPE*            = 56

proc fl_define_FL_ROUND_UP_BOX*(): Boxtype {.importcpp, header: flh.}
template FL_ROUND_UP_BOX*(): untyped = fl_define_FL_ROUND_UP_BOX()
template FL_ROUND_DOWN_BOX*(): untyped = fl_define_FL_ROUND_UP_BOX()+1

proc fl_define_FL_SHADOW_BOX*(): Boxtype {.importcpp, header: flh.}
template FL_SHADOW_BOX*(): untyped = fl_define_FL_SHADOW_BOX()
template FL_SHADOW_FRAME*(): untyped = fl_define_FL_SHADOW_BOX()+2

proc fl_define_FL_ROUNDED_BOX*(): Boxtype {.importcpp, header: flh.}
template FL_ROUNDED_BOX*(): untyped = fl_define_FL_ROUNDED_BOX()
template FL_ROUNDED_FRAME*(): untyped = fl_define_FL_ROUNDED_BOX()+2

proc fl_define_FL_RFLAT_BOX*(): Boxtype {.importcpp, header: flh.}
template FL_RFLAT_BOX*(): untyped = fl_define_FL_RFLAT_BOX()

proc fl_define_FL_RSHADOW_BOX*(): Boxtype {.importcpp, header: flh.}
template FL_RSHADOW_BOX*(): untyped = fl_define_FL_RSHADOW_BOX()

proc fl_define_FL_DIAMOND_BOX*(): Boxtype {.importcpp, header: flh.}
template FL_DIAMOND_UP_BOX*(): untyped = fl_define_FL_DIAMOND_BOX()
template FL_DIAMOND_DOWN_BOX*(): untyped = fl_define_FL_DIAMOND_BOX()+1

proc fl_define_FL_OVAL_BOX*(): Boxtype {.importcpp, header: flh.}
template FL_OVAL_BOX*(): untyped = fl_define_FL_OVAL_BOX()
template FL_OSHADOW_BOX*(): untyped = fl_define_FL_OVAL_BOX()+1
template FL_OVAL_FRAME*(): untyped = fl_define_FL_OVAL_BOX()+2
template FL_OFLAT_BOX*(): untyped = fl_define_FL_OVAL_BOX()+3

proc fl_define_FL_PLASTIC_UP_BOX*(): Boxtype {.importcpp, header: flh.}
template FL_PLASTIC_UP_BOX*(): untyped = fl_define_FL_PLASTIC_UP_BOX()
template FL_PLASTIC_DOWN_BOX*(): untyped = fl_define_FL_PLASTIC_UP_BOX()+1
template FL_PLASTIC_UP_FRAME*(): untyped = fl_define_FL_PLASTIC_UP_BOX()+2
template FL_PLASTIC_DOWN_FRAME*(): untyped = fl_define_FL_PLASTIC_UP_BOX()+3
template FL_PLASTIC_THIN_UP_BOX*(): untyped = fl_define_FL_PLASTIC_UP_BOX()+4
template FL_PLASTIC_THIN_DOWN_BOX*(): untyped = fl_define_FL_PLASTIC_UP_BOX()+5
template FL_PLASTIC_ROUND_UP_BOX*(): untyped = fl_define_FL_PLASTIC_UP_BOX()+6
template FL_PLASTIC_ROUND_DOWN_BOX*(): untyped = fl_define_FL_PLASTIC_UP_BOX()+7

proc fl_define_FL_GTK_UP_BOX*(): Boxtype {.importcpp, header: flh.}
template FL_GTK_UP_BOX*(): untyped = fl_define_FL_GTK_UP_BOX()
template FL_GTK_DOWN_BOX*(): untyped = fl_define_FL_GTK_UP_BOX()+1
template FL_GTK_UP_FRAME*(): untyped = fl_define_FL_GTK_UP_BOX()+2
template FL_GTK_DOWN_FRAME*(): untyped = fl_define_FL_GTK_UP_BOX()+3
template FL_GTK_THIN_UP_BOX*(): untyped = fl_define_FL_GTK_UP_BOX()+4
template FL_GTK_THIN_DOWN_BOX*(): untyped = fl_define_FL_GTK_UP_BOX()+5
template FL_GTK_THIN_UP_FRAME*(): untyped = fl_define_FL_GTK_UP_BOX()+6
template FL_GTK_THIN_DOWN_FRAME*(): untyped = fl_define_FL_GTK_UP_BOX()+7
template FL_GTK_ROUND_UP_BOX*(): untyped = fl_define_FL_GTK_UP_BOX()+8
template FL_GTK_ROUND_DOWN_BOX*(): untyped = fl_define_FL_GTK_UP_BOX()+9

proc fl_define_FL_GLEAM_UP_BOX*(): Boxtype {.importcpp, header: flh.}
template FL_GLEAM_UP_BOX*(): untyped = fl_define_FL_GLEAM_UP_BOX()
template FL_GLEAM_DOWN_BOX*(): untyped = fl_define_FL_GLEAM_UP_BOX()+1
template FL_GLEAM_UP_FRAME*(): untyped = fl_define_FL_GLEAM_UP_BOX()+2
template FL_GLEAM_DOWN_FRAME*(): untyped = fl_define_FL_GLEAM_UP_BOX()+3
template FL_GLEAM_THIN_UP_BOX*(): untyped = fl_define_FL_GLEAM_UP_BOX()+4
template FL_GLEAM_THIN_DOWN_BOX*(): untyped = fl_define_FL_GLEAM_UP_BOX()+5
template FL_GLEAM_ROUND_UP_BOX*(): untyped = fl_define_FL_GLEAM_UP_BOX()+6
template FL_GLEAM_ROUND_DOWN_BOX*(): untyped = fl_define_FL_GLEAM_UP_BOX()+7

proc box*(b: Boxtype): Boxtype {.importcpp: "fl_box", header: flh.}
proc down*(b: Boxtype): Boxtype {.importcpp: "fl_down", header: flh.}
proc frame*(b: Boxtype): Boxtype {.importcpp: "fl_frame", header: flh.}

#const
  #FL_FRAME*       = FL_ENGRAVED_FRAME
  #FL_FRAME_BOX*   = FL_ENGRAVED_BOX
  #FL_CIRCLE_BOX*  = FL_ROUND_DOWN_BOX
  #FL_DIAMOND_BOX* = FL_DIAMOND_DOWN_BOX

type
  Labeltype* {.importcpp: "Fl_Labeltype", header: flh.} = cint
const
  FL_NORMAL_LABEL*    = 0
  FL_NO_LABEL*        = 1
  XFL_SHADOW_LABEL*   = 2
  XFL_ENGRAVED_LABEL* = 3
  XFL_EMBOSSED_LABEL* = 4
  XFL_MULTI_LABEL*    = 5
  XFL_ICON_LABEL*     = 6
  XFL_IMAGE_LABEL*    = 7
  FL_FREE_LABELTYPE*  = 8

const
  FL_SYMBOL_LABEL* = FL_NORMAL_LABEL

proc fl_define_FL_SHADOW_LABEL*(): Labeltype {.importcpp, header: flh.}
proc fl_define_FL_ENGRAVED_LABEL*(): Labeltype {.importcpp, header: flh, header: flh.}
proc fl_define_FL_EMBOSSED_LABEL*(): Labeltype {.importcpp, header: flh.}

template FL_SHADOW_LABEL*(): untyped = fl_define_FL_SHADOW_LABEL()
template FL_ENGRAVED_LABEL*(): untyped = fl_define_FL_ENGRAVED_LABEL()
template FL_EMBOSSED_LABEL*(): untyped = fl_define_FL_EMBOSSED_LABEL()

type
  Align* {.importcpp: "Fl_Align", header: flh.} = cuint
const
  FL_ALIGN_CENTER*             = 0
  FL_ALIGN_TOP*                = 1
  FL_ALIGN_BOTTOM*             = 2
  FL_ALIGN_LEFT*               = 4
  FL_ALIGN_RIGHT*              = 8
  FL_ALIGN_INSIDE*             = 16
  FL_ALIGN_TEXT_OVER_IMAGE*    = 0x0020
  FL_ALIGN_IMAGE_OVER_TEXT*    = 0x0000
  FL_ALIGN_CLIP*               = 64
  FL_ALIGN_WRAP*               = 128
  FL_ALIGN_IMAGE_NEXT_TO_TEXT* = 0x0100
  FL_ALIGN_TEXT_NEXT_TO_IMAGE* = 0x0120
  FL_ALIGN_IMAGE_BACKDROP*     = 0x0200
  FL_ALIGN_TOP_LEFT*           = FL_ALIGN_TOP or FL_ALIGN_LEFT
  FL_ALIGN_TOP_RIGHT*          = FL_ALIGN_TOP or FL_ALIGN_RIGHT
  FL_ALIGN_BOTTOM_LEFT*        = FL_ALIGN_BOTTOM or FL_ALIGN_LEFT
  FL_ALIGN_BOTTOM_RIGHT*       = FL_ALIGN_BOTTOM or FL_ALIGN_RIGHT
  FL_ALIGN_LEFT_TOP*           = 0x0007
  FL_ALIGN_RIGHT_TOP*          = 0x000b
  FL_ALIGN_LEFT_BOTTOM*        = 0x000d
  FL_ALIGN_RIGHT_BOTTOM*       = 0x000e
  FL_ALIGN_NOWRAP*             = 0
  FL_ALIGN_POSITION_MASK*      = 0x000f
  FL_ALIGN_IMAGE_MASK*         = 0x0320

type
  Font* {.importcpp: "Fl_Font", header: flh.} = cint
const
  FL_HELVETICA*              = 0
  FL_HELVETICA_BOLD*         = 1
  FL_HELVETICA_ITALIC*       = 2
  FL_HELVETICA_BOLD_ITALIC*  = 3
  FL_COURIER*                = 4
  FL_COURIER_BOLD*           = 5
  FL_COURIER_ITALIC*         = 6
  FL_COURIER_BOLD_ITALIC*    = 7
  FL_TIMES*                  = 8
  FL_TIMES_BOLD*             = 9
  FL_TIMES_ITALIC*           = 10
  FL_TIMES_BOLD_ITALIC*      = 11
  FL_SYMBOL*                 = 12
  FL_SCREEN*                 = 13
  FL_SCREEN_BOLD*            = 14
  FL_ZAPF_DINGBATS*          = 15
  FL_FREE_FONT*              = 16
  FL_BOLD*                   = 1
  FL_ITALIC*                 = 2
  FL_BOLD_ITALIC*            = 3

type
  Fontsize* {.importcpp: "Fl_Fontsize", header: flh.} = cint

var FL_NORMAL_SIZE* {.extern: "FL_NORMAL_SIZE".}: Fontsize

type
  Color* {.importcpp: "Fl_Color", header: flh.} = cint
const
  FL_FOREGROUND_COLOR*  = 0
  FL_BACKGROUND2_COLOR* = 7
  FL_INACTIVE_COLOR*    = 8
  FL_SELECTION_COLOR*   = 15
  FL_GRAY0*             = 32
  FL_DARK3*             = 39
  FL_DARK2*             = 45
  FL_DARK1*             = 47
  FL_BACKGROUND_COLOR*  = 49
  FL_LIGHT1*            = 50
  FL_LIGHT2*            = 52
  FL_LIGHT3*            = 54
  FL_BLACK*             = 56
  FL_RED*               = 88
  FL_GREEN*             = 63
  FL_YELLOW*            = 95
  FL_BLUE*              = 216
  FL_MAGENTA*           = 248
  FL_CYAN*              = 223
  FL_DARK_RED*          = 72
  FL_DARK_GREEN*        = 60
  FL_DARK_YELLOW*       = 76
  FL_DARK_BLUE*         = 136
  FL_DARK_MAGENTA*      = 152
  FL_DARK_CYAN*         = 140
  FL_WHITE*             = 255

const
  FL_FREE_COLOR*     = 16
  FL_NUM_FREE_COLOR* = 16
  FL_GRAY_RAMP*      = 32
  FL_NUM_GRAY*       = 24
  FL_GRAY*           = FL_BACKGROUND_COLOR
  FL_COLOR_CUBE*     = 56
  FL_NUM_RED*        = 5
  FL_NUM_GREEN*      = 8
  FL_NUM_BLUE*       = 5

proc fl_inactive*(c: Color): Color {.importcpp: "fl_inactive", header: flh.}
proc fl_contrast*(fg, bg: Color): Color {.importcpp: "fl_contrast", header: flh.}
proc fl_color_average*(c1, c2: Color; weight: cfloat): Color {.importcpp: "fl_color_average", header: flh.}
proc fl_lighter*(c: Color): Color {.importcpp: "fl_lighter", header: flh.}
proc fl_darker*(c: Color): Color {.importcpp: "fl_darker", header: flh.}
proc fl_rgb_color*(r, g, b: cuchar): Color {.importcpp: "fl_rgb_color", header: flh.}
proc fl_rgb_color*(g: cuchar): Color {.importcpp: "fl_rgb_color", header: flh.}
proc fl_gray_ramp*(i: cint): Color {.importcpp: "fl_gray_ramp", header: flh.}
proc fl_color_cube*(r, g, b: cint): Color {.importcpp: "fl_color_cube", header: flh.}

type
  Cursor* {.importcpp: "Fl_Cursor", header: flh.} = cint
const
  FL_CURSOR_DEFAULT* = 0
  FL_CURSOR_ARROW*   = 35
  FL_CURSOR_CROSS*   = 66
  FL_CURSOR_WAIT*    = 76
  FL_CURSOR_INSERT*  = 77
  FL_CURSOR_HAND*    = 31
  FL_CURSOR_HELP*    = 47
  FL_CURSOR_MOVE*    = 27
  FL_CURSOR_NS*      = 78
  FL_CURSOR_WE*      = 79
  FL_CURSOR_NWSE*    = 80
  FL_CURSOR_NESW*    = 81
  FL_CURSOR_N*       = 70
  FL_CURSOR_NE*      = 69
  FL_CURSOR_E*       = 49
  FL_CURSOR_SE*      = 8
  FL_CURSOR_S*       = 9
  FL_CURSOR_SW*      = 7
  FL_CURSOR_W*       = 36
  FL_CURSOR_NW*      = 68
  FL_CURSOR_NONE*    = 255

const
  FL_READ*   = 1
  FL_WRITE*  = 4
  FL_EXCEPT* = 8

type
  Mode* {.importcpp: "Fl_Mode", header: flh.} = cint
const
  FL_RGB*         = 0
  FL_INDEX*       = 1
  FL_SINGLE*      = 0
  FL_DOUBLE*      = 2
  FL_ACCUM*       = 4
  FL_ALPHA*       = 8
  FL_DEPTH*       = 16
  FL_STENCIL*     = 32
  FL_RGB8*        = 64
  FL_MULTISAMPLE* = 128
  FL_STEREO*      = 256
  FL_FAKE_SINGLE* = 512
  FL_OPENGL3*     = 1024

type
  Damage* {.importcpp: "Fl_Damage", header: flh.} = cint
const
  FL_DAMAGE_CHILD*    = 0x01
  FL_DAMAGE_EXPOSE*   = 0x02
  FL_DAMAGE_SCROLL*   = 0x04
  FL_DAMAGE_OVERLAY*  = 0x08
  FL_DAMAGE_USER1*    = 0x10
  FL_DAMAGE_USER2*    = 0x20
  FL_DAMAGE_ALL*      = 0x80

