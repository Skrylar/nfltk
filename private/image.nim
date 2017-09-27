
const
  flh = "FL/Fl_Image.H"
type
  ImageObj* {.importc: "Fl_Image", header: flh.} = object
  Image* = ptr ImageObj

  RGB_Image* {.importc: "Fl_RGB_Image*", header: flh.} = object

