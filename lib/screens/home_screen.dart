import 'package:flutter/material.dart';
import 'package:unloop/widgets/app_list_section.dart';
import 'package:unloop/widgets/hero_section.dart';
import 'package:unloop/widgets/stat_card_section.dart';
import 'package:unloop/widgets/weekly_report_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _targetApps = [
    {"name": "Instagram", "icon": Icons.camera_alt, "isBlocked": true},
    {"name": "TikTok", "icon": Icons.music_note, "isBlocked": false},
    {"name": "Twitter/X", "icon": Icons.alternate_email, "isBlocked": true},
    {"name": "Youtube", "icon": Icons.play_arrow, "isBlocked": true},
  ];
  bool _isProtectionActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Unloop")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(
              isProtectionActive: _isProtectionActive,
              onModeChanged: (newValue) {
                setState(() {
                  _isProtectionActive = newValue;
                });
              },
            ),
            StatCardSection(),
            WeeklyReportSection(),
            AppListSection(
              targetApps: _targetApps,
              onAppToggled: (index, currentValue) {},
            ),
          ],
        ),
      ),
    );
  }
}
