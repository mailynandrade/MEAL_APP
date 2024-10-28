import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String appUrl = dotenv.env['APP_URL'] ?? 'No hay URL';
}