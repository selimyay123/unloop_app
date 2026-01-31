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
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isProtectionActive
                    ? Colors.greenAccent.shade100
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
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
          ],
        ),
      ),
    );
  }
}
