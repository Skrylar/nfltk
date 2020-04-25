
const
  flh = "FL/Fl.H"

  FL_MAJOR_VERSION* = 1
  FL_MINOR_VERSION* = 3
  FL_PATCH_VERSION* = 4

  FL_VERSION* = FL_MAJOR_VERSION.cdouble + FL_MINOR_VERSION.cdouble * 0.01 + FL_PATCH_VERSION.cdouble * 0.0001
  FL_API_VERSION* = (FL_MAJOR_VERSION*10000 + FL_MINOR_VERSION*100 + FL_PATCH_VERSION)
  FL_ABI_VERSION* = (FL_MAJOR_VERSION*10000 + FL_MINOR_VERSION*100)

type
  Event* {.importc: "Fl_Event", header: flh.} = cint
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
  When* {.importc: "Fl_When", header: flh.} = cint
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
  FL_Up*             = 0xff52
  FL_Key_Right*          = 0xff53
  FL_Key_Down*           = 0xff54
  FL_Down*           = 0xff54
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
  Boxtype* {.importc: "Fl_Boxtype", header: flh.} = cint
const
  NO_BOX*                  = 0
  FLAT_BOX*                = 1
  UP_BOX*                  = 2
  DOWN_BOX*                = 3
  UP_FRAME*                = 4
  DOWN_FRAME*              = 5
  THIN_UP_BOX*             = 6
  THIN_DOWN_BOX*           = 7
  THIN_UP_FRAME*           = 8
  THIN_DOWN_FRAME*         = 9
  ENGRAVED_BOX*            = 10
  EMBOSSED_BOX*            = 11
  ENGRAVED_FRAME*          = 12
  EMBOSSED_FRAME*          = 13
  BORDER_BOX*              = 14
  XSHADOW_BOX*             = 15
  BORDER_FRAME*            = 16
  XSHADOW_FRAME*           = 17
  XROUNDED_BOX*            = 18
  XRSHADOW_BOX*            = 19
  XROUNDED_FRAME*          = 20
  XRFLAT_BOX*              = 21
  XROUND_UP_BOX*           = 22
  XROUND_DOWN_BOX*         = 23
  XDIAMOND_UP_BOX*         = 24
  XDIAMOND_DOWN_BOX*       = 25
  XOVAL_BOX*               = 26
  XOSHADOW_BOX*            = 27
  XOVAL_FRAME*             = 28
  XOFLAT_BOX*              = 29
  XPLASTIC_UP_BOX*         = 30
  XPLASTIC_DOWN_BOX*       = 31
  XPLASTIC_UP_FRAME*       = 32
  XPLASTIC_DOWN_FRAME*     = 33
  XPLASTIC_THIN_UP_BOX*    = 34
  XPLASTIC_THIN_DOWN_BOX*  = 35
  XPLASTIC_ROUND_UP_BOX*   = 36
  XPLASTIC_ROUND_DOWN_BOX* = 37
  XGTK_UP_BOX*             = 38
  XGTK_DOWN_BOX*           = 39
  XGTK_UP_FRAME*           = 40
  XGTK_DOWN_FRAME*         = 41
  XGTK_THIN_UP_BOX*        = 42
  XGTK_THIN_DOWN_BOX*      = 43
  XGTK_THIN_UP_FRAME*      = 44
  XGTK_THIN_DOWN_FRAME*    = 45
  XGTK_ROUND_UP_BOX*       = 46
  XGTK_ROUND_DOWN_BOX*     = 47
  XGLEAM_UP_BOX*           = 48
  XGLEAM_DOWN_BOX*         = 49
  XGLEAM_UP_FRAME*         = 50
  XGLEAM_DOWN_FRAME*       = 51
  XGLEAM_THIN_UP_BOX*      = 52
  XGLEAM_THIN_DOWN_BOX*    = 53
  XGLEAM_ROUND_UP_BOX*     = 54
  XGLEAM_ROUND_DOWN_BOX*   = 55
  FREE_BOXTYPE*            = 56

proc fl_define_FL_ROUND_UP_BOX*(): Boxtype {.importc, header: flh.}
template ROUND_UP_BOX*(): untyped = fl_define_FL_ROUND_UP_BOX()
template ROUND_DOWN_BOX*(): untyped = fl_define_FL_ROUND_UP_BOX()+1

proc fl_define_FL_SHADOW_BOX*(): Boxtype {.importc, header: flh.}
template SHADOW_BOX*(): untyped = fl_define_FL_SHADOW_BOX()
template SHADOW_FRAME*(): untyped = fl_define_FL_SHADOW_BOX()+2

