import 'package:flutter/material.dart';

class SearchScreen_client extends StatefulWidget {
  const SearchScreen_client({super.key});

  @override
  State<SearchScreen_client> createState() => _SearchScreen_clientState();
}

class _SearchScreen_clientState extends State<SearchScreen_client> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SearchScreen"),
      ),
    );
  }
}
