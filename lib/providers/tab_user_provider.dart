import 'package:flutter/cupertino.dart';

import '../ui/tab_user/categories/categories_screen.dart';
import '../ui/tab_user/products/products_screen.dart';
import '../ui/tab_user/profile/profile_screen.dart';

class TabUserProvider with ChangeNotifier {

  TabUserProvider()  {
    getWidgets();
  }

  int currentIndex = 0;
  List<Widget> screens = [];
  Widget? widget;

  void getWidgets(){
    screens.add(const ProductsScreen());
    screens.add(const CategoriesScreen());
    screens.add(const ProfileUserScreen());
    widget = screens[0];
    notifyListeners();
  }

  getScreen(int index){
    widget =  screens[index];
    currentIndex = index;
    notifyListeners();
  }

}