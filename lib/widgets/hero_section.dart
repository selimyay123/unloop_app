import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final bool isProtectionActive;
  final Function(bool) onModeChanged;

  const HeroSection({
    super.key,
    required this.isProtectionActive,
    required this.onModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isProtectionActive
            ? Colors.greenAccent.shade100
            : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            isProtectionActive ? Icons.shield : Icons.power_settings_new,
            size: 50,
            color: Colors.green,
          ),
          const SizedBox(height: 10),
          Switch(
            value: isProtectionActive,
            onChanged: onModeChanged, // Tetiklendiğinde merkeze haber ver
            activeThumbColor: Colors.white,
            activeTrackColor: Colors.green,
          ),
          Text(
            isProtectionActive ? "Unloop On" : "Unloop Off",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
