import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  // File? _image;
  // Future getImage() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.camera);
  //   setState(() {
  //     _image = image as File;
  //   });
  // }

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Site Photos",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "View All >",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => pickImage(ImageSource.gallery),
                        child: Container(
                            width: 80,
                            // child: Image.asset(image),
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                                color: Colors.grey[850],
                                borderRadius: BorderRadius.circular(10)),
                            child:
                                Icon(Icons.add_a_photo, color: Colors.white)),
                      ),
                      item(image: 'assets/1.jpg'),
                      item(image: 'assets/2.jpg'),
                      item(image: 'assets/3.jpg'),
                      item(image: 'assets/4.jpg'),
                      item(image: 'assets/5.jpg'),
                      item(image: 'assets/6.jpg'),
                      image != null
                          ? Image.file(image!)
                          : Text("No image selected"),
                    ],
                  ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sample Drawing",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      item(image: 'assets/1.jpg'),
                      item(image: 'assets/2.jpg'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          alignment: Alignment.center,
          height: 50,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff121252),
          ),
          child: Text(
            "+ CREATE ALBUM",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Widget item({image}) {
    return Container(
      width: 80,
      // child: Image.asset(image),
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
    );
  }

  Widget itemText({text}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        text,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
