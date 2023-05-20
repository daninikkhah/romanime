class Character {
  final String id;
  final String name;
  final String bio;
  final String pictureAddress;
  final String? avatarPictureAddress;
  final String description;
  final List<String> tags;
  final String artistID;
  final bool isPlayable; // can be matched

  Character({
    required this.id,
    required this.pictureAddress,
    this.avatarPictureAddress,
    required this.name,
    required this.bio,
    required this.description,
    required this.tags,
    required this.artistID,
    this.isPlayable = true,
  });

  factory Character.fromJson({String? id, String? pictureAddress, String? name, String? bio, String? description, List<String>? tags, String? artistID}) {
    return Character(
      id: id?? DateTime.now().toString(),
      pictureAddress: pictureAddress ?? 'null',
      name: name?? 'null',
      bio: bio?? 'null',
      description: description?? 'null',
      tags: tags?? [],
      artistID: artistID?? 'null',
    );

  }
  @override
  String toString() => 'name: ' + name + ' bio : ' + bio + ' isPlayable ' + isPlayable.toString()+ ' picture address ' + pictureAddress;


}
