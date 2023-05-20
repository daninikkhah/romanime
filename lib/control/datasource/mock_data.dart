import 'dart:convert';

Map<String, dynamic> mockSceneData = {
  "current_element": null,
  "element_stats": {
    "all_tags": {
      "0": "0",
      "1": "1",
      "10": "10",
      "11": "11",
      "12": "12",
      "13": "13",
      "14": "14",
      "15": "15",
      "16": "16",
      "17": "17",
      "18": "18",
      "19": "19",
      "2": "2",
      "20": "20",
      "21": "21",
      "22": "22",
      "23": "23",
      "24": "24",
      "25": "25",
      "26": "26",
      "27": "27",
      "28": "28",
      "29": "29",
      "3": "3",
      "30": "30",
      "31": "31",
      "32": "32",
      "33": "33",
      "34": "34",
      "35": "35",
      "36": "36",
      "37": "37",
      "38": "38",
      "39": "39",
      "4": "4",
      "40": "40",
      "41": "41",
      "42": "42",
      "43": "43",
      "44": "44",
      "45": "45",
      "46": "46",
      "47": "47",
      "48": "48",
      "49": "49",
      "5": "5",
      "50": "50",
      "51": "51",
      "52": "52",
      "53": "53",
      "54": "54",
      "55": "55",
      "56": "56",
      "57": "57",
      "58": "58",
      "59": "59",
      "6": "6",
      "60": "60",
      "61": "61",
      "62": "62",
      "7": "7",
      "8": "8",
      "9": "9"
    },
    "ender": "62",
    "starter": "0",
    "tag_id_counter": 63
  },
  "elements": {
    "0": {
      "jump": null,
      "nextE": "1",
      "texts": ["Hello there!"],
      "type": "text"
    },
    "1": {
      "choices": [
        {
          "preview": "Hi-Preview1",
          "texts": ["Hi there! How are you?"],
          "var_change": [
            {"opt": "=", "val": 0, "var": "Path0"}
          ]
        },
        {
          "preview": null,
          "texts": [
            "Hi! I saw your pictures and wanted to say that you are beautiful."
          ],
          "var_change": [
            {"opt": "=", "val": 1, "var": "Path0"}
          ]
        },
        {
          "preview": "Hi-Preview2",
          "texts": [
            "Hi! You look amazing and I would love to get to know you better."
          ],
          "var_change": [
            {"opt": "=", "val": 2, "var": "Path0"}
          ]
        },
        {
          "preview": null,
          "texts": [
            "Hi! Are you from the moon? Because you cut off all my oxygen with your beauty."
          ],
          "var_change": [
            {"opt": "=", "val": 3, "var": "Path0"}
          ]
        }
      ],
      "jump": [
        {
          "conditions": [
            {"opt": "==", "val": 0, "var": "Path0"}
          ],
          "goto": "2"
        },
        {
          "conditions": [
            {"opt": "==", "val": 1, "var": "Path0"}
          ],
          "goto": "19"
        },
        {
          "conditions": [
            {"opt": "==", "val": 2, "var": "Path0"}
          ],
          "goto": "31"
        },
        "51"
      ],
      "nextE": "2",
      "type": "option"
    },
    "10": {
      "choices": [
        {
          "preview": null,
          "texts": [
            "Good luck with your work! And don\u2019t worry, it's worth waiting a bit longer to chat with someone so nice.",
            "Have a good night!"
          ],
          "var_change": null
        }
      ],
      "jump": null,
      "nextE": "11",
      "type": "option"
    },
    "11": {
      "jump": [null],
      "nextE": "12",
      "texts": ["You too, sweetie!"],
      "type": "text"
    },
    "12": {
      "jump": null,
      "nextE": "13",
      "texts": [
        "Let's see when I get off from work tomorrow and maybe we will have time then."
      ],
      "type": "text"
    },
    "13": {
      "choices": [
        {
          "preview": null,
          "texts": ["Sure. Sounds good to me. "],
          "var_change": null
        }
      ],
      "jump": [null],
      "nextE": "14",
      "type": "option"
    },
    "14": {
      "jump": null,
      "nextE": "15",
      "texts": [
        "Well, I do appreciate the compliment, so why not?",
        "I might enter later tomorrow, but let\u2019s chat then and get to know each other better.",
        "Have a good sleep!"
      ],
      "type": "text"
    },
    "15": {
      "choices": [
        {
          "preview": null,
          "texts": ["You too!"],
          "var_change": null
        }
      ],
      "jump": [null],
      "nextE": "16",
      "type": "option"
    },
    "16": {
      "jump": null,
      "nextE": "17",
      "texts": [
        "I'm sorry, but I don't talk with douchebags.",
        "Did you really have to go out of your way to be rude?"
      ],
      "type": "text"
    },
    "17": {
      "choices": [
        {
          "preview": null,
          "texts": ["I didn\u2019t mean it that way."],
          "var_change": null
        }
      ],
      "jump": null,
      "nextE": "18",
      "type": "option"
    },
    "18": {
      "jump": [null],
      "nextE": "19",
      "texts": [
        "Fine. Maybe I\u2019ve jumped the gun a little bit, but there\u2019s lots of annoying people on this app.",
        "So I wanted to chat with someone nice for a change.",
        "Let\u2019s get to know each other tomorrow and see how it goes.",
        "Good night!"
      ],
      "type": "text"
    },
    "19": {
      "jump": null,
      "nextE": "20",
      "texts": [
        "Oh, we have a charmer in here.",
        "I have to say that I like the way you look as well."
      ],
      "type": "text"
    },
    "2": {
      "jump": null,
      "nextE": "3",
      "texts": [
        "I'm fine. Just came home from work and decided to check my notifications on the app."
      ],
      "type": "text"
    },
    "20": {
      "choices": [
        {
          "preview": null,
          "texts": [
            "That's very sweet of you. They say beautiful people have it easier in life, so let's have an easy life together!"
          ],
          "var_change": [
            {"opt": "=", "val": 0, "var": "Path1"}
          ]
        },
        {
          "preview": null,
          "texts": [
            "You only like it? What about loving it? I look better than your regular guy."
          ],
          "var_change": [
            {"opt": "=", "val": 1, "var": "Path1"}
          ]
        }
      ],
      "jump": [
        {
          "conditions": [
            {"opt": "==", "val": 0, "var": "Path1"}
          ],
          "goto": "21"
        },
        "22"
      ],
      "nextE": "21",
      "type": "option"
    },
    "21": {
      "jump": ["23"],
      "nextE": "22",
      "texts": [
        "You are a forward one, aren't you?",
        "But I do like compliments, so if the talk is nice, maybe we can get further."
      ],
      "type": "text"
    },
    "22": {
      "jump": ["23"],
      "nextE": "23",
      "texts": [
        "Yeah, no. You might look good, but there's no need to be so full of yourself.",
        "We can still chat, but I wish you would be nicer."
      ],
      "type": "text"
    },
    "23": {
      "choices": [
        {
          "preview": null,
          "texts": ["Let\u2019s chat again and maybe we can go further then."],
          "var_change": [
            {"opt": "=", "val": 0, "var": "Path2"}
          ]
        },
        {
          "preview": null,
          "texts": [
            "This chat is boring me. Can we skip to the part where we share pictures?"
          ],
          "var_change": [
            {"opt": "=", "val": 1, "var": "Path2"}
          ]
        }
      ],
      "jump": [
        {
          "conditions": [
            {"opt": "==", "val": 0, "var": "Path1"},
            {"opt": "==", "val": 0, "var": "Path2"}
          ],
          "goto": "24"
        },
        {
          "conditions": [
            {"opt": "==", "val": 0, "var": "Path1"},
            {"opt": "==", "val": 1, "var": "Path2"}
          ],
          "goto": "28"
        },
        {
          "conditions": [
            {"opt": "==", "val": 1, "var": "Path1"},
            {"opt": "==", "val": 0, "var": "Path2"}
          ],
          "goto": "29"
        },
        "33"
      ],
      "nextE": "24",
      "type": "option"
    },
    "24": {
      "jump": null,
      "nextE": "25",
      "texts": [
        "Sure, sweetie. I would love to get to know you better, in more than one way.",
        "But let's save that talk for another time. I need to go to sleep."
      ],
      "type": "text"
    },
    "25": {
      "choices": [
        {
          "preview": null,
          "texts": ["Sure. Thank you for the chat! You made my night."],
          "var_change": null
        }
      ],
      "jump": null,
      "nextE": "26",
      "type": "option"
    },
    "26": {
      "jump": null,
      "nextE": "27",
      "texts": ["You are very sweet. Good night!"],
      "type": "text"
    },
    "27": {
      "choices": [
        {
          "preview": null,
          "texts": ["Night!"],
          "var_change": null
        }
      ],
      "jump": [null],
      "nextE": "28",
      "type": "option"
    },
    "28": {
      "jump": ["27"],
      "nextE": "29",
      "texts": [
        "Let's not get ahead of ourselves and skip steps.",
        "Next time, we will see what happens. But for now, I need to go.",
        "Good night!"
      ],
      "type": "text"
    },
    "29": {
      "jump": null,
      "nextE": "30",
      "texts": [
        "Maybe. It really depends on how the conversation is flowing.",
        " I\u2019m not here to judge you or ask for much, but I\u2019ve been through a lot in the last year, and I want to have a nice chat once in a while.",
        "If you would like that too, let\u2019s talk tomorrow as well."
      ],
      "type": "text"
    },
    "3": {
      "choices": [
        {
          "preview": "Kinda same- preview",
          "texts": ["Kind of the same here."],
          "var_change": null
        }
      ],
      "jump": null,
      "nextE": "4",
      "type": "option"
    },
    "30": {
      "choices": [
        {
          "preview": null,
          "texts": ["Sure. It\u2019s a date!"],
          "var_change": null
        }
      ],
      "jump": null,
      "nextE": "31",
      "type": "option"
    },
    "31": {
      "jump": null,
      "nextE": "32",
      "texts": [
        "For now, I am afraid I have to say good night though. But see you soon."
      ],
      "type": "text"
    },
    "32": {
      "choices": [
        {
          "preview": null,
          "texts": ["See you!"],
          "var_change": null
        }
      ],
      "jump": [null],
      "nextE": "33",
      "type": "option"
    },
    "33": {
      "jump": null,
      "nextE": "34",
      "texts": [
        "You are impatient and quite annoying!",
        "I was going to give you another chance, but forget about it."
      ],
      "type": "text"
    },
    "34": {
      "choices": [
        {
          "preview": null,
          "texts": [
            "Are you sure about that? I just wanted to have a nice chat."
          ],
          "var_change": null
        }
      ],
      "jump": null,
      "nextE": "35",
      "type": "option"
    },
    "35": {
      "jump": [null],
      "nextE": "36",
      "texts": [
        "Look, right now I\u2019m not feeling this conversation. Let\u2019s try later with new energies, ok?",
        "Have a good night!"
      ],
      "type": "text"
    },
    "36": {
      "jump": null,
      "nextE": "37",
      "texts": [
        "Hi! What a coincidence.",
        "I would love to know a bit more about you myself. You look cute."
      ],
      "type": "text"
    },
    "37": {
      "choices": [
        {
          "preview": null,
          "texts": ["Perfect. How about we each say one thing we love?"],
          "var_change": [
            {"opt": "=", "val": 0, "var": "Path1"}
          ]
        },
        {
          "preview": null,
          "texts": ["Great! Can I know more about your body as well?"],
          "var_change": [
            {"opt": "=", "val": 1, "var": "Path1"}
          ]
        }
      ],
      "jump": [
        {
          "conditions": [
            {"opt": "==", "val": 0, "var": "Path1"}
          ],
          "goto": "38"
        },
        "39"
      ],
      "nextE": "38",
      "type": "option"
    },
    "38": {
      "jump": ["40"],
      "nextE": "39",
      "texts": [
        "Sounds interesting. I like teaching people self defense in my spare time.",
        "What about you?"
      ],
      "type": "text"
    },
    "39": {
      "jump": ["40"],
      "nextE": "40",
      "texts": [
        "Not sure now it's the appropriate time for that.",
        "What if we get to know more about our hobbies first?",
        "For example, I like to teach people how to defend in my spare time.",
        "It\u2019s a small course, but it seems to help, so I am happy."
      ],
      "type": "text"
    },
    "4": {
      "jump": null,
      "nextE": "5",
      "texts": [
        "And I stumbled upon your profile, and you seemed nice enough, so I thought why not?"
      ],
      "type": "text"
    },
    "40": {
      "choices": [
        {
          "preview": null,
          "texts": [
            "I like playing sports in my spare time. I think it's admirable you are teaching people how to defend."
          ],
          "var_change": [
            {"opt": "=", "val": 0, "var": "Path2"}
          ]
        },
        {
          "preview": null,
          "texts": ["I love sexting beautiful girls a lot."],
          "var_change": [
            {"opt": "=", "val": 1, "var": "Path2"}
          ]
        }
      ],
      "jump": [
        {
          "conditions": [
            {"opt": "==", "val": 0, "var": "Path1"},
            {"opt": "==", "val": 0, "var": "Path2"}
          ],
          "goto": "41"
        },
        {
          "conditions": [
            {"opt": "==", "val": 0, "var": "Path1"},
            {"opt": "==", "val": 1, "var": "Path2"}
          ],
          "goto": "43"
        },
        {
          "conditions": [
            {"opt": "==", "val": 1, "var": "Path1"},
            {"opt": "==", "val": 0, "var": "Path2"}
          ],
          "goto": "44"
        },
        "48"
      ],
      "nextE": "41",
      "type": "option"
    },
    "41": {
      "jump": null,
      "nextE": "42",
      "texts": [
        "Thank you! I do it because of something that happened to me in the past.",
        "But that's a story for another time. Now I need to sleep.",
        "Good night!"
      ],
      "type": "text"
    },
    "42": {
      "choices": [
        {
          "preview": null,
          "texts": ["Night!"],
          "var_change": null
        }
      ],
      "jump": [null],
      "nextE": "43",
      "type": "option"
    },
    "43": {
      "jump": ["42"],
      "nextE": "44",
      "texts": [
        "I have to say, that's an interesting hobby.",
        "I can understand it, but not sure it's in my top 5.",
        "But we can talk more about it later, since I have to go to sleep now.",
        "Have a good night!"
      ],
      "type": "text"
    },
    "44": {
      "jump": null,
      "nextE": "45",
      "texts": [
        "Thank you! Playing sports is healthy and also pretty nice if you have someone you can play with."
      ],
      "type": "text"
    },
    "45": {
      "choices": [
        {
          "preview": null,
          "texts": [
            "Yeah. A couple of my friends are into tennis and football, so we play it when we get the time."
          ],
          "var_change": null
        }
      ],
      "jump": null,
      "nextE": "46",
      "type": "option"
    },
    "46": {
      "jump": null,
      "nextE": "47",
      "texts": [
        "That sounds lovely. I feel sorry to end our talk so abruptly, but I\u2019m afraid I have to go or else I might not wake up tomorrow on time for work.",
        "See you again next time."
      ],
      "type": "text"
    },
    "47": {
      "choices": [
        {
          "preview": null,
          "texts": ["Good night!"],
          "var_change": null
        }
      ],
      "jump": [null],
      "nextE": "48",
      "type": "option"
    },
    "48": {
      "jump": null,
      "nextE": "49",
      "texts": [
        "Sexting girls it's not a problem, but I wish you would pay more attention to what I am saying.",
        "I hope you find someone for a quick fuck, but I'm not here for this."
      ],
      "type": "text"
    },
    "49": {
      "choices": [
        {
          "preview": null,
          "texts": ["Me neither, I just wanted to be forward."],
          "var_change": null
        }
      ],
      "jump": null,
      "nextE": "50",
      "type": "option"
    },
    "5": {
      "choices": [
        {
          "preview": null,
          "texts": [
            "I'm happy we feel the same way. I loved your pictures and bio too."
          ],
          "var_change": [
            {"opt": "=", "val": 0, "var": "Path1"}
          ]
        },
        {
          "preview": null,
          "texts": ["That's nice. I know all the girls want me."],
          "var_change": [
            {"opt": "=", "val": 1, "var": "Path1"}
          ]
        }
      ],
      "jump": [
        {
          "conditions": [
            {"opt": "==", "val": 0, "var": "Path1"}
          ],
          "goto": "6"
        },
        "7"
      ],
      "nextE": "6",
      "type": "option"
    },
    "50": {
      "jump": [null],
      "nextE": "51",
      "texts": [
        "I appreciate that, but you didn\u2019t choose the best way to do so.",
        "Look, I am not here to scold you. Let\u2019s chat again tomorrow maybe and we will see how it goes from there.",
        "Bye!"
      ],
      "type": "text"
    },
    "51": {
      "jump": null,
      "nextE": "52",
      "texts": [
        "Not sure that even works, but I have to give you props for it.",
        "I heard a lot of bad pick up lines, but none like this one."
      ],
      "type": "text"
    },
    "52": {
      "choices": [
        {
          "preview": null,
          "texts": ["It's my talent. Do you want to hear another one?"],
          "var_change": [
            {"opt": "=", "val": 0, "var": "Path1"}
          ]
        },
        {
          "preview": null,
          "texts": [
            "That's mean! You should've been impressed with my compliment."
          ],
          "var_change": [
            {"opt": "=", "val": 1, "var": "Path1"}
          ]
        }
      ],
      "jump": [
        {
          "conditions": [
            {"opt": "==", "val": 0, "var": "Path1"}
          ],
          "goto": "53"
        },
        "56"
      ],
      "nextE": "53",
      "type": "option"
    },
    "53": {
      "jump": null,
      "nextE": "54",
      "texts": ["Shoot!"],
      "type": "text"
    },
    "54": {
      "choices": [
        {
          "preview": null,
          "texts": ["Do you like raisins? How do you feel about a date?"],
          "var_change": null
        }
      ],
      "jump": null,
      "nextE": "55",
      "type": "option"
    },
    "55": {
      "jump": ["57"],
      "nextE": "56",
      "texts": [
        "I have no idea if I should laugh so hard at this, but something about you makes me enjoy it."
      ],
      "type": "text"
    },
    "56": {
      "jump": ["57"],
      "nextE": "57",
      "texts": [
        "I respect your courage, but that's all.",
        "A compliment is valuable only if it is sincere."
      ],
      "type": "text"
    },
    "57": {
      "choices": [
        {
          "preview": null,
          "texts": [
            "I know the jokes are corny, but it's worth making a fool of myself for you."
          ],
          "var_change": [
            {"opt": "=", "val": 0, "var": "Path2"}
          ]
        },
        {
          "preview": null,
          "texts": [
            "Now that we got over the introduction, can I see more of you?"
          ],
          "var_change": [
            {"opt": "=", "val": 1, "var": "Path2"}
          ]
        }
      ],
      "jump": [
        {
          "conditions": [
            {"opt": "==", "val": 0, "var": "Path1"},
            {"opt": "==", "val": 0, "var": "Path2"}
          ],
          "goto": "58"
        },
        {
          "conditions": [
            {"opt": "==", "val": 0, "var": "Path1"},
            {"opt": "==", "val": 1, "var": "Path2"}
          ],
          "goto": "59"
        },
        {
          "conditions": [
            {"opt": "==", "val": 1, "var": "Path1"},
            {"opt": "==", "val": 0, "var": "Path2"}
          ],
          "goto": "60"
        },
        "62"
      ],
      "nextE": "58",
      "type": "option"
    },
    "58": {
      "jump": ["42"],
      "nextE": "59",
      "texts": [
        "You are very sweet.",
        "I am afraid I have to go, but let's chat tomorrow night as well.",
        "You made me laugh after a hard day, so thank you!",
        "Good night!"
      ],
      "type": "text"
    },
    "59": {
      "jump": ["42"],
      "nextE": "60",
      "texts": [
        "You seem to think a little too much only about yourself, but maybe it's just me.",
        "Let's chat tomorrow too because I feel like you are still nice.",
        "Good night!"
      ],
      "type": "text"
    },
    "6": {
      "jump": ["8"],
      "nextE": "7",
      "texts": [
        "Awwwww, thank you! That's very sweet of you.",
        "Unfortunately, I have to get some sleep or else I will be a walking corpse tomorrow at",
        "But I would love for us to chat again, cutie.",
        "What do you say?"
      ],
      "type": "text"
    },
    "60": {
      "jump": null,
      "nextE": "61",
      "texts": [
        "As corny as the jokes are, I like them.",
        "If you say you are honest, then thank you!",
        "Would love to stay and hear more lines, but I am afraid I have to go. Let\u2019s chat later, ok?",
        "Have a good night!"
      ],
      "type": "text"
    },
    "61": {
      "choices": [
        {
          "preview": null,
          "texts": ["You too!"],
          "var_change": null
        }
      ],
      "jump": [null],
      "nextE": "62",
      "type": "option"
    },
    "62": {
      "jump": [null],
      "nextE": null,
      "texts": [
        "I feel like you are skipping a couple of steps.",
        "What do you say if we put a stop to our chat now and resume it later when you are in a better mood?",
        "See ya again!"
      ],
      "type": "text"
    },
    "7": {
      "jump": ["8"],
      "nextE": "8",
      "texts": [
        "I hear that all the time. I know you want to show off, but that's not a great thing to say.",
        "We can talk tomorrow if you want though. Maybe you will be nicer then."
      ],
      "type": "text"
    },
    "8": {
      "choices": [
        {
          "preview": null,
          "texts": [
            "Would be my pleasure to talk with someone as beautiful as you again."
          ],
          "var_change": [
            {"opt": "=", "val": 0, "var": "Path2"}
          ]
        },
        {
          "preview": null,
          "texts": ["We will see what happens in the future."],
          "var_change": [
            {"opt": "=", "val": 1, "var": "Path2"}
          ]
        }
      ],
      "jump": [
        {
          "conditions": [
            {"opt": "==", "val": 0, "var": "Path1"},
            {"opt": "==", "val": 0, "var": "Path2"}
          ],
          "goto": "9"
        },
        {
          "conditions": [
            {"opt": "==", "val": 0, "var": "Path1"},
            {"opt": "==", "val": 1, "var": "Path2"}
          ],
          "goto": "12"
        },
        {
          "conditions": [
            {"opt": "==", "val": 1, "var": "Path1"},
            {"opt": "==", "val": 0, "var": "Path2"}
          ],
          "goto": "14"
        },
        "16"
      ],
      "nextE": "9",
      "type": "option"
    },
    "9": {
      "jump": null,
      "nextE": "10",
      "texts": [
        "Tomorrow I have a busy day again, so I might be late.",
        "But I will think about you the whole day and our next chat."
      ],
      "type": "text"
    }
  }
};

final mockJsonSceneData = json.encode(mockSceneData);
