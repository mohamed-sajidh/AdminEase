import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String adminEmail = dotenv.env['ADMIN_EMAIL'] ?? 'admin@gmail.com';
  static String adminPassword = dotenv.env['ADMIN_PASSSWORD'] ?? '12345';
}
