import 'package:flutter/foundation.dart';
import 'BobsFile_outdated.dart';

class DateScreenStateManagement with ChangeNotifier{
 Talk _talk =  Bobs.next(0);

 Talk get currentTalk => _talk;
 void changeTalk(int nextTalkId){
   _talk = Bobs.next(nextTalkId);
   notifyListeners();
 }
}