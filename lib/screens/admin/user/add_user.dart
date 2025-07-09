import 'package:adminease/core/app_colors.dart';
import 'package:adminease/providers/admin_provider.dart';
import 'package:adminease/widgets/colored_cutom_button.dart';
import 'package:adminease/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  late TextEditingController userIdTextController;
  late TextEditingController nameTextController;
  late TextEditingController emailIdTextController;
  late TextEditingController passwordTextController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    userIdTextController = TextEditingController();
    nameTextController = TextEditingController();
    emailIdTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    userIdTextController.dispose();
    nameTextController.dispose();
    emailIdTextController.dispose();
    passwordTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: AppBar(
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    title: const Text(
                      'Add User',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
          Form(
            key: formKey,
            child: Positioned(
              top: 120,
              left: 20,
              right: 20,
              bottom: 20,
              child: Container(
                height: 620,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MandatoryTextField(
                                controller: userIdTextController,
                                label: 'UserId',
                                isRequired: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Required User Id';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              MandatoryTextField(
                                controller: nameTextController,
                                label: 'Name',
                                isRequired: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Required Name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              MandatoryTextField(
                                controller: emailIdTextController,
                                label: 'Email Id',
                                isRequired: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Required Email Id';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              MandatoryTextField(
                                controller: passwordTextController,
                                label: 'Password',
                                isRequired: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Required Password';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: Consumer<AdminProvider>(
          builder: (context, provider, child) {
            return ColoredCustomButton(
              text: "Save",
              onPressed: () {
                provider.createUser(
                  userIdTextController.text,
                  nameTextController.text,
                  emailIdTextController.text,
                  passwordTextController.text,
                  context,
                );
              },
              loading: provider.addUserLoader,
              formKey: formKey,
            );
          },
        ),
      ),
    );
  }
}
