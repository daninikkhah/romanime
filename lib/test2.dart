// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dating_sim/test.dart';
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   final next = BackInter.next("Jqwj23411ciEgiPS0XPy", 0, 0);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: FutureBuilder(
//           builder: (context, next) => Center(
//             child: next.connectionState == ConnectionState.waiting
//                 ? CircularProgressIndicator()
//                 : Text(next.data),
//           ),
//         ),
//       ),
//     );
//   }
// }
