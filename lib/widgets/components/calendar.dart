import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/ui/overview/controller/expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class HorizontalCalendar extends StatefulWidget {
  const HorizontalCalendar({super.key});

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseController>(builder: (context, date, __) {
      return Container(
        height: 170,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TableCalendar(
          focusedDay: date.focusedDay,
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          calendarFormat: CalendarFormat.week,
          selectedDayPredicate: (day) {
            return isSameDay(date.selectedDay, day);
          },
          onDaySelected: date.onDaySelected,
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
            rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
          ),
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: ColorManager.primary.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: ColorManager.primary,
              shape: BoxShape.circle,
            ),
            defaultTextStyle: AppTextStyles.custom(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ColorManager.dark),
            weekendTextStyle: AppTextStyles.custom(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ColorManager.dark),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekendStyle: AppTextStyles.custom(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: ColorManager.dark),
            weekdayStyle: AppTextStyles.custom(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: ColorManager.dark),
          ),
        ),
      );
    });
  }
}
