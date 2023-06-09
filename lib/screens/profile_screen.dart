import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../control/models/player_profile_data_model.dart';
import '../widgets/tileButton.dart';
import '../control/profile_data_provider.dart';

const String _profileUrl =
    'https://cdnb.artstation.com/p/assets/images/images/024/541/199/large/micaela-dahl-anduin-wrynn.jpg?1582745906';
const Color _appBarBackgroundColor = Color(0xFF4C086C);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Consumer<ProfileDataProvider>(
          builder: (context, profileData, _) {
            PlayerProfileDataModel? player = profileData.player;
            return player == null?
                 Container(color: Colors.blue,):
              Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    color: _appBarBackgroundColor,
                    child: Column(
                      children: [
                        Expanded(child: Container()),
                        const CircleAvatar(
                          backgroundImage: NetworkImage(_profileUrl),
                          radius: 70,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                         Text(player.name,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          player.bio,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.white70),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    TileButton(
                      title: player.email,
                      icon: Icons.email_outlined,
                      onTap: null,
                    ),
                    TileButton(
                      title: 'change password',
                      icon: Icons.key_outlined,
                      onTap: () {},
                    ),
                    TileButton(
                      title: 'sign out',
                      icon: Icons.exit_to_app,
                      onTap: ()=>profileData.signOut(context),
                    ),
                    // Switch(value: value, onChanged: onChanged)
                    // TileButton(onTap: (){}, title: 'Edit Profile', icon: Icons.edit_rounded,),
                    // TileButton(onTap: (){}, title: 'Manage Preferences', icon: Icons.tune,),
                    // TileButton(onTap: (){}, title: 'Manage Settings', icon: Icons.settings,),
                    // TileButton(onTap: (){FirebaseAuth.instance.signOut();}, title: 'Sign Out', icon: Icons.logout,),
                  ],
                ))
              ],
            );
          },
        ));
  }
}