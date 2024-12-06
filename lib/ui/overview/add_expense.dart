import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/ui/auth/login/login.dart';
import 'package:expense_tracker/widgets/components/calendar.dart';
import 'package:flutter/material.dart';

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Income Title",
                          style: AppTextStyles.custom(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ColorManager.grey7),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          cursorColor: ColorManager.dark,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide:
                                  BorderSide(color: ColorManager.primaryLight),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide:
                                  BorderSide(color: ColorManager.primaryLight),
                            ),
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
                          cursorColor: ColorManager.dark,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
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
                          "Expense Category",
                          style: AppTextStyles.custom(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ColorManager.grey7),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          cursorColor: ColorManager.dark,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
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
                          child: AppButton(
                            text: "ADD EXPENSE",
                            width: 327,
                            height: 48,
                            backgroundColor: ColorManager.primary,
                            color: ColorManager.white,
                            onPressed: () {},
                          ),
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
      ),
    );
  }
}
