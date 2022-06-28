import 'package:bakerie_haven/Services/firebase_api_storage.dart';
import 'package:bakerie_haven/models/firebase_file.dart';
import 'package:flutter/material.dart';
import 'package:bakerie_haven/models/product.dart';

class ImagePage extends StatelessWidget {
  final FirebaseFile file;
  final Product prod;
  ImagePage({
    // Key? key,
    required this.file,
    required this.prod,
  }); // : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isImage = ['.jpeg', '.jpg', '.png'].any(file.name.contains);

    return Scaffold(
        appBar: AppBar(
          title: Text(prod.prodName),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.file_download),
              onPressed: () async {
                await FirebaseApi.downloadFile(file.ref);

                final snackBar = SnackBar(
                  content: Text('Downloaded ${file.name}'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            const SizedBox(width: 12),
          ],
        ),
        body: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  file.url,
                  // height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ));
  }
}
