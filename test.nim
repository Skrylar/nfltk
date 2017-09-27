
import fltk as fl

fl.warning "I have no idea what I am doing."

var win = make_window(320, 240, "Test window.")
win.show(0, nil)

discard fl.run()

