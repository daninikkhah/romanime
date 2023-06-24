import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import 'state_management/data_manager.dart';

class TabsController with ChangeNotifier{
  Widget _selectedWidget = const HomeScreen();
  int _selectedTabIndex = 1;
  static Future<void> initiate(BuildContext context) async =>
      await DataManager.initialise(context);


  Widget get selectedWidget => _selectedWidget;

  void setSelectedWidget(Widget widget, {int index = -1}){
    _selectedWidget = widget;
   if(index > -1) _selectedTabIndex =index;
    notifyListeners();
  }

  int get selectedTAbIndex =>_selectedTabIndex;

  // void setSelectedTAbIndex(int index) => _selectedTabIndex= index;

}