import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/core/manager/textstyle_manager.dart';
import 'package:expense_tracker/widgets/shared/entry_tile.dart';
import 'package:flutter/material.dart';

class EntriesScreen extends StatefulWidget {
  const EntriesScreen({super.key});

  @override
  State<EntriesScreen> createState() => _EntriesScreenState();
}

class _EntriesScreenState extends State<EntriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        title: Text(
          "Entries",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 24),
                child: Text(
                  "Latest Entries",
                  style: AppTextStyles.custom(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.dark),
                ),
              ),
              const SizedBox(height: 20),

              Column(
                children: List.generate(50, (i) => const EntryTile(padding: 24)),
              ),
              //const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
