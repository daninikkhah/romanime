import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'control/state_management/characters_list_provider.dart';
import 'control/characters_messages_list.dart';
import 'screens/chats_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/date_screen.dart';
import 'control/tabs_controller.dart';
import 'screens/auth_screen.dart';
import 'screens/create_new_user_screen.dart';
import 'control/profile_data_provider.dart';
import 'control/state_management/character_picture_provider.dart';
import 'control/state_management/matched_characters_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MultiProvider(
    providers: [
      ChangeNotifierProvider<ProfileDataProvider>(
        create: (context) => ProfileDataProvider(),
      ),
      ChangeNotifierProvider<CharactersListProvider>(
        create: (context) => CharactersListProvider(),
      ),
      ChangeNotifierProvider<MatchedCharactersProvider>(
        create: (context) => MatchedCharactersProvider(),
      ),
      ChangeNotifierProvider<TabsController>(
          create: (context) => TabsController()),
      ChangeNotifierProvider<CharactersPictureProvider>(
        create: (context) => CharactersPictureProvider(),
      )
    ],
    child: const DatingApp(),
  ));// TODO: check if it is needed to be here at top
}

class DatingApp extends StatefulWidget {
  const DatingApp({Key? key}) : super(key: key);

  @override
  _DatingAppState createState() => _DatingAppState();
}

class _DatingAppState extends State<DatingApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isAuthenticated = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _auth.authStateChanges().listen((user) {
      if (_isAuthenticated) {
        if (user == null) {
          setState(() {
            _isAuthenticated = false;
          });
        }
      } else if (user != null) {
        setState(() {
          _isAuthenticated = true;
        });
      }
    });
    // check if user is still authenticated
    return ChangeNotifierProvider<CharactersMessagesList>(
      create: (context) => CharactersMessagesList(),
      child: MaterialApp(
        theme: ThemeData(
          backgroundColor: const Color(0xFFD2D2D2),

          // backgroundColor: Color(0xffE1BEE7),
          // backgroundColor: Color.fromRGBO(210, 210, 210, 1),
          primaryColor: Colors.deepPurpleAccent,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurple),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.pink),
        ),
        home: _isAuthenticated
            ? const TabsScreen()
            : const AuthenticationScreen(),
        // :const TabsScreen(),
        routes: {
          TabsScreen.route: (context) => const TabsScreen(),
          ChatsScreen.route: (context) => const ChatsScreen(),
          // CharacterChatScreen.route: (context) => CharacterChatScreen(),
          DateScreen.route: (context) => const DateScreen(),
          CreateNewUserScreen.url: (context) => const CreateNewUserScreen(),
          // InChatDateScreen.route:(context)=>InChatDateScreen(),
          // CharacterChatScreen.route: (context)=>CharacterScreen(id: id)
        },
      ),
    );
  }
}
