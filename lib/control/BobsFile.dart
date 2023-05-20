
import '../constants.dart';

class Option {
  final List<String> textsList;
  final int next;
  final int point;

  Option(this.textsList, this.next, {this.point = 0});

  @override
  String toString() {
    return textsList.toString() + ' -> ' + next.toString();
  }
}

class Conversation {
  final MessageType type;
  final String content;

  Conversation(this.type, this.content);

  @override
  String toString() {
    return type.toString() + ': ' + content;
  }
}

class Talk {
  final int id;
  final List<Conversation> conversations;
  final List<Option> options;

  Talk(this.id, this.conversations, this.options);

  @override
  String toString() {
    return '[ id: ' +
        id.toString() +
        ', conversation: ' +
        conversations.toString() +
        ', options: ' +
        options.toString() +
        ']';
  }
}

// class Talks{
//   List<Talk> talks= [];
//   Talks(this.talks);
//   Talk next(int id){ // For getting the ith talk
//     return talks[id];
//   }
//   void add(Talk newTalk){ // For adding new Talk to Talks
//     talks.add(newTalk);
//   }
//   @override
//   String toString(){
//     String temp = '';
//     for (int i = 0; i < talks.length; i++){
//       temp += talks[i].toString() + '\n';
//     }
//     return temp;
//   }
// }

