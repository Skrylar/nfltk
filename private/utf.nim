
const
  flh_utf = "FL/fl_utf.H"

type
  flwchar* = uint16

# NB: these got to keep their prefixes because they are really special case, and nim programs aren't likely to need them most of the time

proc fl_utf8bytes*(self: TextBuffer; ucs: cuint): cint {.importcpp: "#.fl_utf8bytes(@)", header: flh_utf.}
proc fl_utf8len*(self: TextBuffer; c: char): cint {.importcpp: "#.fl_utf8len(@)", header: flh_utf.}
proc fl_utf8len1*(self: TextBuffer; c: char): cint {.importcpp: "#.fl_utf8len1(@)", header: flh_utf.}
proc fl_utf_nb_char*(self: TextBuffer; cstring: cuint buf; len: cint): cint {.importcpp: "#.fl_utf_nb_char(@)", header: flh_utf.}
proc fl_utf8decode*(self: TextBuffer; p, end: cstring; len: out cint): cuint {.importcpp: "#.fl_utf8decode(@)", header: flh_utf.}
proc fl_utf8encode*(self: TextBuffer; ucs: cuint; buf: cstring): cint {.importcpp: "#.fl_utf8encode(@)", header: flh_utf.}
proc fl_utf8fwd*:self: TextBuffer;  cstring(p, start, end: cstring):  {.importcpp: "#.fl_utf8fwd(@)", header: flh_utf.}
proc fl_utf8back*:self: TextBuffer;  cstring(p, start, end: cstring):  {.importcpp: "#.fl_utf8back(@)", header: flh_utf.}
proc fl_ucs_to_Utf16*(self: TextBuffer; ucs: cuint; dst: out cushort; dstlen: cuint): cuint {.importcpp: "#.fl_ucs_to_Utf16(@)", header: flh_utf.}
cuint fl_utf8toUtf16(const cstring src, cuint srclen, cuint short* dst, cuint dstlen)
proc fl_utf8towc*(self: TextBuffer; src: cstring; srclen: cuint; dst: flwchar; dstlen: cuint): cuint {.importcpp: "#.fl_utf8towc(@)", header: flh_utf.}
proc fl_utf8fromwc*(self: TextBuffer; dst: cstring; dstlen: cuint; src: flwchar; srclen: cuint): cuint {.importcpp: "#.fl_utf8fromwc(@)", header: flh_utf.}
proc fl_utf8toa* self: TextBuffer; (src: cstring; srclen: cuint; dst: cstring; dstlen: cuint): cuint {.importcpp: "#.fl_utf8toa(@)", header: flh_utf.}
proc fl_utf8froma* self: TextBuffer; (dst: cstring; dstlen: cuint; src: cstring; srclen: cuint): cuint {.importcpp: "#.fl_utf8froma(@)", header: flh_utf.}
proc fl_utf8locale*(self: TextBuffer; void): cint {.importcpp: "#.fl_utf8locale(@)", header: flh_utf.}
proc fl_utf8test*(self: TextBuffer; src: cstring; len: cuint): cint {.importcpp: "#.fl_utf8test(@)", header: flh_utf.}
proc fl_wcwidth_*(self: TextBuffer; ucs: cuint): cint {.importcpp: "#.fl_wcwidth_(@)", header: flh_utf.}
proc fl_wcwidth*(self: TextBuffer; src: cstring): cint {.importcpp: "#.fl_wcwidth(@)", header: flh_utf.}
proc fl_nonspacing*(self: TextBuffer; ucs: cuint): cuint {.importcpp: "#.fl_nonspacing(@)", header: flh_utf.}
proc fl_utf8to_mb*(self: TextBuffer; src: cstring; srclen: cuint; dst: cstring; dstlen: cuint): cuint {.importcpp: "#.fl_utf8to_mb(@)", header: flh_utf.}
proc fl_utf2mbcs*(self: TextBuffer; src: cstring): cstring {.importcpp: "#.fl_utf2mbcs(@)", header: flh_utf.}
proc fl_utf8from_mb*(self: TextBuffer; dst: cstring; dstlen: cuint; src: cstring; srclen: cuint): cuint {.importcpp: "#.fl_utf8from_mb(@)", header: flh_utf.}
proc fl_utf_strncasecmp*(self: TextBuffer; s1, s2: cstring; n: cint): cint {.importcpp: "#.fl_utf_strncasecmp(@)", header: flh_utf.}
proc fl_utf_strcasecmp*(self: TextBuffer; s1, s2: cstring): cint {.importcpp: "#.fl_utf_strcasecmp(@)", header: flh_utf.}
proc fl_tolower*(self: TextBuffer; ucs: cuint): cint {.importcpp: "#.fl_tolower(@)", header: flh_utf.}
proc fl_toupper*(self: TextBuffer; ucs: cuint): cint {.importcpp: "#.fl_toupper(@)", header: flh_utf.}
proc fl_utf_tolower*(self: TextBuffer; cstring: cuint str; len: cint; buf: cstring): cint {.importcpp: "#.fl_utf_tolower(@)", header: flh_utf.}
proc fl_utf_toupper*(self: TextBuffer; cstring: cuint str; len: cint; buf: cstring): cint {.importcpp: "#.fl_utf_toupper(@)", header: flh_utf.}
proc fl_chmod*(self: TextBuffer; f: cstring; mode: cint): cint {.importcpp: "#.fl_chmod(@)", header: flh_utf.}
proc fl_access*(self: TextBuffer; f: cstring; mode: cint): cint {.importcpp: "#.fl_access(@)", header: flh_utf.}
#proc fl_stat*(path: cstring; struct stat* buffer ): cint {.importcpp: "fl_stat(@)", header: flh_utf.}
proc fl_getcwd*(self: TextBuffer;  buf: cstring; maxlen: cint): cstring {.importcpp: "#.fl_getcwd(@)", header: flh_utf.}
#FILE *fl_fopen(const char *f, const char *mode)
proc fl_system*(self: TextBuffer; f: cstring): cint {.importcpp: "#.fl_system(@)", header: flh_utf.}
proc fl_execvp*(self: TextBuffer; file: cstring; cstring *argv): cint {.importcpp: "#.fl_execvp(@)", header: flh_utf.}
proc fl_open*(self: TextBuffer; f: cstring; o: cint): cint {.importcpp: "#.fl_open(@)", header: flh_utf, varargs.}
proc fl_unlink*(self: TextBuffer; f: cstring): cint {.importcpp: "#.fl_unlink(@)", header: flh_utf.}
proc fl_rmdir*(self: TextBuffer; f: cstring): cint {.importcpp: "#.fl_rmdir(@)", header: flh_utf.}
proc fl_getenv*(self: TextBuffer; name: cstring): cstring {.importcpp: "#.fl_getenv(@)", header: flh_utf.}
proc fl_mkdir*(self: TextBuffer; f: cstring; mode: cint): cint {.importcpp: "#.fl_mkdir(@)", header: flh_utf.}
proc fl_rename*(self: TextBuffer; f, t: cstring): cint {.importcpp: "#.fl_rename(@)", header: flh_utf.}
proc fl_make_path_for_file*(self: TextBuffer; path: cstring ): void {.importcpp: "#.fl_make_path_for_file(@)", header: flh_utf.}
proc fl_make_path*(self: TextBuffer; path: cstring ): char {.importcpp: "#.fl_make_path(@)", header: flh_utf.}

when defined(windows):
  cstring fl_utf8_to_locale(const char *s, int len, cuint codepage);
  cstring fl_locale_to_utf8(const char *s, int len, cuint codepage);