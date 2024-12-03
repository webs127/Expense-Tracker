import 'package:expense_tracker/core/manager/image_manager.dart';
import 'package:flutter/material.dart';

class OnboardingController with ChangeNotifier {
  final List<OnboardingObject> onboardingObjects = [
    OnboardingObject(imageUrl: ImageManager.onboarding1,
    title: "Note Down Expenses",
    description: "Daily note your expenses to help manage money"
    ),
    OnboardingObject(imageUrl: ImageManager.onboarding2,
    title: "Simple Money Management",
    description: "Get your notifications or alert when you do the over expenses"
    ),
    OnboardingObject(imageUrl: ImageManager.onboarding3,
    title: "Easy to Track and Analize",
    description: "Tracking your expense help make sure you don't overspend"
    ),
  ];
  PageController pageController = PageController();
  int currentIndex = 0;
  int get length => onboardingObjects.length;

  onchanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  OnboardingObject get object {
    return onboardingObjects[currentIndex];
  }
}



class OnboardingObject {
  final String imageUrl;
  final String title;
  final String description;

  OnboardingObject(
      {required this.imageUrl, required this.title, required this.description});
}
