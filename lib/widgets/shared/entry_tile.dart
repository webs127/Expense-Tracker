import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/image_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EntryTile extends StatelessWidget {
  final double padding;
  final String title;
  final String date;
  final String paymentMethod;
  final double amount;
  const EntryTile({
    super.key,
    required this.padding, required this.title, required this.date, required this.paymentMethod, required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding, right: padding, bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: ColorManager.grey2,
                  border: Border.all(color: ColorManager.grey2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SvgPicture.asset(ImageManager.cashback),
              ),
              const SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.custom(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.dark),
                  ),
                  Text(
                    date,
                    style: AppTextStyles.custom(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.grey4),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$$amount",
                style: AppTextStyles.custom(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.dark),
              ),
              Text(
                paymentMethod,
                style: AppTextStyles.custom(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.grey4),
              ),
            ],
          )
        ],
      ),
    );
  }
}