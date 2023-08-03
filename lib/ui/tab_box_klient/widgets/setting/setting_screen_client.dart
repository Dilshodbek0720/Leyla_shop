import 'package:flutter/material.dart';

class SettingScreen_client extends StatefulWidget {
  const SettingScreen_client({super.key});

  @override
  State<SettingScreen_client> createState() => _SettingScreen_clientState();
}

class _SettingScreen_clientState extends State<SettingScreen_client> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SettingScreen"),
      ),
    );
  }
}
