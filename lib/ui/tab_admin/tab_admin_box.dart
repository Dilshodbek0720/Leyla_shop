import 'package:flutter/material.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.shop_two), label: "Products"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (onTab) {
          provider.getScreen(onTab);
        },
        currentIndex: provider.currentIndex,
      ),
    );
  }
}


// class TabBox extends StatefulWidget {
//   const TabBox({super.key});
//
//   @override
//   State<TabBox> createState() => _TabBoxState();
// }
//
// class _TabBoxState extends State<TabBox> {
//   final items = [
//     Icon(Icons.home, size: 30,),
//     Icon(Icons.category, size: 30,),
//     Icon(Icons.search, size: 30,),
//     Icon(Icons.favorite, size: 30,),
//     Icon(Icons.person, size: 30,),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<TabProvider>(context, listen: false);
//     return Scaffold(
//       extendBody: true,
//       backgroundColor: Colors.black26,
//         body: provider.widget,
//         bottomNavigationBar: Theme(
//           data: Theme.of(context).copyWith(
//             iconTheme: IconThemeData(color: Colors.white)
//           ),
//           child: CurvedNavigationBar(
//             color: AppColors.C_01AA4F,
//             backgroundColor: Colors.transparent,
//             height: 60,
//             items: items,
//             onTap: (index){
//                   provider.getScreen(index);
//             },
//             animationCurve: Curves.easeInOut,
//             animationDuration: Duration(milliseconds: 500),
//           ),
//         ),
//     );
//   }
// }
