import 'package:flutter/cupertino.dart';
import '../ui/tab_admin/category/category_screen.dart';
import '../ui/tab_admin/product/product_screen.dart';
import '../ui/tab_admin/profile/profile_screen.dart';

class TabAdminProvider with ChangeNotifier {

  TabAdminProvider()  {
    getWidgets();
  }

  int currentIndex = 0;
  List<Widget> screens = [];
  Widget? widget;

  void getWidgets(){
    screens.add(const ProductAdminScreen());
    screens.add(const CategoryAdminScreen());
    screens.add(const ProfileAdminScreen());
    widget = screens[0];
    notifyListeners();
  }

  getScreen(int index){
    widget =  screens[index];
    currentIndex = index;
    notifyListeners();
  }

}