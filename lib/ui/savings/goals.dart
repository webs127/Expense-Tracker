import 'package:expense_tracker/app/route.dart';
import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/core/models/goal_model.dart';
import 'package:expense_tracker/ui/savings/controller/savings_controller.dart';
import 'package:expense_tracker/ui/savings/savings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        title: Text(
          "Your goals",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Consumer<SavingsController>(builder: (context, savings, __) {
                return FutureBuilder<List<GoalModel>>(
                    future: savings.getGoals(),
                    builder: (context, snapshot) {
                      {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Column(
                              children: List.generate(
                                  snapshot.data!.length,
                                  (index) => GoalEntry(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, RouteManager.updategoal,
                                              arguments: snapshot.data![index]);
                                        },
                                        title: snapshot.data![index].title,
                                        savedAmount:
                                            snapshot.data![index].savedAmount,
                                        targetAmount:
                                            snapshot.data![index].targetAmount,
                                        deadline:
                                            snapshot.data![index].deadline,
                                        type: snapshot.data![index].type,
                                      )),
                            ),
                          );
                        }
                      }
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
