import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:expense_tracker/app/route.dart';
import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/core/models/expense_model.dart';
import 'package:expense_tracker/ui/overview/controller/expense_controller.dart';
import 'package:expense_tracker/widgets/components/calendar.dart';
import 'package:expense_tracker/widgets/shared/circle_avatar.dart';
import 'package:expense_tracker/widgets/shared/entry_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey5,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        title: Text(
          "Total Expense",
          style: AppTextStyles.custom(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: ColorManager.dark),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteManager.addexpense);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Calendar Selector
              const SizedBox(height: 32),
              const HorizontalCalendar(),
              const SizedBox(height: 20),

              // Budget Widget
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
                        "\$0",
                        style: AppTextStyles.custom(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.white),
                      ),
                    )),
              ),
              const SizedBox(height: 20),
              Text(
                "You have Spent 0% of you budget",
                style: AppTextStyles.custom(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.dark),
              ),
              const SizedBox(height: 32),
              Consumer<ExpenseController>(builder: (context, expense, __) {
                return FutureBuilder<List<ExpenseModel>>(
                    future: expense.getExpenses(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          height: 400,
                          child: ContainedTabBarView(
                            tabs: const [
                              Text('Spends'),
                              Text('Categories'),
                            ],
                            tabBarProperties: TabBarProperties(
                              indicatorColor: ColorManager.primary,
                              labelColor: ColorManager.dark,
                              labelStyle: AppTextStyles.custom(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.dark),
                              unselectedLabelColor: Colors.grey,
                            ),
                            views: [
                              // First Tab Content
                              ListView(
                                padding: const EdgeInsets.only(top: 10),
                                children: List.generate(
                                    snapshot.data!.length,
                                    (index) => EntryTile(
                                          padding: 10,
                                          title: snapshot.data![index].name,
                                          amount: snapshot.data![index].amount,
                                          paymentMethod: snapshot
                                              .data![index].paymentMethod,
                                          date: snapshot.data![index].date,
                                        )),
                              ),

                              // Second Tab Content
                              Center(
                                child: Container(
                                  width: 327,
                                  height: 244,
                                  decoration: BoxDecoration(
                                      color: ColorManager.grey5,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: SfCircularChart(
                                    legend: const Legend(isVisible: true),
                                    series: <RadialBarSeries<TaskData, String>>[
                                      RadialBarSeries<TaskData, String>(
                                        cornerStyle: CornerStyle.endCurve,
                                        animationDuration: 1000,
                                        dataSource: getTaskData(),
                                        xValueMapper: (data, index) =>
                                            data.category,
                                        yValueMapper: (data, index) =>
                                            data.percentage,
                                        pointColorMapper: (data, index) =>
                                            data.color,
                                        maximumValue: 100,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
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

List<TaskData> getTaskData() => [
      TaskData(category: "Food", percentage: 60, color: ColorManager.primary),
      TaskData(
          category: "Shopping",
          percentage: 40,
          color: ColorManager.primaryDark),
      TaskData(
          category: "Rent", percentage: 10, color: ColorManager.primaryLight),
    ];

class TaskData {
  final String category;
  final int percentage;
  final Color color;

  TaskData(
      {required this.color, required this.category, required this.percentage});
}
