
{.deadCodeElim: off.} # just for now

import enumerations
export enumerations

const
  flh = "FL/Fl.H"

var fl_local_ctrl* {.importc, header: flh.}: cstring
var fl_local_meta* {.importc, header: flh.}: cstring
var fl_local_alt* {.importc, header: flh.}: cstring
var fl_local_shift* {.importc, header: flh.}: cstring

when defined(Windows) and defined(amd64):
  type
    Socket* {.importc: "FL_SOCKET", header: flh.} = int64
else:
  type
    Socket* {.importc: "FL_SOCKET", header: flh.} = cint

type
  Label* {.importc: "Fl_Label", header: flh.} = distinct pointer
  Window* {.importc: "Fl_Window", header: flh.} = distinct pointer

type
  Fl_Label_Draw_F* {.importc: "Fl_Label_Draw_F", header: flh.} = proc(label: Label; x, y, w, h: cint; align: Align)
  Fl_Label_Measure_F* {.importc: "Fl_Label_Measure_F", header: flh.} = proc(label: Label; width, height: out cint)
  Fl_Box_Draw_F* {.importc: "Fl_Box_Draw_F", header: flh.} = proc(x, y, w, h: cint; color: Color)
  Fl_Timeout_Handler* {.importc: "Fl_Timeout_Handler", header: flh.} = proc(data: pointer)
  Fl_Awake_Handler* {.importc: "Fl_Awake_Handler", header: flh.} = proc(data: pointer)
  Fl_Idle_Handler* {.importc: "Fl_Idle_Handler", header: flh.} = proc(data: pointer)
  Fl_Old_Idle_Handler* {.importc: "Fl_Old_Idle_Handler", header: flh.} = proc()
  Fl_FD_Handler* {.importc: "Fl_FD_Handler", header: flh.} = proc(fd: Socket; data: pointer)
  Fl_Event_Handler* {.importc: "Fl_Event_Handler", header: flh.} = proc(event: cint): int
  Fl_System_Handler* {.importc: "Fl_System_Handler", header: flh.} = proc(event, data: pointer): int
  Fl_Abort_Handler* {.importc: "Fl_Abort_Handler", header: flh.} = proc(format: cstring) {.varargs.}
  Fl_Atclose_Handler* {.importc: "Fl_Atclose_Handler", header: flh.} = proc(window: Window, data: pointer)
  Fl_Args_Handler* {.importc: "Fl_Args_Handler", header: flh.} = proc(argc: cint; argv: ptr cstring; i: out cint): int
  Fl_Event_Dispatch* {.importc: "Fl_Event_Dispatch", header: flh.} = proc(event: cint; w: Window): int
  Fl_Clipboard_Notify_Handler* {.importc: "Fl_Clipboard_Notify_Handler", header: flh.} = proc(source: cint; data: pointer)