proc fl_define_FL_ROUNDED_BOX*(): Boxtype {.importc, header: flh.}
template ROUNDED_BOX*(): untyped = fl_define_FL_ROUNDED_BOX()
template ROUNDED_FRAME*(): untyped = fl_define_FL_ROUNDED_BOX()+2

proc fl_define_FL_RFLAT_BOX*(): Boxtype {.importc, header: flh.}
template RFLAT_BOX*(): untyped = fl_define_FL_RFLAT_BOX()

proc fl_define_FL_RSHADOW_BOX*(): Boxtype {.importc, header: flh.}
template RSHADOW_BOX*(): untyped = fl_define_FL_RSHADOW_BOX()

proc fl_define_FL_DIAMOND_BOX*(): Boxtype {.importc, header: flh.}
template DIAMOND_UP_BOX*(): untyped = fl_define_FL_DIAMOND_BOX()
template DIAMOND_DOWN_BOX*(): untyped = fl_define_FL_DIAMOND_BOX()+1

proc fl_define_FL_OVAL_BOX*(): Boxtype {.importc, header: flh.}
template OVAL_BOX*(): untyped = fl_define_FL_OVAL_BOX()
template OSHADOW_BOX*(): untyped = fl_define_FL_OVAL_BOX()+1
template OVAL_FRAME*(): untyped = fl_define_FL_OVAL_BOX()+2
template OFLAT_BOX*(): untyped = fl_define_FL_OVAL_BOX()+3

proc fl_define_FL_PLASTIC_UP_BOX*(): Boxtype {.importc, header: flh.}
template PLASTIC_UP_BOX*(): untyped = fl_define_FL_PLASTIC_UP_BOX()
template PLASTIC_DOWN_BOX*(): untyped = fl_define_FL_PLASTIC_UP_BOX()+1
template PLASTIC_UP_FRAME*(): untyped = fl_define_FL_PLASTIC_UP_BOX()+2
template PLASTIC_DOWN_FRAME*(): untyped = fl_define_FL_PLASTIC_UP_BOX()+3
template PLASTIC_THIN_UP_BOX*(): untyped = fl_define_FL_PLASTIC_UP_BOX()+4
template PLASTIC_THIN_DOWN_BOX*(): untyped = fl_define_FL_PLASTIC_UP_BOX()+5
template PLASTIC_ROUND_UP_BOX*(): untyped = fl_define_FL_PLASTIC_UP_BOX()+6
template PLASTIC_ROUND_DOWN_BOX*(): untyped = fl_define_FL_PLASTIC_UP_BOX()+7

proc fl_define_FL_GTK_UP_BOX*(): Boxtype {.importc, header: flh.}
template GTK_UP_BOX*(): untyped = fl_define_FL_GTK_UP_BOX()
template GTK_DOWN_BOX*(): untyped = fl_define_FL_GTK_UP_BOX()+1
template GTK_UP_FRAME*(): untyped = fl_define_FL_GTK_UP_BOX()+2
template GTK_DOWN_FRAME*(): untyped = fl_define_FL_GTK_UP_BOX()+3
template GTK_THIN_UP_BOX*(): untyped = fl_define_FL_GTK_UP_BOX()+4
template GTK_THIN_DOWN_BOX*(): untyped = fl_define_FL_GTK_UP_BOX()+5
template GTK_THIN_UP_FRAME*(): untyped = fl_define_FL_GTK_UP_BOX()+6
template GTK_THIN_DOWN_FRAME*(): untyped = fl_define_FL_GTK_UP_BOX()+7
template GTK_ROUND_UP_BOX*(): untyped = fl_define_FL_GTK_UP_BOX()+8
template GTK_ROUND_DOWN_BOX*(): untyped = fl_define_FL_GTK_UP_BOX()+9

proc fl_define_FL_GLEAM_UP_BOX*(): Boxtype {.importc, header: flh.}
template GLEAM_UP_BOX*(): untyped = fl_define_FL_GLEAM_UP_BOX()
template GLEAM_DOWN_BOX*(): untyped = fl_define_FL_GLEAM_UP_BOX()+1
template GLEAM_UP_FRAME*(): untyped = fl_define_FL_GLEAM_UP_BOX()+2
template GLEAM_DOWN_FRAME*(): untyped = fl_define_FL_GLEAM_UP_BOX()+3
template GLEAM_THIN_UP_BOX*(): untyped = fl_define_FL_GLEAM_UP_BOX()+4
template GLEAM_THIN_DOWN_BOX*(): untyped = fl_define_FL_GLEAM_UP_BOX()+5
template GLEAM_ROUND_UP_BOX*(): untyped = fl_define_FL_GLEAM_UP_BOX()+6
template GLEAM_ROUND_DOWN_BOX*(): untyped = fl_define_FL_GLEAM_UP_BOX()+7

