import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../control/characters_messages_list.dart';
import '../control/message.dart';

class MessageField extends StatefulWidget {
  MessageField(this.id);
  final String id;

  @override
  _MessageFieldState createState() => _MessageFieldState();
}

class _MessageFieldState extends State<MessageField> {
  TextEditingController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller!.dispose();//TODO check if doing this is ok
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    CharactersMessagesList charactersMessages =Provider.of<CharactersMessagesList>(context,listen: false);

    return Card(
      margin: const EdgeInsets.all(0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                hintText: 'Type your message here...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                String text = _controller!.text;//TODO check null safety
                print(text);
                // int index = charactersMessages.getCharacterIndex(widget.id);
                charactersMessages.addMessage(Message(message: _controller!.text,bIsMine: true),widget.id);//TODO check null safety
                charactersMessages.addMessage(Message(message: 'i am the most stupid bot',bIsMine: false),widget.id);

                setState(() {
                  _controller!.text='';//TODO check null safety
                });
               // print(_controller!.text);//TODO check null safety
              },
              icon: const Icon(Icons.send)
          ),
        ],
      ),
    );
  }
}
