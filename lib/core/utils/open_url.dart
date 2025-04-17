import 'dart:js_interop' as js;

@js.JS('window.open')
external void windowOpen(String url, String target, String? features);
