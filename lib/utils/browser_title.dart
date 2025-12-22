import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:web/web.dart' as web;

class BrowserTitle {
  static void set(String title) {
    if (kIsWeb) {
      web.document.title = title;
    }
  }

  static String get() {
    if (kIsWeb) {
      return web.document.title;
    }
    return '';
  }
}

