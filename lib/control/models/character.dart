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

  factory Character.fromJson(Map<String,dynamic> jsonData) {
    return Character(
      id: jsonData['id'] ?? 'null',
      pictureAddress: jsonData['picture_address'] ?? 'null',
      name: jsonData['name'] ?? 'null',
      bio: jsonData['bio'] ?? 'null',
      description: jsonData['description']?? 'null',
      tags: jsonData['tags']?? [],
      artistID: jsonData['artistID']?? 'null',
      isPlayable: jsonData['has_content']?? false
    );

  }
  @override
  String toString() => 'name: $name bio : $bio isPlayable $isPlayable picture address $pictureAddress';


}
