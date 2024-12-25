import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/core/models/goal_model.dart';
import 'package:expense_tracker/services/notification_manager.dart';
import 'package:expense_tracker/ui/savings/controller/savings_controller.dart';
import 'package:expense_tracker/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateGoalScreen extends StatefulWidget {
  final GoalModel model;
  const UpdateGoalScreen({super.key, required this.model});

  @override
  State<UpdateGoalScreen> createState() => _UpdateGoalScreenState();
}

class _UpdateGoalScreenState extends State<UpdateGoalScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController savedAmount = TextEditingController();
  TextEditingController targetAmount = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController deadline = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    title.text = widget.model.title;
    savedAmount.text = widget.model.savedAmount.toString();
    targetAmount.text = widget.model.targetAmount.toString();
    type.text = widget.model.type;
    deadline.text = widget.model.deadline;
  }

  @override
  void dispose() {
    title.text = "";
    savedAmount.text = "";
    targetAmount.text = "";
    type.text = "";
    deadline.text = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.grey5,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          title: Text(
            "Update Goal",
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  // Calendar Selector
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                      key: key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Goal Title",
                            style: AppTextStyles.custom(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.grey7),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: title,
                            cursorColor: ColorManager.dark,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide(
                                    color: ColorManager.primaryLight),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide(
                                    color: ColorManager.primaryLight),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                      color: ColorManager.primaryLight)),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Text(
                            "Saved Amount",
                            style: AppTextStyles.custom(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.grey7),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: savedAmount,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: ColorManager.dark,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                      color: ColorManager.primaryLight),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                      color: ColorManager.primaryLight),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: BorderSide(
                                        color: ColorManager.primaryLight))),
                          ),
                          const SizedBox(height: 32),
                          Text(
                            "Target Amount",
                            style: AppTextStyles.custom(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.grey7),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: targetAmount,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
                            cursorColor: ColorManager.dark,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                      color: ColorManager.primaryLight),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                      color: ColorManager.primaryLight),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: BorderSide(
                                        color: ColorManager.primaryLight))),
                          ),
                          const SizedBox(height: 32),
                          Text(
                            "Contribution Type",
                            style: AppTextStyles.custom(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.grey7),
                          ),
                          const SizedBox(height: 12),
                          DropdownButtonFormField<String>(
                            icon: RotatedBox(
                              quarterTurns: 3,
                              child: Icon(Icons.arrow_back_ios_new,
                                  color: ColorManager.grey7),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              setState(() {
                                type.text = value!;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
                            items: [
                              DropdownMenuItem<String>(
                                value: "Daily",
                                child: Text(
                                  "Daily",
                                  style: AppTextStyles.custom(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.dark),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: "Weekly",
                                child: Text(
                                  "Weekly",
                                  style: AppTextStyles.custom(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.dark),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: "Monthly",
                                child: Text(
                                  "Monthly",
                                  style: AppTextStyles.custom(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.dark),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: "Yearly",
                                child: Text(
                                  "Yearly",
                                  style: AppTextStyles.custom(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.dark),
                                ),
                              ),
                            ],
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                      color: ColorManager.primaryLight),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                      color: ColorManager.primaryLight),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: BorderSide(
                                        color: ColorManager.primaryLight))),
                          ),
                          const SizedBox(height: 32),
                          Text(
                            "Deadine",
                            style: AppTextStyles.custom(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.grey7),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: deadline,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: ColorManager.dark,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.calendar_month,
                                        color: ColorManager.grey7)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                      color: ColorManager.primaryLight),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                      color: ColorManager.primaryLight),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: BorderSide(
                                        color: ColorManager.primaryLight))),
                          ),
                          const SizedBox(height: 32),
                          Center(
                            child: Consumer<SavingsController>(
                                builder: (context, savings, __) {
                              return AppButton(
                                text: "UPDATE EXPENSE",
                                width: 327,
                                height: 48,
                                gradient: LinearGradient(
                                    colors: [
                                      ColorManager.primaryLight1,
                                      ColorManager.primary,
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    stops: const [0, .7]),
                                color: ColorManager.white,
                                onPressed: () {
                                  GoalModel updatedGoal = widget.model.copyWith(
                                    title: title.text,
                                    savedAmount: double.parse(savedAmount.text),
                                    targetAmount:
                                        double.parse(targetAmount.text),
                                    type: type.text,
                                    deadline: deadline.text,
                                  );
                                  savings.updateGoal(updatedGoal);

                                  if (updatedGoal.savedAmount ==
                                      updatedGoal.targetAmount) {
                                    final snackbar = SnackBar(
                                        backgroundColor: ColorManager.primary,
                                        content: Center(
                                            child: Text(
                                          "Goal Completed",
                                          style: AppTextStyles.custom(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: ColorManager.white),
                                        )));
                                    NotificationManager.createNotification(
                                        id: updatedGoal.id ?? 2,
                                        title: "Goal Completed",
                                        body:
                                            "You have successfully completed your goal for ${updatedGoal.title}");

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackbar);
                                  } else {
                                    final snackbar1 = SnackBar(
                                        backgroundColor: ColorManager.primary,
                                        content: Center(
                                            child: Text(
                                          "Successfully Updated",
                                          style: AppTextStyles.custom(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: ColorManager.white),
                                        )));
                                    NotificationManager.createNotification(
                                        id: updatedGoal.id ?? 1,
                                        title: "Updated Goal",
                                        body:
                                            "You have successfully updated ${updatedGoal.title}");
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackbar1);
                                  }
                                },
                              );
                            }),
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
