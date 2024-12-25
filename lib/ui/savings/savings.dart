import 'package:expense_tracker/app/route.dart';
import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/image_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/core/models/goal_model.dart';
import 'package:expense_tracker/ui/savings/controller/savings_controller.dart';
import 'package:expense_tracker/widgets/shared/circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SavingsScreen extends StatefulWidget {
  const SavingsScreen({super.key});

  @override
  State<SavingsScreen> createState() => _SavingsScreenState();
}

class _SavingsScreenState extends State<SavingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey5,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.white,
        title: Text(
          "Savings",
          style: AppTextStyles.custom(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: ColorManager.dark),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 32),
              Text(
                "Current Savings",
                style: AppTextStyles.custom(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.dark),
              ),
              const SizedBox(height: 16),
              CustomCircleAvatar(
                color: ColorManager.grey6.withOpacity(.5),
                width: 160,
                height: 160,
                child: CustomCircleAvatar(
                    color: ColorManager.grey6,
                    width: 140,
                    height: 140,
                    child: CustomCircleAvatar(
                      gradient: LinearGradient(
                          colors: [
                            ColorManager.primaryLight1,
                            ColorManager.primary,
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: const [.1, .7]),
                      width: 120,
                      height: 120,
                      child: Text(
                        "\$800",
                        style: AppTextStyles.custom(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.white),
                      ),
                    )),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    //height: 148,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.calendar_month),
                              const SizedBox(width: 8),
                              Text(
                                "July 2024",
                                style: AppTextStyles.custom(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: ColorManager.dark),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Goal for this month",
                            style: AppTextStyles.custom(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.dark),
                          ),
                          const SizedBox(height: 16),
                          Stack(
                            children: [
                              LinearProgressIndicator(
                                minHeight: 36,
                                value: .4,
                                color: ColorManager.primary,
                                backgroundColor: ColorManager.grey8,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              Positioned(
                                top: 8,
                                left: 16,
                                child: Text(
                                  "\$200",
                                  style: AppTextStyles.custom(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.white),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 16,
                                child: Text(
                                  "\$500",
                                  style: AppTextStyles.custom(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              DecoratedBox(
                decoration: BoxDecoration(color: ColorManager.white),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your Goals",
                            style: AppTextStyles.custom(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.dark),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorManager.grey8),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, RouteManager.goals);
                              },
                              child: const SizedBox(
                                width: 40,
                                height: 40,
                                child: Icon(Icons.more_horiz_outlined),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Consumer<SavingsController>(builder: (context, goals, __) {
                      return FutureBuilder<List<GoalModel>>(
                          future: goals.getGoals(limit: 5),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Column(
                                  children: List.generate(
                                      snapshot.data!.length,
                                      (i) => Dismissible(
                                        key: Key(snapshot.data![i].id.toString()),
                                        direction: DismissDirection.endToStart,
                                        onDismissed: (direction) {
                                          goals.deleteGoal(snapshot.data![i]);
                                        },
                                        child: GoalEntry(
                                              title: snapshot.data![i].title,
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    RouteManager.updategoal,
                                                    arguments: snapshot.data![i]);
                                              },
                                              savedAmount:
                                                  snapshot.data![i].savedAmount,
                                              targetAmount:
                                                  snapshot.data![i].targetAmount,
                                              type: snapshot.data![i].type,
                                              deadline:
                                                  snapshot.data![i].deadline,
                                            ),
                                      )));
                            }
                          });
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoalEntry extends StatelessWidget {
  final int? id;
  final String title;
  final double savedAmount;
  final double targetAmount;
  final String type;
  final VoidCallback? onTap;
  final String deadline;

  const GoalEntry({
    super.key,
    this.id,
    this.onTap,
    required this.title,
    required this.savedAmount,
    required this.targetAmount,
    required this.type,
    required this.deadline,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: ColorManager.grey2,
                border: Border.all(color: ColorManager.grey2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: SvgPicture.asset(ImageManager.cashback),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.custom(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.dark),
                  ),
                  const SizedBox(height: 6),
                  LinearProgressIndicator(
                    value: savedAmount / targetAmount,
                    color: ColorManager.primary,
                    backgroundColor: ColorManager.grey8,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$$savedAmount",
                        style: AppTextStyles.custom(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ColorManager.grey4),
                      ),
                      Text(
                        "\$$targetAmount",
                        style: AppTextStyles.custom(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ColorManager.grey4),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
