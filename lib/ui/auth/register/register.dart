import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/image_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/ui/auth/controller/auth_controller.dart';
import 'package:expense_tracker/widgets/app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              Consumer<AuthController>(
                builder: (context, register, __) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: register.key,
                        child: Column(
                      children: [
                        CustomTextFormField(
                          controller: register.email,
                          hintText: "Email Address",
                          icon: Icons.mail_outlined,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                controller: register.gender,
                                hintText: "Gender",
                                icon: Icons.person_outline,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomTextFormField(
                                controller: register.age,
                                hintText: "age",
                                icon: Icons.person_outline,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                          hintText: "Username",
                          controller: register.username,
                          icon: Icons.person_outline,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                          controller: register.password,
                          hintText: "Password",
                          icon: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                          controller: register.confirmPassword,
                          hintText: "Confirm Password",
                          icon: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        AppButton(
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          onPressed: () {
                            register.validateUser();
                          },
                          color: ColorManager.white,
                          text: "REGISTER",
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
                          height: 28,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Already Have An Account? ",
                                style: AppTextStyles.custom(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: ColorManager.dark),
                                children: [
                              TextSpan(
                                text: "Login Here",
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
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
