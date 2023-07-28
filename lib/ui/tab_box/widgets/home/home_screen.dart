import 'package:flutter/material.dart';
import 'package:leyla_shop/providers/auth_providers.dart';
import 'package:provider/provider.dart';

import '../../../../providers/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        actions: [
          IconButton(onPressed: (){
            context.read<AuthProvider>().logOutUser(context);
          }, icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
