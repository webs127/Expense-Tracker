import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/services/notification_manager.dart';
import 'package:expense_tracker/ui/reminders/controller/reminder_controller.dart';
import 'package:expense_tracker/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddReminderScreen extends StatefulWidget {
  const AddReminderScreen({super.key});

  @override
  State<AddReminderScreen> createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey5,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        title: Text(
          "Add Reminder",
          style: AppTextStyles.custom(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: ColorManager.dark),
        ),
        centerTitle: true,
      ),
      body: Consumer<ReminderController>(
        builder: (context, reminder, __) {
          return SizedBox(
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
                        key: reminder.key,
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
                              controller: reminder.name,
                              validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                              controller: reminder.price,
                              validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                                        color: ColorManager.primaryLight)),
                                          ),
                            ),
                            const SizedBox(height: 32),
                            Text(
                              "Reminder Date",
                              style: AppTextStyles.custom(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.grey7),
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: reminder.reminderDate,
                              validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                              cursorColor: ColorManager.dark,
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
                                        color: ColorManager.primaryLight)),),
                            ),
                            const SizedBox(height: 32),
                            Text(
                              "Due Date",
                              style: AppTextStyles.custom(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.grey7),
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: reminder.dueDate,
                              validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                              cursorColor: ColorManager.dark,
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
                                        color: ColorManager.primaryLight)),),
                            ),
                            const SizedBox(height: 32),
                            Center(
                              child: AppButton(
                                text: "ADD REMINDER",
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
                                  reminder.validateinsert();
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
                                        id: 4,
                                        title: "Reminder added",
                                        body:
                                            "You have successfully added ${reminder.name.text}");
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackbar1);
                                },
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
          );
        }
      ),
    );
  }
}
