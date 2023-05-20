
class PlayerProfileDataModel{
  final String name;
  final String bio;
  final String email;
  final bool isBinary ;
  final bool isFemale;
  const PlayerProfileDataModel({required this.name, this.bio ='',required this.email,this.isBinary = true,this.isFemale= true });

  factory PlayerProfileDataModel.fromJson(Map<String,dynamic> json) => PlayerProfileDataModel(name: json['name']??'null', email: json['email']??'null');

  @override
  String toString() {
    return '{ name: '+ name+', email: '+email+ ', bio: '+bio+ ', isBinary: '+isBinary.toString()+ ', isFemale: '+isFemale.toString()+ ' }';
  }
   
}