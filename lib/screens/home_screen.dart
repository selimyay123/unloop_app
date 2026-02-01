import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            ultimate trigger 
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
                child: Text.rich(
                  TextSpan(
                    text: "The ultimate trigger: ",
                    style: TextStyle(fontSize: 16),
                    children: [
                      TextSpan(
                        text: "Loneliness",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
