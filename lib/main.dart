import 'package:flutter/material.dart';
import 'package:onsiteclone/pages/addMaterialPage.dart';
import 'package:onsiteclone/pages/attendance.dart';
import 'package:onsiteclone/pages/materialPage.dart';
import 'package:onsiteclone/widgets/myAppBar.dart';
import 'package:onsiteclone/photoInsert.dart';
import 'package:onsiteclone/pages/photoPage.dart';
import 'package:onsiteclone/pages/receivedPage.dart';
import 'package:onsiteclone/pages/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AttendancePage(),
    );
  }
}
