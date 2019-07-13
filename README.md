# Nimized Fast Light Toolkit

A wrapper for the [Fast Light Toolkit](http://www.fltk.org/index.php), for the Nim language.

This library is compatible with the following versions:

||Version|
|-|-|
|FLTK|1.3|
|Nim|0.20|

# Notes

- Reference types have been removed. Anywhere that `Widget&` would have appeared in FLTK code is now a `ptr Widget`.
- Getters and setters follow Nim convention. `set_something` is bound as `something=` except where it was not compatible.
- FLTK does not have any fancy layout systems built in; you will need to bring your own.
- You can't override classes. So things like subclassing an OpenGL view to provide your own draw function doesn't work.
- Devices are partially bound but not complete. Drawing commands involving regions are also not implemented (they have OS specific requirements--needs to be handled.)
- This wrapper is not explicitly documented, but follows [the original FLTK documentation closely](https://www.fltk.org/doc-1.3/index.html).
