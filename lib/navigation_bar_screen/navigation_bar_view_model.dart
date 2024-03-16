import 'package:flutter/cupertino.dart';

class NavigationBarViewModel extends ChangeNotifier{
  int selectedIndex = 0;


  void navigate(int NewIndex){
    selectedIndex = NewIndex;
    notifyListeners();

  }

}