proc box*(b: Boxtype): Boxtype {.importc: "fl_box", header: flh.}
proc down*(b: Boxtype): Boxtype {.importc: "fl_down", header: flh.}
proc frame*(b: Boxtype): Boxtype {.importc: "fl_frame", header: flh.}

#const
  #FL_FRAME*       = FL_ENGRAVED_FRAME
  #FL_FRAME_BOX*   = FL_ENGRAVED_BOX
  #FL_CIRCLE_BOX*  = FL_ROUND_DOWN_BOX
  #FL_DIAMOND_BOX* = FL_DIAMOND_DOWN_BOX

type
  Labeltype* {.importc: "Fl_Labeltype", header: flh.} = cint
const
  NORMAL_LABEL*    = 0
  NO_LABEL*        = 1
  XSHADOW_LABEL*   = 2
  XENGRAVED_LABEL* = 3
  XEMBOSSED_LABEL* = 4
  XMULTI_LABEL*    = 5
  XICON_LABEL*     = 6
  XIMAGE_LABEL*    = 7
  FREE_LABELTYPE*  = 8

const
  SYMBOL_LABEL* = NORMAL_LABEL

proc fl_define_FL_SHADOW_LABEL*(): Labeltype {.importc, header: flh.}
proc fl_define_FL_ENGRAVED_LABEL*(): Labeltype {.importc, header: flh, header: flh.}
proc fl_define_FL_EMBOSSED_LABEL*(): Labeltype {.importc, header: flh.}

template SHADOW_LABEL*(): untyped = fl_define_FL_SHADOW_LABEL()
template ENGRAVED_LABEL*(): untyped = fl_define_FL_ENGRAVED_LABEL()
template EMBOSSED_LABEL*(): untyped = fl_define_FL_EMBOSSED_LABEL()

type
  Align* {.importc: "Fl_Align", header: flh.} = cuint
const
  ALIGN_CENTER*             = 0
  ALIGN_TOP*                = 1
  ALIGN_BOTTOM*             = 2
  ALIGN_LEFT*               = 4
  ALIGN_RIGHT*              = 8
  ALIGN_INSIDE*             = 16
  ALIGN_TEXT_OVER_IMAGE*    = 0x0020
  ALIGN_IMAGE_OVER_TEXT*    = 0x0000
  ALIGN_CLIP*               = 64
  ALIGN_WRAP*               = 128
  ALIGN_IMAGE_NEXT_TO_TEXT* = 0x0100
  ALIGN_TEXT_NEXT_TO_IMAGE* = 0x0120
  ALIGN_IMAGE_BACKDROP*     = 0x0200
  ALIGN_TOP_LEFT*           = ALIGN_TOP or ALIGN_LEFT
  ALIGN_TOP_RIGHT*          = ALIGN_TOP or ALIGN_RIGHT
  ALIGN_BOTTOM_LEFT*        = ALIGN_BOTTOM or ALIGN_LEFT
  ALIGN_BOTTOM_RIGHT*       = ALIGN_BOTTOM or ALIGN_RIGHT
  ALIGN_LEFT_TOP*           = 0x0007
  ALIGN_RIGHT_TOP*          = 0x000b
  ALIGN_LEFT_BOTTOM*        = 0x000d
  ALIGN_RIGHT_BOTTOM*       = 0x000e
  ALIGN_NOWRAP*             = 0
  ALIGN_POSITION_MASK*      = 0x000f
  ALIGN_IMAGE_MASK*         = 0x0320

type
  Font* {.importc: "Fl_Font", header: flh.} = cint
const
  HELVETICA*              = 0
  HELVETICA_BOLD*         = 1
  HELVETICA_ITALIC*       = 2
  HELVETICA_BOLD_ITALIC*  = 3
  COURIER*                = 4
  COURIER_BOLD*           = 5
  COURIER_ITALIC*         = 6
  COURIER_BOLD_ITALIC*    = 7
  TIMES*                  = 8
  TIMES_BOLD*             = 9
  TIMES_ITALIC*           = 10
  TIMES_BOLD_ITALIC*      = 11
  SYMBOL*                 = 12
  SCREEN*                 = 13
  SCREEN_BOLD*            = 14
  ZAPF_DINGBATS*          = 15
  FREE_FONT*              = 16
  BOLD*                   = 1
  ITALIC*                 = 2
  BOLD_ITALIC*            = 3

