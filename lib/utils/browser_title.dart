import 'package:flutter/foundation.dart' show kIsWeb;

// Условный импорт для веб-платформы
import 'dart:html' as html if (dart.library.io) 'dart:io';

/// Утилита для изменения заголовка вкладки браузера
/// 
/// Работает только на веб-платформе. На других платформах методы ничего не делают.
class BrowserTitle {
  /// Изменить заголовок вкладки браузера
  /// 
  /// Пример использования:
  /// ```dart
  /// BrowserTitle.set('Название статьи');
  /// BrowserTitle.set('Главная страница | Мой сайт');
  /// ```
  static void set(String title) {
    if (kIsWeb) {
      html.document.title = title;
    }
  }

  /// Получить текущий заголовок вкладки
  static String get() {
    if (kIsWeb) {
      return html.document.title;
    }
    return '';
  }

  /// Установить заголовок с базовым названием сайта
  /// 
  /// Пример:
  /// ```dart
  /// BrowserTitle.setWithBase('Название статьи'); 
  /// // Результат: "Название статьи | Screen Size Monitor"
  /// ```
  static void setWithBase(String title, {String baseTitle = 'Screen Size Monitor'}) {
    if (kIsWeb) {
      html.document.title = '$title | $baseTitle';
    }
  }
}

