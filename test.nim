
import fltk as fl

fl.warning "I have no idea what I am doing."

var btn = make_button(0, 0, 64, 64, "Butt")
btn.box = fl.Up_box
btn.labelfont = fl.Helvetica
btn.labelsize = 12
btn.labeltype = fl.Normal_label
btn.label = "cocks".cstring

var btn2 = make_button(64, 64, 64, 64, "Arse")

var win = make_window(320, 240, "Test window.")
win.labelfont = fl.Helvetica
win.labelsize = 12

win.begin()
win.add btn
win.add btn2
win.endd()
win.show(0, nil)

discard fl.run()

