
class Artist{
  Artist({required this.id,required this.url,required this.name, required this.rate,required this.followers,required this.totalView,required this.characterIdList});
  String id;
  String url;
  String name;
  double rate;
  int followers;
  int totalView;
  List<String> characterIdList;
}

List<Artist> _artistsList = [
  Artist(id: '@planet_slayer',name: 'sargeras',rate: 5.0,followers: 1,totalView: 100000000000,characterIdList: ['1','2'],url: 'https://static.wikia.nocookie.net/wowpedia/images/3/30/Sargeras_Good.jpg/revision/latest/scale-to-width-down/465?cb=20110816022723'),
  Artist(id: '@betrayer',name: 'Illidan Stormrage',rate: 5.0,followers: 10000,totalView: 1000,characterIdList: [],url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0hwbr7Or9FD_pHo93IgrRM6BQO3sFTzuPsQ&usqp=CAU'),

/////////////////
  Artist(id: '@planet_slayer',name: 'sargeras',rate: 5.0,followers: 1,totalView: 100000000000,characterIdList: ['1','2'],url: 'https://static.wikia.nocookie.net/wowpedia/images/3/30/Sargeras_Good.jpg/revision/latest/scale-to-width-down/465?cb=20110816022723'),
  Artist(id: '@betrayer',name: 'Illidan Stormrage',rate: 5.0,followers: 10000,totalView: 1000,characterIdList: [],url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0hwbr7Or9FD_pHo93IgrRM6BQO3sFTzuPsQ&usqp=CAU'),
  Artist(id: '@planet_slayer',name: 'sargeras',rate: 5.0,followers: 1,totalView: 100000000000,characterIdList: ['1','2'],url: 'https://static.wikia.nocookie.net/wowpedia/images/3/30/Sargeras_Good.jpg/revision/latest/scale-to-width-down/465?cb=20110816022723'),
  Artist(id: '@betrayer',name: 'Illidan Stormrage',rate: 5.0,followers: 10000,totalView: 1000,characterIdList: [],url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0hwbr7Or9FD_pHo93IgrRM6BQO3sFTzuPsQ&usqp=CAU'),
  Artist(id: '@planet_slayer',name: 'sargeras',rate: 5.0,followers: 1,totalView: 100000000000,characterIdList: ['1','2'],url: 'https://static.wikia.nocookie.net/wowpedia/images/3/30/Sargeras_Good.jpg/revision/latest/scale-to-width-down/465?cb=20110816022723'),
  Artist(id: '@betrayer',name: 'Illidan Stormrage',rate: 5.0,followers: 10000,totalView: 1000,characterIdList: [],url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0hwbr7Or9FD_pHo93IgrRM6BQO3sFTzuPsQ&usqp=CAU'),

];

List<Artist> get artistsList =>_artistsList;