import 'package:adminease/core/app_colors.dart';
import 'package:flutter/material.dart';

class ColoredCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool loading;
  final GlobalKey<FormState>? formKey; // Add form key

  const ColoredCustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading
          ? null
          : () {
              if (formKey == null ||
                  (formKey!.currentState != null &&
                      formKey!.currentState!.validate())) {
                onPressed();
              }
            },
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: loading ? AppColors.secondaryColor : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: loading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
        ),
      ),
    );
  }
}
