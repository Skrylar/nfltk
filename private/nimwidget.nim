
import widget

{.emit: """
#include <FL/Fl_Widget.H>

// define some types that we must shuffle over to nim
typedef void* userdata;
typedef void (*nimcb_draw)(userdata);
typedef int (*nimcb_handle)(int event, userdata);
typedef void (*nimcb_resize)(int x, int y, int w, int h, userdata);

class NimWidget : public Fl_Widget {
public:
  // stuff that we have to shuffle over to nim
  nimcb_draw draw_call;
  userdata draw_ud;
  nimcb_handle handle_call;
  userdata handle_ud;
  nimcb_resize resize_call;
  userdata resize_ud;

  // book-keeping on the C++ side
  NimWidget(int x, int y, int w, int h, const char* label) :
    Fl_Widget(x, y, w, h, label)
  {
    // nothing to do
  }

  virtual ~NimWidget()
  {
    // nothing to do
  }

  virtual int handle(int event) {
    return this->handle_call(event, this->handle_ud);
  }

  virtual void draw() {
    this->draw_call(this->draw_ud);
  }

  virtual void resize(int x, int y, int w, int h) {
    this->resize_call(x, y, w, h, this->resize_ud);
  }
};
""".}

type
  DrawProc* = proc() {.closure.}
  HandleProc* = proc(event: cint): cint {.closure.}
  ResizeProc* = proc(x, y, w, h: cint) {.closure.}

  NimWidgetImpl* {.importcpp: "Fl_Widget", nodecl.} = object of Widget
  NimWidget* = ptr NimWidgetImpl

proc make_nim_widget_inner(x, y, w, h: cint; label: cstring): NimWidget {.importcpp: "new NimWidget(@)".}

proc `handle=`*(self: NimWidget; on: HandleProc) =
  {.emit: ["reinterpret_cast<NimWidget*>(", self, ")->handle_call = ", rawproc(on), ";"].}
  {.emit: ["reinterpret_cast<NimWidget*>(", self, ")->handle_ud = ", rawenv(on), ";"].}

proc `draw=`*(self: NimWidget; on: DrawProc) =
  {.emit: ["reinterpret_cast<NimWidget*>(", self, ")->draw_call = ", rawproc(on), ";"].}
  {.emit: ["reinterpret_cast<NimWidget*>(", self, ")->draw_ud = ", rawenv(on), ";"].}

proc `resize=`*(self: NimWidget; on: ResizeProc) =
  {.emit: ["reinterpret_cast<NimWidget*>(", self, ")->resize_call = ", rawproc(on), ";"].}
  {.emit: ["reinterpret_cast<NimWidget*>(", self, ")->resize_ud = ", rawenv(on), ";"].}

proc make_nim_widget*(x, y, w, h: cint; label: cstring; handle: HandleProc; draw: DrawProc; resize: ResizeProc): NimWidget =
  # sanity testing
  assert(handle != nil)
  assert(draw != nil)
  assert(resize != nil)
  # create the underlying object
  result = make_nim_widget_inner(x, y, w, h, label)
  # assign delegates
  result.handle = handle
  result.draw = draw
  result.resize = resize
