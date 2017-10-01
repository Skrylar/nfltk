
proc label*(self: Image; m: Menu_Item) {.importcpp: "#.label(@)", header: "FL/Fl_Image.H".}
proc label*(self: Pixmap; m: Menu_Item) {.importcpp: "#.label(@)", header: "FL/Fl_Menu.H".}
proc label*(self: RGB_Image; m: Menu_Item) {.importcpp: "#.label(@)", header: "FL/Fl_RGB_Image.H".}

