
class Option{
  String text;
  int next;

  Option(this.text, this.next);
}


class Talk{
  int id;
  List<String> conversations;
  List<Option> options;
  Talk(this.id, this.conversations, this.options);
}

class Bobs{
  static List<Talk> talks= [];
  static Talk next(int id){
    talks = [
      Talk(0,["Aahhh","just got back from the set. What u doing?"],[ Option("nothing much, how was the set?",1), Option("i was watching anime.",3)]),
      Talk(1,["Just the usual"," arguing with the actors about what i want and what they think i want.","anyways, I found a new restaurant near the plaza, been dying to try it out.Wanna go?"],[ Option("yeah i got time.",3), Option("not like you to be so excited about a restaurant 😏😋",2)]),
      Talk(2,["Yeah, maybe I’m just looking for an excuse to see you again 😅"],[ Option("alright, I'm in.\n see you there",3)]),
      Talk(3,["😍"],[]),
    ];

    return talks[id];
  }

}

// class Bobs{
//   static List<Talk> talks= [];
//   static Talk next(int id){
//     talks = [
//        Talk(0,["Ara Ara","arent you a young spirited lad"],[ Option("what the fuck!",1), Option("yes,yes I am",2)]),
//        Talk(1,["Oh my...","I didnt mean to scare you honey","lets have a nice chat"],[ Option("okayyyy bla bla bla bla bla bla blaaaaaaaaaaa?!",3), Option("go fuck yourself you thot",4)]),
//        Talk(2,["you know i have an ich that only a strong lad like you can scrach"],[ Option("on my way bla blaaaaaaaaaaa the bla blaaaaaaa!",5), Option("i'm weak :(",6)]),
//        Talk(3,["whats your favorite color (:D idk what normal chats look like)"],[ Option("red",2), Option("blue",2)]),
//        Talk(4,["ungrateful child! this is over!!"],[]),
//        Talk(5,["*and they fucked*"],[ Option("*i enjoyed*",7), Option("*i didnt enjoy*",4)]),
//        Talk(6,["well ...","there are toys that can always help you honey"],[ Option("that can work, i'm coming",5), Option("go f urself with thoes toys",4)]),
//        Talk(7,["*happy ending i guess*"],[])
//     ];
//
//     return talks[id];
//   }
//
// }