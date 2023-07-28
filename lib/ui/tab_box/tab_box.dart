import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:leyla_shop/ui/tab_box/widgets/home/home_screen.dart';
import 'package:leyla_shop/ui/tab_box/widgets/like/like_screen.dart';
import 'package:leyla_shop/ui/tab_box/widgets/profile/profile_screen.dart';
import 'package:leyla_shop/ui/tab_box/widgets/search/search_screen.dart';
import 'package:leyla_shop/ui/tab_box/widgets/setting/setting_screen.dart';
import 'package:leyla_shop/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_providers.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int currentIndex = 0;
  final screens = [
    HomeScreen(),
    SearchScreen(),
    LikeScreen(),
    SettingScreen(),
    ProfileScreen()
  ];

  final items = [
    Icon(Icons.home, size: 30,),
    Icon(Icons.search, size: 30,),
    Icon(Icons.favorite, size: 30,),
    Icon(Icons.settings, size: 30,),
    Icon(Icons.person, size: 30,),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black26,
        body: screens[currentIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color: Colors.white)
          ),
          child: CurvedNavigationBar(
            color: AppColors.C_01AA4F,
            backgroundColor: Colors.transparent,
            height: 60,
            items: items,
            onTap: (index){
              setState(() {
                currentIndex = index;
              });
            },
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 500),
          ),
        ),
    );
  }
}