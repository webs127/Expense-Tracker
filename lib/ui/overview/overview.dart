import 'package:expense_tracker/app/route.dart';
import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/core/models/expense_model.dart';
import 'package:expense_tracker/ui/overview/controller/expense_controller.dart';
import 'package:expense_tracker/ui/overview/controller/overview_controller.dart';
import 'package:expense_tracker/widgets/app_button.dart';
import 'package:expense_tracker/widgets/components/carousel_tile.dart';
import 'package:expense_tracker/widgets/shared/entry_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OverViewScreen extends StatefulWidget {
  const OverViewScreen({super.key});

  @override
  State<OverViewScreen> createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey5,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //header
                const AppHeader(),
                const SizedBox(height: 32),
                //carousel
                buildCarouselList(),
                const SizedBox(height: 32),
                IntrinsicWidth(
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const SizedBox(height: 32),
                        buildNavList(),
                        const SizedBox(height: 20),
                        buildDotIndicator(),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Latest Entries",
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
                                    Navigator.pushNamed(
                                        context, RouteManager.entries);
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
                        const SizedBox(height: 32),
                        Consumer<ExpenseController>(
                            builder: (context, expense, __) {
                          return FutureBuilder<List<ExpenseModel>>(
                              future: expense.getExpenses(),
                              builder: (context, snapshot) {
                                {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14),
                                      child: Column(
                                        children: List.generate(
                                            snapshot.data!.length,
                                            (index) => EntryTile(
                                                  padding: 10,
                                                  title: snapshot
                                                      .data![index].name,
                                                  amount: snapshot
                                                      .data![index].amount,
                                                  paymentMethod: snapshot
                                                      .data![index]
                                                      .paymentMethod,
                                                  date: snapshot
                                                      .data![index].date,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      color: ColorManager.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Overview",
            style: AppTextStyles.custom(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: ColorManager.dark),
          ),
          CircleAvatar(
            backgroundColor: ColorManager.dark,
          )
        ],
      ),
    );
  }
}

Widget buildCarouselList() => SizedBox(
      height: 150,
      child: Consumer<OverviewController>(builder: (context, data, __) {
        return Consumer<ExpenseController>(builder: (context, total, __) {
          return FutureBuilder<double>(
              future: total.getTotal(),
              builder: (context, snapshot) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: data.entries.length,
                    itemBuilder: (context, i) {
                      return CarouselTile(
                        iconcolor: (data.currentIndex == i)
                            ? ColorManager.white
                            : ColorManager.dark,
                        gradient: (data.currentIndex == i)
                            ? LinearGradient(
                                colors: [
                                  ColorManager.primaryLight1,
                                  ColorManager.primary,
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: const [.1, .7])
                            : null,
                        textcolor: (data.currentIndex == i)
                            ? ColorManager.white
                            : ColorManager.dark,
                        object: (i == 1)
                            ? EntryObject(
                                name: "Total Expense", amount: snapshot.data)
                            : data.entries[i],
                        color: ColorManager.white,
                        onTap: () {
                          data.onSelected(i);
                          if (data.currentIndex == 1) {
                            Navigator.pushNamed(context, RouteManager.expense);
                          }
                        },
                      );
                    });
              });
        });
      }),
    );

Widget buildNavList() => SizedBox(
      height: 60,
      child: Consumer<OverviewController>(builder: (context, data, __) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, i) {
              List navs = [
                RouteManager.savings,
                RouteManager.reminders,
                RouteManager.notifications
              ];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: AppButton(
                  width: 101,
                  onPressed: () {
                    data.onchanged(i);
                    Navigator.pushNamed(context, navs[i]);
                  },
                  height: 48,
                  backgroundColor: (data.currentValue == i)
                      ? ColorManager.primary
                      : ColorManager.white,
                  gradient: (data.currentValue == i)
                      ? LinearGradient(
                          colors: [
                            ColorManager.primaryLight1,
                            ColorManager.primary,
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: const [.1, .7])
                      : null,
                  color: (data.currentValue == i)
                      ? ColorManager.white
                      : ColorManager.dark,
                  text: data.navs[i],
                ),
              );
            });
      }),
    );

Widget buildDotIndicator() =>
    Consumer<OverviewController>(builder: (context, data, __) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            3,
            (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      color: (data.currentValue == index)
                          ? ColorManager.primary
                          : ColorManager.grey2,
                      borderRadius: BorderRadius.circular(100)),
                  width: 25,
                  height: 7,
                )),
      );
    });
