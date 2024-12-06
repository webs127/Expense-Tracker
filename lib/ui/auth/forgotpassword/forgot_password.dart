import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/widgets/app_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text(
              "Create Your New Password",
              style: AppTextStyles.custom(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: ColorManager.dark),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Your new password must be different from previous password.",
              style: AppTextStyles.custom(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.grey7),
            ),
            const SizedBox(
              height: 48,
            ),
            const CustomTextFormField(
              hintText: "New password",
              icon: Icons.lock_outline,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextFormField(
              hintText: "Confirm password",
              icon: Icons.lock_outline,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.person_outline),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Must not contain your name or email",
                      style: AppTextStyles.custom(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.grey7),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(Icons.person_outline),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "At least 8 characters",
                      style: AppTextStyles.custom(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.grey7),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(Icons.person_outline),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Contains a symbol or a number",
                      style: AppTextStyles.custom(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.grey7),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      bottomSheet: AppButton(
        width: 327,
        height: 55,
        onPressed: () {},
        color: ColorManager.white,
        text: "RESET PASSWORD",
        backgroundColor: ColorManager.primary,
      ),
    );
  }
}
