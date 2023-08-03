import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:leyla_shop/ui/tab_box_klient/widgets/home/home_screen_client.dart';
import 'package:leyla_shop/ui/tab_box_klient/widgets/like/like_screen_client.dart';
import 'package:leyla_shop/ui/tab_box_klient/widgets/profile/profile_screen_client.dart';
import 'package:leyla_shop/ui/tab_box_klient/widgets/search/search_screen_client.dart';
import 'package:leyla_shop/ui/tab_box_klient/widgets/setting/setting_screen_client.dart';
import 'package:leyla_shop/utils/colors.dart';
class TabBox_client extends StatefulWidget {
  const TabBox_client({super.key});

  @override
  State<TabBox_client> createState() => _TabBox_clientState();
}

class _TabBox_clientState extends State<TabBox_client> {
  int currentIndex = 0;
  final screens = [
    HomeScreen_client(),
    SearchScreen_client(),
    LikeScreen_client(),
    SettingScreen_client(),
    ProfileScreen_client()
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