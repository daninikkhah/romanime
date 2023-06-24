import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'chats_screen.dart';
import 'profile_screen.dart';
import 'package:provider/provider.dart';
import '../control/tabs_controller.dart';
import 'loading_screen.dart';

const double _iconSize = 40;
const Color _darkPrimaryColor = Color(0xFF520078);
const Color _primaryAccent = Color(0xFFAD00FF);
const Color _backgroundColor= Color(0xFFD2D2D2);

class TabsScreen extends StatefulWidget {
  static const String route = 'screens/tabs_screen';


  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final  List<Widget> _tabs = const [
     ChatsScreen(),
     HomeScreen(),
     ProfileScreen(),
    // ArtistsScreen()
  ];
  Future? initiationStatus;

  @override
  void initState() {
    // TODO: implement initState
    initiationStatus = TabsController.initiate(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: initiationStatus,
      builder: (context,initiator){
        if(initiator.connectionState == ConnectionState.done)
          {
            return  Consumer<TabsController>(builder: (context,tabsController,_){
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
                      onTap: (index) =>  tabsController.setSelectedWidget(_tabs[index], index: index),
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
            });



          }else{
          return const LoadingScreen();
        }
      },
    );
  }
}
