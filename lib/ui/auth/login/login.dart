import 'package:expense_tracker/app/route.dart';
import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/image_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                  width: 100,
                  height: 100,
                  child: SvgPicture.asset(ImageManager.applogo)),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                    child: Column(
                  children: [
                    const CustomTextFormField(
                      hintText: "Username",
                      icon: Icons.person_outline,
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    const CustomTextFormField(
                      hintText: "Password",
                      icon: Icons.lock_outline,
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    AppButton(
                      width: 327,
                      height: 55,
                      onPressed: () {},
                      color: ColorManager.white,
                      text: "LOGIN",
                      backgroundColor: ColorManager.primary,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouteManager.forgotPassword);
                      },
                      child: Text(
                        "FORGOT PASSWORD",
                        style: AppTextStyles.custom(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: ColorManager.grey7),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Or",
                      style: AppTextStyles.custom(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.dark),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const AppButton(
                      width: 327,
                      height: 55,
                      text: "CONTINUE WITH GOOGLE",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppButton(
                      width: 327,
                      height: 55,
                      text: "CONTINUE WITH APPLE",
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Don't Have An Account? ",
                            style: AppTextStyles.custom(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.dark),
                            children: [
                          TextSpan(
                            text: "Register here",
                            style: AppTextStyles.custom(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.primary),
                          )
                        ])),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
