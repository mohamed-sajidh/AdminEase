import 'package:adminease/core/config.dart';

class AdminAuthService {
  static String? adminLogin(String emailId, String password) {
    final String adminEmail = AppConfig.adminEmail;
    final String adminPassword = AppConfig.adminPassword;

    if (emailId == adminEmail && password == adminPassword) {
      return null;
    } else {
      return 'invalid email or password';
    }
  }
}
