import 'package:adminease/core/app_colors.dart';
import 'package:adminease/models/user/user_model.dart';
import 'package:adminease/screens/admin/user/user_page.dart';
import 'package:adminease/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class AdminProvider extends ChangeNotifier {
  late Box<UserModel> userBox;
  var users = <UserModel>[];
  bool addUserLoader = false;

  AdminProvider() {
    userBox = Hive.box<UserModel>('userBox');
    loadUsers();
  }

  void loadUsers() {
    users = userBox.values.toList();
  }

  Future<void> createUser(
    String userId,
    String name,
    String emailId,
    String password,
    BuildContext context,
  ) async {
    try {
      addUserLoader = true;
      notifyListeners();

      final isExistingUser =
          userBox.values.any((user) => user.emailId == emailId);

      if (isExistingUser) {
        showCustomSnackBar(
          context,
          title: "Already Registered",
          message: "User with this Email already Exists",
        );
      } else {
        final userModel = UserModel(userId, name, emailId, password);
        await userBox.add(userModel);
        loadUsers();

        if (context.mounted) {
          showCustomSnackBar(
            context,
            title: "Added Successfully",
            message: "User Created Successfully",
            backgroundColor: AppColors.green,
            icon: Icons.check_circle_outline,
          );

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const UserPage()),
            (route) => route.isFirst,
          );
        }
      }

      print("user added successfulluy");
    } catch (e) {
      print("error: $e");
      if (context.mounted) {
        showCustomSnackBar(
          context,
          title: "Error Occured",
          message: e.toString(),
        );
      }
    } finally {
      addUserLoader = false;
      notifyListeners();
    }
  }
}
