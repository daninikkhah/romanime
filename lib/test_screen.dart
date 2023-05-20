import'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'control/datasource/cloud_storage_datasource.dart';

// to test cloudStorageDatasource.getImage //TODO delete

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder<Uint8List?>(
        future: CloudStorageDatasource.getImage("Nyx/intro.png"),
          builder: (context,image){
          if( image.connectionState == ConnectionState.done) {
            Uint8List? imageData = image.data;
              return imageData == null
                  ?  Expanded(
                      child: Container(
                      color: Colors.red,
                    ))
                  : Image.memory(imageData);
            }
          return Center(child: CircularProgressIndicator());
          }
      ),
    );
  }
}

