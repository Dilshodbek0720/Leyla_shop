import 'package:flutter/material.dart';

class LikeScreen_client extends StatefulWidget {
  const LikeScreen_client({super.key});

  @override
  State<LikeScreen_client> createState() => _LikeScreen_clientState();
}

class _LikeScreen_clientState extends State<LikeScreen_client> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LikeScreen"),
      ),
    );
  }
}
