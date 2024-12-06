import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:expense_tracker/app/route.dart';
import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/widgets/components/calendar.dart';
import 'package:expense_tracker/widgets/shared/entry_tile.dart';
import 'package:flutter/material.dart';
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
                      color: ColorManager.primary,
                      width: 120,
                      height: 120,
                      child: Text(
                        "\$1600",
                        style: AppTextStyles.custom(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.white),
                      ),
                    )),
              ),
              const SizedBox(height: 20),
              Text(
                "You have Spent 60% of you budget",
                style: AppTextStyles.custom(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.dark),
              ),
              const SizedBox(height: 32),
              Container(
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
                          4,
                          (index) => const EntryTile(
                                padding: 10,
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
                          palette: const [],
                          legend: const Legend(isVisible: true),
                          series: <RadialBarSeries<TaskData, String>>[
                            RadialBarSeries<TaskData, String>(
                              dataSource: getTaskData(),
                              xValueMapper: (data, index) => data.category,
                              yValueMapper: (data, index) => data.percentage,
                              pointColorMapper: (data, index) => data.color,
                              maximumValue: 100,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
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

class CustomCircleAvatar extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Color color;
  const CustomCircleAvatar({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: CircleAvatar(
          backgroundColor: color,
          child: child,
        ));
  }
}
