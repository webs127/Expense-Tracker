import 'package:expense_tracker/app/route.dart';
import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/image_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/ui/auth/controller/auth_controller.dart';
import 'package:expense_tracker/widgets/app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

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
                      height: 24,
                    ),
                    const CustomTextFormField(
                      hintText: "Password",
                      icon: Icons.lock_outline,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AppButton(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      onPressed: () {
                        Navigator.pushNamed(context, RouteManager.landing);
                      },
                      color: ColorManager.white,
                      text: "LOGIN",
                      gradient: LinearGradient(
                          colors: [
                            ColorManager.primaryLight1,
                            ColorManager.primary,
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: const [0, .7]),
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
                    AppButton(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      text: "CONTINUE WITH GOOGLE",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppButton(
                      width: MediaQuery.of(context).size.width,
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
                            text: "Register Here",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.read<AuthController>().changeSatate();
                              },
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
