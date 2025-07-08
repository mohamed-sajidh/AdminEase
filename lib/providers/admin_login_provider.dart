import 'package:adminease/services/admin_auth_service.dart';
import 'package:adminease/widgets/error_snackbar.dart';
import 'package:adminease/widgets/success_snackbar.dart';
import 'package:flutter/material.dart';

class AdminLoginProvider extends ChangeNotifier {
  bool isLoading = false;

  void adminLogin(
    String emailId,
    String password,
    BuildContext context,
  ) async {
    try {
      isLoading = true;
      notifyListeners();

      String? response = AdminAuthService.adminLogin(emailId, password);

      if (response == null) {
        showSuccessMessage(context, "You're in! Have a great time");
      } else {
        showOverlayError(context, response);
      }
    } catch (e) {
      print("error:- $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
