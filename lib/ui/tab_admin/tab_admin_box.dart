import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/tab_admin_provider.dart';


class TabAdminBox extends StatefulWidget {
  const TabAdminBox({super.key});

  @override
  State<TabAdminBox> createState() => _TabAdminBoxState();
}

class _TabAdminBoxState extends State<TabAdminBox> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TabAdminProvider>(context, listen: true);
    return Scaffold(
      body:provider.widget,
      bottomNavigationBar: CurvedNavigationBar(
      color: Colors.greenAccent,
      backgroundColor: Colors.white,
      items: <Widget>[
        Icon(Icons.home, size: 30, color: Colors.white,),
        Icon(Icons.category, size: 30, color: Colors.white,),
        Icon(Icons.person, size: 30, color: Colors.white,),
      ],
      onTap: (index) {
        provider.getScreen(index);
      },
      buttonBackgroundColor: Colors.greenAccent,
      height: 60.h,
    ),


      // BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.shop_two), label: "Products"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.category), label: "Categories"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      //   ],
      //   onTap: (onTab) {
      //     provider.getScreen(onTab);
      //   },
      //   currentIndex: provider.currentIndex,
      // ),
    );
  }
}