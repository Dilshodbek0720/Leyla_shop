import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/auth_provider.dart';

class HomeScreen_client extends StatefulWidget {
  const HomeScreen_client({super.key});

  @override
  State<HomeScreen_client> createState() => _HomeScreen_clientState();
}

class _HomeScreen_clientState extends State<HomeScreen_client> {
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
