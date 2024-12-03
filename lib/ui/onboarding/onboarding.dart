import 'package:expense_tracker/app/route.dart';
import 'package:expense_tracker/core/manager/image_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/ui/onboarding/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            SvgPicture.asset(ImageManager.applogohoriz),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 380,
              child:
                  Consumer<OnboardingController>(builder: (context, data, __) {
                return PageView.builder(
                    controller: data.pageController,
                    onPageChanged: data.onchanged,
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      var item = data.object;
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            SizedBox(
                                width: 251,
                                height: 300,
                                child: SvgPicture.asset(item.imageUrl)),
                            Text(
                              item.title,
                              style: AppTextStyles.custom(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              )
                            ),
                            Text(
                              item.description,
                              style: AppTextStyles.regular,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    });
              }),
            ),
            const SizedBox(height: 7,),
            Consumer<OnboardingController>(builder: (context, data, __) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      data.length,
                      (index) => Container(
                            margin: const EdgeInsets.only(right: 3),
                            decoration: BoxDecoration(
                                color: (data.currentIndex == index)
                                    ? Colors.blue
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(100)),
                            width: 20,
                            height: 7,
                          )),
                );
              }
            ),
            const SizedBox(height: 50,),
            MaterialButton(
              minWidth: 327,
              height: 48,
              elevation: 10,
              color: Colors.blue,
              shape: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Text(
                              "LET'S GO",
                              style: AppTextStyles.custom(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),
                              textAlign: TextAlign.center,
                            ),
              onPressed: () {
                Navigator.pushNamed(context, RouteManager.auth);
              })
          ],
        ),
      ),
    );
  }
}
