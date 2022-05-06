import 'package:flutter/material.dart';
import 'package:onsiteclone/pages/attendance.dart';
import 'package:onsiteclone/pages/materialPage.dart';
import 'package:onsiteclone/pages/photoPage.dart';
import 'package:onsiteclone/pages/task.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff121252),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          title: Text("Demo Project"),
          actions: [
            IconButton(
              icon: Icon(Icons.picture_as_pdf),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                icon: Icon(Icons.people),
              ),
              Tab(text: "PAYMENT"),
              Tab(text: "ATTENDANCE"),
              Tab(text: "MATERIAL"),
              Tab(text: "TASK"),
              Tab(text: "PHOTO"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("People")),
            Center(child: Text("Payment")),
            AttendancePage(),
            MatPage(),
            TaskPage(),
            PhotoPage(),
          ],
        ),
      ),
    );
  }
}
