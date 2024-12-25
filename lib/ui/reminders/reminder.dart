import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/core/models/reminder_model.dart';
import 'package:expense_tracker/ui/reminders/controller/reminder_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.white,
        title: Text(
          "Reminders",
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
        child: Consumer<ReminderController>(builder: (context, reminder, __) {
          return FutureBuilder<List<ReminderModel>>(
              future: reminder.getReminders(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        "No Reminders available",
                        style: AppTextStyles.custom(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: ColorManager.primary),
                      ),
                    );
                  }
                  return ListView.separated(
                      itemBuilder: (context, i) => ReminderEntry(
                            reminderDate: snapshot.data![i].reminderDate,
                            price: snapshot.data![i].price,
                            name: snapshot.data![i].name,
                            dueDate: snapshot.data![i].dueDate,
                            onTap: () {},
                          ),
                      separatorBuilder: (context, i) => const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Divider(),
                          ),
                      itemCount: snapshot.data!.length);
                }
              });
        }),
      ),
    );
  }
}

class ReminderEntry extends StatelessWidget {
  final String name;
  final String reminderDate;
  final String dueDate;
  final VoidCallback? onTap;
  final double price;
  const ReminderEntry({
    super.key,
    required this.name,
    required this.reminderDate,
    required this.dueDate,
    this.onTap,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reminder Date: $reminderDate",
                style: AppTextStyles.custom(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.dark),
              ),
              InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(50),
                  child: Icon(Icons.more_horiz, color: ColorManager.grey7))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: AppTextStyles.custom(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.dark),
              ),
              Text(
                "Due on",
                style: AppTextStyles.custom(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.grey4),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$$price",
                style: AppTextStyles.custom(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.grey4),
              ),
              Text(
                dueDate,
                style: AppTextStyles.custom(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.dark),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