void main() {
  List<Talk> talks = [
    Talk(0, [], [
      Option(["The wanted is here!"], 1),
      Option(["Hello, I saw your post just now and I think I can help."], 3),
      Option(["Hey hey hey! I think you're looking for a hacker."], 4),
      Option(["Hacker at your service my lady."], 5)
    ]),
    Talk(1, [
      Conversation(MessageType.text, "Uh… Who?")
    ], [
      Option(["Hacker :) I'm <Username>."], 5)
    ]),
    Talk(2, [
      Conversation(MessageType.text, "Hi! You know hacking then?")
    ], [
      Option(["Yes, in fact I do. My name is <Username>."], 5)
    ]),
    Talk(3, [
      Conversation(MessageType.text, "Hey… Yes, actually I am.")
    ], [
      Option(["Then here I am! <Username>."], 5)
    ]),
    Talk(4, [
      Conversation(MessageType.text, "… Hi.")
    ], [
      Option(["Hello, beauty. This is <Username>."], 5)
    ]),
    Talk(5, [
      Conversation(
          MessageType.text, "Raven. It's a pleasure to meet you, <Username>.")
    ], [
      Option(["So how can I help you?"], 6)
    ]),
    Talk(6, [
      Conversation(MessageType.text, "Well… how to say this…"),
      Conversation(
          MessageType.text, "It's not your usual type of hacking case.")
    ], [
      Option(["Well does hacking even have a usual type?"], 7)
    ]),
    Talk(7, [
      Conversation(MessageType.text, "…"),
      Conversation(MessageType.text, "You've got a point there… yeah.")
    ], [
      Option(["LOL."], 8)
    ]),
    Talk(8, [
      Conversation(MessageType.text,
          "Ok... So first of all; What's your opinion on FangsCo?")
    ], [
      Option(["FangsCo… Like that vampire support company?"], 9)
    ]),
    Talk(9, [
      Conversation(MessageType.text, "The same one.")
    ], [
      Option([
        "well",
        "I don't care about them. Boring… toooooo boring. Is this all about that freaking place?"
      ], 10),
      Option([
        "Well…",
        "I don't know them that much; all I know is that they give blood and supplies to vampires.",
        "Why?"
      ], 11),
      Option([
        "Well…",
        "They're pretty cool! ",
        "They help people, so I like them."
      ], 12),
      Option([
        "Well…",
        "Well, they have pretty red-eyed women working for them although you're prettier… but besides that nothing.",
        "How come?"
      ], 13)
    ]),
    Talk(10, [
      Conversation(
          MessageType.text, "Well I'm gonna make it interesting for you then.")
    ], [
      Option(["Oh…? Wait, what?"], 14)
    ]),
    Talk(11, [
      Conversation(MessageType.text,
          "That is correct but that's not the only thing they do…")
    ], [
      Option(["What do you mean?"], 15)
    ]),
    Talk(12, [
      Conversation(MessageType.text, "Oh…"),
      Conversation(MessageType.text, "Are you by any chance related to them?"),
      Conversation(MessageType.text, "Working for them maybe?"),
      Conversation(MessageType.text, "Any friends in there or something?")
    ], [
      Option(["No… But why are you asking these?"], 16)
    ]),
    Talk(13, [
      Conversation(MessageType.text, "…"),
      Conversation(MessageType.text, "Yeah."),
      Conversation(MessageType.text,
          "Well, I must say don't trust any pretty women you see then!")
    ], [
      Option([
        "All women are dangerous, cutie.",
        "That's not something new.",
        "Anyways, why they and why do you think they're not trustworthy?"
      ], 17)
    ]),
    Talk(14, [
      Conversation(MessageType.text,
          "Well, for now, let's say they're not as innocent as they show… "),
      Conversation(
          MessageType.text, "And I need your help to catch them red-handed. ")
    ], [
      Option(["…", "You mean, literally busting FangsCo… right?"], 18)
    ]),
    Talk(15, [
      Conversation(MessageType.text,
          "Well, for now, let's say they're not as innocent as they show… "),
      Conversation(
          MessageType.text, "And I need your help to catch them red-handed. ")
    ], [
      Option(["…", "You mean, literally busting FangsCo… right?"], 19)
    ]),
    Talk(16, [
      Conversation(MessageType.text,
          "Well, for now, let's say they're not as innocent as they show… "),
      Conversation(
          MessageType.text, "And I need your help to catch them red-handed. ")
    ], [
      Option(["…", "You mean, literally busting FangsCo… right?"], 20)
    ]),
    Talk(17, [
      Conversation(MessageType.text,
          "Well, for now, let's say they're not as innocent as they show… "),
      Conversation(
          MessageType.text, "And I need your help to catch them red-handed. ")
    ], [
      Option(["…", "You mean, literally busting FangsCo… right?"], 21)
    ]),
    Talk(18, [
      Conversation(MessageType.text, "Yes."),
      Conversation(MessageType.text,
          "You're looking for something entertaining, my case is gonna be thrilling for you."),
      Conversation(MessageType.text, "Interested now?")
    ], [
      Option([
        "Hell yeah!",
        "Are we gonna catch some bad guys or something?",
        "Should I wear my hero suit?"
      ], 22),
      Option([
        "You've got me now.",
        "100% interested.",
        "Damn it. You play dirty."
      ], 23)
    ]),
    Talk(19, [
      Conversation(MessageType.text, "Yes."),
      Conversation(MessageType.text,
          "People take them for being all as angels but my side of the story proves otherwise."),
      Conversation(MessageType.text, "I need help to prove my story…")
    ], [
      Option([
        "What you saying is that you want to bust them up… ",
        "That sounds risky, are you sure?"
      ], 24),
      Option(["That sounds dangerous."], 25)
    ]),
    Talk(20, [
      Conversation(MessageType.text, "Yes."),
      Conversation(MessageType.text, "Because I need to be careful with them.")
    ], [
      Option([
        "Well I understand why you're worried so it's okay.",
        "I work for IntellectMagic as a programmer. My Work ID is 788965. You can check it up on our website."
      ], 26),
      Option(
          ["You're making it sound like they're all bad guys in the movies!"],
          27)
    ]),
    Talk(21, [
      Conversation(MessageType.text, "Yes."),
      Conversation(MessageType.text,
          "If only you knew what I know right now, you wouldn’t even look at those beautiful women you're talking about…"),
      Conversation(
          MessageType.text, "I need help to show how monstrous they are.")
    ], [
      Option([
        "Harsh baby, I like.",
        "So…",
        "You need me to be your shining prince on a white horse for you?",
        "Want me to fight for you, princess?"
      ], 28),
      Option([
        "Jealous?",
        "You're more beautiful than any of them. Don’t worry I like you the most."
      ], 29)
    ]),
    Talk(22, [
      Conversation(MessageType.text, "Even more."),
      Conversation(MessageType.text, "Wear your work suit, my friend."),
      Conversation(MessageType.text, "We're gonna save some vampires.")
    ], [
      Option(["All ready!", "Now may I hear what has angered our heroine?"], 30)
    ]),
    Talk(23, [
      Conversation(MessageType.text, "XD"),
      Conversation(MessageType.text, "You asked for it.")
    ], [
      Option(
          ["You're right…", "Okay, shoot me!", "What's the plot of our story?"],
          30)
    ]),
    Talk(24, [
      Conversation(MessageType.text, "I have nothing to lose."),
      Conversation(MessageType.text, "They took everything I had"),
      Conversation(MessageType.text, "Now I'm coming for everything they have.")
    ], [
      Option([
        "I'm sorry to hear that, Raven.",
        "Can you explain it a little more?"
      ], 30)
    ]),
    Talk(25, [
      Conversation(MessageType.text, "It is…")
    ], [
      Option(["Tell me all about it.", "What's wrong with FangsCo?"], 30)
    ]),
    Talk(26, [
      Conversation(MessageType.text, "Give me a second."),
      Conversation(MessageType.text, "Wow! What a portfolio!"),
      Conversation(MessageType.text, "Okay, I'm sorry for acting awkward.")
    ], [
      Option([
        "Thanks and don't apologize!",
        "You have every right to be cautious.",
        "Tell me what's going on with them."
      ], 30)
    ]),
    Talk(27, [
      Conversation(MessageType.text, "I mean…"),
      Conversation(MessageType.text, "They kind of are like that!")
    ], [
      Option(["But why?", "Tell me all about it!"], 30)
    ]),
    Talk(28, [
      Conversation(MessageType.text, "Princess?"),
      Conversation(MessageType.text,
          "I'm the monster under the bed, crawling out to eat their flesh."),
      Conversation(MessageType.text, "What do I need?"),
      Conversation(MessageType.text,
          "Need you to tie them up so they can't escape my hell.")
    ], [
      Option([
        "I just had chills all over my body.",
        "Damn, so savage!",
        "You sound extra attractive baby.",
        "Tell me why you're thirsty for their blood, my hunter queen?"
      ], 30)
    ]),
    Talk(29, [
      Conversation(MessageType.text, "That worries me more actually.")
    ], [
      Option([
        "Aw that braked my heart…",
        "Please don't be shy with me.",
        "Jokes aside, care to explain your story for me?"
      ], 30)
    ]),
    Talk(30, [
      Conversation(MessageType.text, "Well, Long story short…"),
      Conversation(MessageType.text,
          "They say their products are cruelty-free and not they only its income is used for charity but they are planning on opening a dorm for vampires in need."),
      Conversation(
          MessageType.text, "I'm pretty sure you've heard these before.")
    ], [
      Option(["Yes."], 31)
    ]),
    Talk(31, [
      Conversation(MessageType.text,
          "What I'm gonna tell you next is kind of hard to believe."),
      Conversation(MessageType.text,
          "And this is why exactly I'm asking for a hacker's help."),
      Conversation(MessageType.text,
          "I have no evidence but scars on my heart and body which are no help for proving them guilty.")
    ], [
      Option(["We won't know unless we try.", "Tell me."], 32)
    ]),
    Talk(32, [
      Conversation(MessageType.text,
          "FangsCo has a pretty secretive system. They don't share anything with outside."),
      Conversation(MessageType.text,
          "They stop information leaks at any cost and no one dares to defy them."),
      Conversation(MessageType.text, "So naturally, no one knows of this.")
    ], [
      Option(["What?"], 33)
    ]),
    Talk(33, [
      Conversation(MessageType.text,
          "In FangsCo vampires play the role of guinea pigs."),
      Conversation(
          MessageType.text, "They experiment on vampires for their products.")
    ], [
      Option(
          ["What the actual hell?!", "How…", "I mean how do you know this?!"],
          34)
    ]),
    Talk(34, [
      Conversation(MessageType.text, "I was there."),
      Conversation(MessageType.text, "I was one…")
    ], [
      Option(["WHAT?!"], 35)
    ]),
    Talk(35, [
      Conversation(MessageType.text, "That's a story for another time… "),
      Conversation(MessageType.text,
          "All I can say is that they're looking for me everywhere.")
    ], [
      Option(["You know what you shouldn't know?"], 36)
    ]),
    Talk(36, [
      Conversation(MessageType.text, "Well, I'm basically on a run."),
      Conversation(
          MessageType.text, "I escaped FangsCo Laboratory two years ago.")
    ], [
      Option(
          ["Hold on a second!", "This is all too much to take in at a moment!"],
          37)
    ]),
    Talk(37, [
      Conversation(MessageType.text, "More shocking news then."),
      Conversation(MessageType.text,
          "Bet you didn't know that they're one of the best sellers in the black market.")
    ], [
      Option(["Black market?!"], 38)
    ]),
    Talk(38, [
      Conversation(MessageType.text,
          "Drugs for vampires, weapons against vampires and so many disgusting things that I don’t want to talk about…")
    ], [
      Option(["Okay, let's pretend that what you're saying is true."], 39)
    ]),
    Talk(39, [
      Conversation(MessageType.text, "IT IS.")
    ], [
      Option(["Why do you need a hacker?"], 40)
    ]),
    Talk(40, [
      Conversation(MessageType.text, "To prove what I just said."),
      Conversation(MessageType.text,
          "Their system is pretty complicated. They have many layers in the system and the deepest layer is the key to the root. When I was there, they referred to it as SEED."),
      Conversation(MessageType.text,
          "SEED is basically where they keep a record of everything."),
      Conversation(MessageType.text,
          "Back then I remember only a few of them had access to SEED. They took so many pictures and videos of us then and all of them are stored in SEED. Research notes, records of laboratory, sales reports, product lists and their customers and sponsors.")
    ], [
      Option(["You want me to get to the SEED..."], 41)
    ]),
    Talk(41, [
      Conversation(MessageType.text, "Yes…"),
      Conversation(MessageType.text, "If you believe any of my words that is."),
      Conversation(MessageType.text, "Are you in, <Username>?")
    ], [
      Option(["Let's get them high on their own drugs!", "Count me in!"], 42),
      Option(["Of course, I am.", "I'll get their SEED for you."], 43),
      Option(["Let's kick their asses, Raven!"], 44),
      Option([
        "Will I escort my lady on this dangerous and sickening journey?",
        "I sure as hell am."
      ], 45)
    ])
    /*
       Talk(42,[new Conversation('text',"Well, <username>. You're now my partner in crime!"),new Conversation('text',"Load your guns!"),new Conversation('text',)],[new Option()]),
       Talk(43,[new Conversation('text',),new Conversation('text',),new Conversation('text',)],[new Option()]),
       Talk(44,[new Conversation('text',),new Conversation('text',),new Conversation('text',)],[new Option()]),
       Talk(45,[new Conversation('text',),new Conversation('text',),new Conversation('text',)],[new Option()]),
       Talk(46,[new Conversation('text',),new Conversation('text',),new Conversation('text',)],[new Option()])
       Talk(47,[new Conversation('text',),new Conversation('text',),new Conversation('text',)],[new Option()]),
       Talk(48,[new Conversation('text',),new Conversation('text',),new Conversation('text',)],[new Option()]),
       Talk(49,[new Conversation('text',),new Conversation('text',),new Conversation('text',)],[new Option()])
       */
  ];
  // print(t);
}
