import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/image_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/core/models/notification_model.dart';
import 'package:expense_tracker/ui/notification/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorManager.white,
          title: Text(
            "Notifications",
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
          child: Consumer<NotificationController>(
              builder: (context, notification, __) {
            return FutureBuilder<List<NotificationModel>>(
                future: notification.getNotifications(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        "No Notifications available",
                        style: AppTextStyles.custom(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: ColorManager.primary),
                      ),
                    );
                  } else {
                    return ListView.separated(
                        itemBuilder: (context, i) =>
                            NotificationEntryTile(
                              title: snapshot.data![i].title,
                              timestamp: snapshot.data![i].timestamp,
                              subtitle: snapshot.data![i].type,
                            ),
                        separatorBuilder: (context, i) => const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              child: Divider(),
                            ),
                        itemCount: snapshot.data!.length);
                  }
                });
          }),
        ));
  }
}

class NotificationEntryTile extends StatelessWidget {
  final String title;
  final String timestamp;
  final String subtitle;
  const NotificationEntryTile({
    super.key,
    required this.title,
    required this.timestamp,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      color: ColorManager.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: ColorManager.grey2,
                  border: Border.all(color: ColorManager.grey2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SvgPicture.asset(ImageManager.cashback),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.custom(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.dark),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: 180,
                    child: Text(
                      "You just paid your $title bill",
                      style: AppTextStyles.custom(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.grey4),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                timestamp,
                style: AppTextStyles.custom(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.grey4),
              ),
              InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(50),
                  child: Icon(Icons.more_horiz, color: ColorManager.grey7))
            ],
          )
        ],
      ),
    );
  }
}
