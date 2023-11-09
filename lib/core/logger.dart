import 'package:flutter/foundation.dart';

class Logger {
  static void info(dynamic type, dynamic message) {
    if (kDebugMode) {
      print('ℹ️ INFO - $type $message');
    }
  }

  static void error(dynamic type, dynamic message) {
    if (kDebugMode) {
      print('❌ ERROR - $type $message');
    }
  }

  static void warning(dynamic type, dynamic message) {
    if (kDebugMode) {
      print('⚠️ WARNING - $type $message');
    }
  }

  static void success(dynamic type, dynamic message) {
    if (kDebugMode) {
      print('✅ SUCCESS - $type $message');
    }
  }
}
