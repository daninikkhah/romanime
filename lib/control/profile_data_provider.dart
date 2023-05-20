import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../control/models/player_profile_data_model.dart';
import 'datasource/player_profile_data_source.dart';
import 'tabs_controller.dart';
import 'state_management/data_manager.dart';

 class ProfileDataProvider with ChangeNotifier {
   //initialization moved to main init state
   //TODO check
   // ProfileDataProvider(){
   //   initialize();
   // }

    PlayerProfileDataModel? player;
   Future<void> initialize() async {
     player = await  PlayerProfileDataSource().getUserProfile();
     notifyListeners();
   }

   Future<void> signOut(BuildContext context) async {
     TabsController.initiated = false;
     player = null;
     DataManager.deleteCachedDataBuild(context);
     //TODO wipe all data in memory?? || restart all initiators
     notifyListeners();
    await FirebaseAuth.instance.signOut();
   }

 }


