import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CloudStorageDatasource{
  final storageRef = FirebaseStorage.instance.ref();
  // final String storageUrl = 'gs://unique-voice-351815.appspot.com';

  static Future<Uint8List?> getImage(String? address) async{

    if(address == null)
      return null;
    final storageRef = FirebaseStorage.instance.ref();
    final islandRef = storageRef.child(address);
    Uint8List? image;
    try {
      const oneMegabyte = 1024 * 1024 * 64;// TODO it is probably too much
      image = await islandRef.getData(oneMegabyte);
      // Data for "images/island.jpg" is returned, use this as needed.
    } on FirebaseException catch (e) {
      print('////////// download task error /////////////////');
      print(e);
      // Handle any errors.
    }
    return image;
  }
}