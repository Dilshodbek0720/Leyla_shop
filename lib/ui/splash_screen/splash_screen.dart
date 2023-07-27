import 'package:flutter/material.dart';
import 'package:leyla_shop/ui/app/app.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    await Future.delayed(Duration(seconds: 4));
    if (context.mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return AppScreen();
      }));
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Text("Leyla shop",),
      ),
    );
  }
}
