// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// class Option{
//   String text;
//   int next;
//
//   Option(this.text, this.next);
// }
//
//
// class Talk{
//   Talk(this.conversations, this.options);
//   List<String> conversations;
//   List<Option> options;
// }
//
// class BackInter{
//   static FirebaseFirestore firestore = FirebaseFirestore.instance;
//   static CollectionReference artist = firestore.collection('ArtistProfile');
//   static CollectionReference content = firestore.collection('Contest');
//   static dynamic next(String cId,int epNum,int tId) async {
//     content.doc(cId)
//         .get()
//         .then((DocumentSnapshot documentSnapshot) {
//       if (! documentSnapshot.exists) {
//         return 'document doesnt exist';
//       }
//       try {
//         dynamic nested = documentSnapshot.data();
//         print(nested);
//         return nested[epNum]["Episode"][tId];
//       } on StateError catch(e) {
//         print('No nested field exists!');
//       }
//     });
//     return null;
//   }
//
// }
//
// class Test extends StatefulWidget {
//
//   @override
//   _TestState createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//   final next = BackInter.next("Jqwj23411ciEgiPS0XPy",0,0);
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(builder: (context,next){
//       return Container();
//     });
//   }
// }
//
