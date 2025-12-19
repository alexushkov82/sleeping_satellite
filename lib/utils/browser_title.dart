import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html if (dart.library.io) 'dart:io';

class BrowserTitle {

  static void set(String title) {
    if (kIsWeb) {
      html.document.title = title;
    }
  }

  static String get() {
    if (kIsWeb) {
      return html.document.title;
    }
    return '';
  }
}

