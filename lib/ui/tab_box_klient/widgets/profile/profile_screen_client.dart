import 'package:flutter/material.dart';

class ProfileScreen_client extends StatefulWidget {
  const ProfileScreen_client({super.key});

  @override
  State<ProfileScreen_client> createState() => _ProfileScreen_clientState();
}

class _ProfileScreen_clientState extends State<ProfileScreen_client> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProfileScreen"),
      ),
    );
  }
}
