import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onsiteclone/pages/addMaterialPage.dart';
import 'package:image_picker/image_picker.dart';

class ReceivedPage extends StatefulWidget {
  const ReceivedPage({Key? key}) : super(key: key);

  @override
  State<ReceivedPage> createState() => _ReceivedPageState();
}

class _ReceivedPageState extends State<ReceivedPage> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = image as File;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Received",
          style: TextStyle(color: Colors.green),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: getImage,
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () => pickImage(ImageSource.gallery),
                icon: Icon(
                  Icons.photo_sharp,
                  color: Colors.white,
                )),
            Container(
                alignment: Alignment.center,
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: Text(
                  "SAVE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddMatPage(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    height: 50,
                    width: size.width * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black, width: 0.8)),
                    child: Text(
                      "Material",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    height: 50,
                    width: size.width * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black, width: 0.8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ),
                        Text(
                          "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
                          style: TextStyle(
                            color: Colors.white,
                            //fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              height: 50,
              width: size.width * 0.95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black, width: 0.8)),
              child: Text("Party Name*"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: "Quantity",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("X"),
                ),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: "Unit Rate",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("Total Amount"),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: "Notes(Bill No, Vehicle No...)",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
