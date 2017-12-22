# Nimized Fast Light Toolkit

A wrapper for the [Fast Light Toolkit](http://www.fltk.org/index.php), for the Nim language. We target FLTK 1.3.

# Notes

Reference types have been removed. NFLTK deals only in pointers to widgets, and any `foo&` parameters have been bound to their equivalents using pointers.

Setters obey Nim convention for `foo=`, except for those which have more than one parameter. There are probably a few setters that have been missed, consider those bugs.

FLTK does not have any fancy layout systems built in; you will need to bring your own.

Overridable objects are not implemented in this version; they will be needed for ex. custom OpenGL rendering, but that requires some research and testing.

Devices are partially bound but not complete. Drawing commands involving regions are also not implemented (they have OS specific requirements--needs to be handled.)

This wrapper is not well tested or documented. Be wary.
