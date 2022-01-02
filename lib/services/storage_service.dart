

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageServices {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadImage(XFile file) async {
    await storage.ref("product_images/${file.name}").putFile(File(file.path));
  }

  Future<String> getDownloadUrl(String name)async{
    return await storage.ref("product_images/${name}").getDownloadURL();
  }
}