type
  Fontsize* {.importc: "Fl_Fontsize", header: flh.} = cint

var FL_NORMAL_SIZE* {.importc: "FL_NORMAL_SIZE".}: Fontsize

type
  Color* {.importc: "Fl_Color", header: flh.} = cint
const
  FOREGROUND_COLOR*  = 0
  BACKGROUND2_COLOR* = 7
  INACTIVE_COLOR*    = 8
  SELECTION_COLOR*   = 15
  GRAY0*             = 32
  DARK3*             = 39
  DARK2*             = 45
  DARK1*             = 47
  BACKGROUND_COLOR*  = 49
  LIGHT1*            = 50
  LIGHT2*            = 52
  LIGHT3*            = 54
  BLACK*             = 56
  RED*               = 88
  GREEN*             = 63
  YELLOW*            = 95
  BLUE*              = 216
  MAGENTA*           = 248
  CYAN*              = 223
  DARK_RED*          = 72
  DARK_GREEN*        = 60
  DARK_YELLOW*       = 76
  DARK_BLUE*         = 136
  DARK_MAGENTA*      = 152
  DARK_CYAN*         = 140
  WHITE*             = 255

const
  FREE_COLOR*     = 16
  NUM_FREE_COLOR* = 16
  GRAY_RAMP*      = 32
  NUM_GRAY*       = 24
  GRAY*           = BACKGROUND_COLOR
  COLOR_CUBE*     = 56
  NUM_RED*        = 5
  NUM_GREEN*      = 8
  NUM_BLUE*       = 5

proc inactive*(c: Color): Color {.importc: "fl_inactive", header: flh.}
proc contrast*(fg, bg: Color): Color {.importc: "fl_contrast", header: flh.}
proc color_average*(c1, c2: Color; weight: cfloat): Color {.importc: "fl_color_average", header: flh.}
proc lighter*(c: Color): Color {.importc: "fl_lighter", header: flh.}
proc darker*(c: Color): Color {.importc: "fl_darker", header: flh.}
proc rgb_color*(r, g, b: cuchar): Color {.importc: "fl_rgb_color", header: flh.}
proc rgb_color*(g: cuchar): Color {.importc: "fl_rgb_color", header: flh.}
proc gray_ramp*(i: cint): Color {.importc: "fl_gray_ramp", header: flh.}
proc color_cube*(r, g, b: cint): Color {.importc: "fl_color_cube", header: flh.}

type
  Cursor* {.importc: "Fl_Cursor", header: flh.} = cint
const
  CURSOR_DEFAULT* = 0
  CURSOR_ARROW*   = 35
  CURSOR_CROSS*   = 66
  CURSOR_WAIT*    = 76
  CURSOR_INSERT*  = 77
  CURSOR_HAND*    = 31
  CURSOR_HELP*    = 47
  CURSOR_MOVE*    = 27
  CURSOR_NS*      = 78
  CURSOR_WE*      = 79
  CURSOR_NWSE*    = 80
  CURSOR_NESW*    = 81
  CURSOR_N*       = 70
  CURSOR_NE*      = 69
  CURSOR_E*       = 49
  CURSOR_SE*      = 8
  CURSOR_S*       = 9
  CURSOR_SW*      = 7
  CURSOR_W*       = 36
  CURSOR_NW*      = 68
  CURSOR_NONE*    = 255

const
  FL_READ*   = 1
  FL_WRITE*  = 4
  FL_EXCEPT* = 8

type
  Mode* {.importc: "Fl_Mode", header: flh.} = cint
const
  RGB*         = 0
  INDEX*       = 1
  SINGLE*      = 0
  DOUBLE*      = 2
  ACCUM*       = 4
  ALPHA*       = 8
  DEPTH*       = 16
  STENCIL*     = 32
  RGB8*        = 64
  MULTISAMPLE* = 128
  STEREO*      = 256
  FAKE_SINGLE* = 512
  OPENGL3*     = 1024

type
  Damage* {.importc: "Fl_Damage", header: flh.} = cint
const
  DAMAGE_CHILD*    = 0x01
  DAMAGE_EXPOSE*   = 0x02
  DAMAGE_SCROLL*   = 0x04
  DAMAGE_OVERLAY*  = 0x08
  DAMAGE_USER1*    = 0x10
  DAMAGE_USER2*    = 0x20
  DAMAGE_ALL*      = 0x80

