import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class PhotoInsert extends StatefulWidget {
  const PhotoInsert({Key? key}) : super(key: key);

  @override
  State<PhotoInsert> createState() => _PhotoInsertState();
}

class _PhotoInsertState extends State<PhotoInsert> {
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final images = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (images == null) return;

      final imageTemporary = File(images.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  File? _image;
  Future pickImageC() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = image as File;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              color: Colors.blue,
              child: const Text("Pick Image from Gallery",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold)),
              onPressed: () {
                pickImage(ImageSource.gallery);
              }),
          MaterialButton(
              color: Colors.blue,
              child: const Text("Pick Image from Camera",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold)),
              onPressed: () {
                pickImageC();
              }),
          SizedBox(
            height: 20,
          ),
          image != null ? Image.file(image!) : Text("No image selected")
        ],
      ),
    );
  }
}
