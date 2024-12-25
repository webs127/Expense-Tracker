import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color? color;
  final double width;
  final Gradient? gradient;
  final double height;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
    this.gradient,
    this.backgroundColor,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeIn,
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(
              color: ColorManager.white,
            ),
            gradient: gradient,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.custom(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: color ?? ColorManager.dark),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final IconData icon;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: ColorManager.dark,
      validator: validator ?? (value) {
        if (value == null || value.isEmpty) {
          return "Required";
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.grey5,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: ColorManager.primaryLight),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: ColorManager.primaryLight)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: ColorManager.primaryLight),
        ),
        prefixIcon: Icon(icon),
        hintText: hintText,
        hintStyle: AppTextStyles.custom(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: ColorManager.grey7),
      ),
    );
  }
}
