import 'package:firebase_database/firebase_database.dart';

class Need {
  final String? id;
  final String imageUrl;
  final String caption;
  final String title;

  Need({
    required this.id,
    required this.imageUrl,
    required this.caption,
    required this.title,
  });

  Need.fromSnapshot(DataSnapshot snapshot) :
        id = snapshot.key,
        imageUrl = snapshot.value["imageUrl"],
        caption = snapshot.value["caption"],
        title = snapshot.value["postTitle"];

  toJson() {
    return {
      "imageUrl": imageUrl,
      "caption": caption,
      "title": title,
    };
  }
}