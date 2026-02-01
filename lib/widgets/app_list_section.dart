import 'package:flutter/material.dart';
import 'package:unloop/widgets/unloop_container.dart';

class AppListSection extends StatelessWidget {
  final List<Map<String, dynamic>> targetApps;
  final Function(int index, bool currentValue) onAppToggled;

  const AppListSection({
    super.key,
    required this.targetApps,
    required this.onAppToggled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
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
          children: [
            for (int i = 0; i < targetApps.length; i++) // Klasik For Döngüsü
              UnloopContainer(
                marginValue: 8,
                child: Row(
                  children: [
                    Icon(
                      targetApps[i]['icon'] as IconData,
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      targetApps[i]['name'] as String,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      value: targetApps[i]['isBlocked'] as bool,
                      onChanged: (newValue) {
                        // Artık "i" bizim index'imiz, elimizin altında
                        onAppToggled(i, newValue);
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
