import 'package:flutter/material.dart';
const String firebaseUrl ='https://europe-west2-unique-voice-351815.cloudfunctions.net/';
const Color _color = Color.fromRGBO(171, 0, 251, 1);
const Color _primaryColor = Color(0xffab00fb);
const Color _dark= Color(0xff450066);

enum MessageType{
  text,
  picture,
  voice
}

enum MessageSender{
  player,ai
}
