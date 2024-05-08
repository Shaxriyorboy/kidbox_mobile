import 'package:logger/logger.dart';

import 'network_service.dart';

class LogService {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
  );

  static void d(String message) {
    if (NetworkService.isTester) _logger.d(message);
  }

  static void i(String message) {
    if (NetworkService.isTester) _logger.i(message);
  }

  static void w(String message) {
    if (NetworkService.isTester) _logger.w(message);
  }

  static void e(String message) {
    if (NetworkService.isTester) _logger.e(message);
  }
}
