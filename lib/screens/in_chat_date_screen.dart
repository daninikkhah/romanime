import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../control/models/character.dart';
import '../control/state_management/characters_list_provider.dart';
import '../widgets/message_stream.dart';
import '../widgets/chat_options.dart';
import '../widgets/horizontal_progress_bar.dart';

class InChatDateScreen extends StatelessWidget {
  InChatDateScreen({required this.id});
  // static const String route = 'screens/in_chat_date_screen';
  final String id;
  @override
  Widget build(BuildContext context) {
    final Character character = Provider.of<CharactersListProvider>(context,listen: false).characters.firstWhere((character) => character.id == id);

     PreferredSizeWidget _appBar = AppBar(
      title: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(character.pictureAddress)),
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(character.name,),
                SizedBox(height: 5,),
                Text(character.bio,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black54),),
              ],
            ),
          ],
        ),
      ),
    );
    final double _height = MediaQuery.of(context).size.height;
    final double _statusBarHeight = MediaQuery.of(context).padding.top;
    final double _appBarHeight = _appBar.preferredSize.height;
    return Scaffold(
      appBar: _appBar,
      body: Stack(
        children: [
          Image.asset('lib/assets/background.png',fit: BoxFit.cover,height: _height-_appBarHeight-_statusBarHeight,),
          Container(
            child: Column(
              children: [
                HorizontalProgressBar(0.7),
                Expanded(child: MessageStream(id)),
                ChatOptions(id),
                // MessageField(id)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

