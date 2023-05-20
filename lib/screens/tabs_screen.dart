import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'chats_screen.dart';
import 'profile_screen.dart';
import 'package:provider/provider.dart';
import '../control/tabs_controller.dart';

const double _iconSize = 40;
const Color _darkPrimaryColor = Color(0xFF520078);
const Color _primaryAccent = Color(0xFFAD00FF);
const Color _backgroundColor= Color(0xFFD2D2D2);

class TabsScreen extends StatelessWidget {
  static const String route = 'screens/tabs_screen';

  final  List<Widget> _tabs = const [
     ChatsScreen(),
     HomeScreen(),
     ProfileScreen(),
    // ArtistsScreen()
  ];

  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TabsController.initiate(context);
    final TabsController tabsController = Provider.of<TabsController>(context);
    void _selectTab(int index) {
      // tabsController.setSelectedTAbIndex(index);
      tabsController.setSelectedWidget(_tabs[index], index: index);
    }

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: _backgroundColor,
      body: tabsController.selectedWidget,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        child: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Colors.white),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            unselectedItemColor: _darkPrimaryColor,
            selectedItemColor: _primaryAccent,
            type: BottomNavigationBarType.shifting,
            currentIndex: tabsController.selectedTAbIndex,
            onTap: _selectTab,
            items: const [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.chat_rounded,
                      size: _iconSize,
                    ),
                  ),
                  label: 'matches'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.whatshot_rounded,
                      size: _iconSize,
                    ),
                  ),
                  label: 'batch'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.account_circle,
                      size: _iconSize,
                    ),
                  ),
                  label: 'chats'),
              // BottomNavigationBarItem(
              //     icon: Padding(
              //       padding: EdgeInsets.all(8.0),
              //       child: Icon(
              //         Icons.people,
              //         size: _iconSize,
              //       ),
              //     ),
              //     label: 'artists'),
            ],
          ),
        ),
      ),
    );
  }
}
