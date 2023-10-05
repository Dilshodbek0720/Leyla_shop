import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leyla_shop/utils/colors.dart';
import 'package:provider/provider.dart';
import '../../providers/tab_user_provider.dart';

class TabUserBox extends StatefulWidget {
  const TabUserBox({super.key});

  @override
  State<TabUserBox> createState() => _TabUserBoxState();
}

class _TabUserBoxState extends State<TabUserBox> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TabUserProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: AppColors.white,
      body:provider.widget,
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.greenAccent,
        backgroundColor: Colors.white,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white,),
          Icon(Icons.category, size: 30, color: Colors.white,),
          Icon(Icons.shopping_cart_rounded, size: 30, color: Colors.white,),
          Icon(Icons.person, size: 30, color: Colors.white,),
        ],
        onTap: (index) {
          provider.getScreen(index);
        },
        buttonBackgroundColor: Colors.greenAccent,
        height: 60.h,
      ),
    );
  }
}
