import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../control/state_management/matched_characters_provider.dart';
import '../widgets/contact_card.dart';

const Color _primaryColor = Color(0xFFAB3DDF);
const Color _secondaryColor = Color.fromRGBO(124, 17, 174,59);//TODO check the alpha

class ChatsScreen extends StatelessWidget {
  static const String route = 'screens/chartsScreen';

  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [_primaryColor, _secondaryColor])
          ),
        ),
        title: const Text('matches'),
        actions: [IconButton(icon: const Icon(Icons.search,size: 40,),iconSize: 40, onPressed: (){})],
      ),
      body: Consumer<MatchedCharactersProvider>(
        builder: (context, characters, _) {
          return ListView.builder(
              itemCount: characters.matchedCharacters.length,
              itemBuilder: (context, index) {
                // Character character = characters.likedCharacters[index];
                return ContactCard(index);
              });
        },
      ),
    );
  }
}
