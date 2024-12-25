import 'package:expense_tracker/core/manager/image_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/ui/overview/controller/overview_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarouselTile extends StatelessWidget {
  final VoidCallback? onTap;
  final EntryObject object;
  final Color color;
  final Color textcolor;
  final Gradient? gradient;
  final Color iconcolor;
  const CarouselTile({
    super.key,
    this.onTap,
    required this.object,
    this.gradient,
    required this.color,
    required this.textcolor,
    required this.iconcolor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(right: 10, left: 10),
        decoration: BoxDecoration(
            gradient: gradient,
            color: color,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(ImageManager.wallet, color: iconcolor),
            const SizedBox(height: 8),
            Text(
              object.name,
              style: AppTextStyles.custom(
                  fontSize: 14, fontWeight: FontWeight.w400, color: textcolor),
            ),
            const SizedBox(height: 32),
            Text(
              "\$${object.amount}",
              style: AppTextStyles.custom(
                  fontSize: 18, fontWeight: FontWeight.w600, color: textcolor),
            ),
          ],
        ),
      ),
    );
  }
}
