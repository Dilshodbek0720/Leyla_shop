import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../app/app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    await Future.delayed(const Duration(seconds: 3));

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return App();
          },
        ),
      );
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            "Leyla shop",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Cinzel",
              fontWeight: FontWeight.w600,
              fontSize: 50,
              color: AppColors.C_01AA4F,
            ),
          ),
        ),
      ),
    );
  }
}