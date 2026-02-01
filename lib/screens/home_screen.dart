import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text("Unloop"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /* 
            hero section
            */
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isProtectionActive
                    ? Colors.greenAccent.shade100
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Icon(
                    _isProtectionActive
                        ? Icons.shield
                        : Icons.power_settings_new,
                    size: 50,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 10),
                  Switch(
                    value: _isProtectionActive,
                    onChanged: (newValue) {
                      setState(() {
                        _isProtectionActive = newValue;
                      });
                    },
                    activeThumbColor: Colors.white,
                    activeTrackColor: Colors.green,
                  ),
                  Text(
                    _isProtectionActive ? "Unloop On" : "Unloop Off",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            /* 
            Resistance Count
            */
            Row(
              children: [
                StatCard(
                  title: "Daily Win",
                  value: 8,
                  info:
                      "This shows how many times you`ve resisted target apps today.",
                ),
                StatCard(
                  title: "Daily Lose",
                  value: 12,
                  info:
                      "This shows how many times you`ve yielded to target apps today.",
                ),
              ],
            ),
            /* 
            weekly report
            */
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade300,
              ),
              child: Center(
                child: Text("Weekly Report", style: TextStyle(fontSize: 16)),
              ),
            ),
            /* 
            app list
            */
            const Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Text(
                "Managed Apps",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: _targetApps.map((app) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(app['icon'] as IconData, color: Colors.blueGrey),
                      const SizedBox(width: 16),
                      Text(
                        app['name'] as String,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Switch(
                        value: app['isBlocked'] as bool ? true : false,
                        onChanged: (newValue) {
                          setState(() {
                            app['isBlocked'] = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final int value;
  final String info;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Tooltip(
        message: info,
        triggerMode: TooltipTriggerMode.tap,
        showDuration: const Duration(seconds: 3),
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(title),
              Text(value.toString(), style: TextStyle(fontSize: 42)),
            ],
          ),
        ),
      ),
    );
  }
}
