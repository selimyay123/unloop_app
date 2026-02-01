import 'package:flutter/material.dart';

class WeeklyReportSection extends StatelessWidget {
  const WeeklyReportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
