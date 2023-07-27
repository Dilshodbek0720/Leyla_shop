import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:leyla_shop/provider/aoth_provider.dart';
import 'package:leyla_shop/ui/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void > main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers:[
      ChangeNotifierProvider(create: (context)=>Authprovider(),
        lazy: true,
      )
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}
