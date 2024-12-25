import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/services/notification_manager.dart';
import 'package:expense_tracker/ui/overview/controller/expense_controller.dart';
import 'package:expense_tracker/widgets/app_button.dart';
import 'package:expense_tracker/widgets/components/calendar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey5,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        title: Text(
          "Add Expense",
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
                const HorizontalCalendar(),
                const SizedBox(height: 20),
                Consumer<ExpenseController>(builder: (context, expense, __) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                      key: expense.key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Title",
                            style: AppTextStyles.custom(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.grey7),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: expense.name,
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
                            "Amount",
                            style: AppTextStyles.custom(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.grey7),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: expense.amount,
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
                            "Expense Category",
                            style: AppTextStyles.custom(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.grey7),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: expense.category,
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
                            "Payment Method",
                            style: AppTextStyles.custom(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.grey7),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: expense.paymentMethod,
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
                          Center(
                            child: AppButton(
                              text: "ADD EXPENSE",
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
                                expense.validateinsert();
                                final snackbar1 = SnackBar(
                                    backgroundColor: ColorManager.primary,
                                    content: Center(
                                        child: Text(
                                      "Successfully added",
                                      style: AppTextStyles.custom(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: ColorManager.white),
                                    )));
                                NotificationManager.createNotification(
                                    id: 3,
                                    title: "Goal added",
                                    body:
                                        "You have successfully added ${expense.name.text}");
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackbar1);
                              },
                            ),
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
