import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  DateTime _date = DateTime.now();

  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
  List<String> days = [
    "Mon",
    "Tue",
    "Wed",
    "Thur",
    "Fri",
    "Sat",
    "Sun",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                Text(
                  "${_date.day} ${months[_date.month - 1]}, ${days[_date.weekday - 1]}",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Present",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "0",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Absent",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "0",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  VerticalDivider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Day's Salary",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "0",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sample User 1",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "0",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Electrician",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "600 per day",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    //ChoiceChip(label: Text("Present"), selected: false),
                    Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        child: Text(
                          "Present",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        child: Text(
                          "Absent",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(6)),
                        child: Icon(
                          Icons.arrow_downward,
                          color: Colors.grey,
                          size: 15,
                        )),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mason",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "500 per day",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        child: Text(
                          "Present",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        child: Text(
                          "Absent",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(6)),
                        child: Icon(
                          Icons.arrow_downward,
                          color: Colors.grey,
                          size: 15,
                        )),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sample User 2",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "0",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Carpenter Level 1",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "750 per day",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        child: Text(
                          "Present",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        child: Text(
                          "Absent",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(6)),
                        child: Icon(
                          Icons.arrow_downward,
                          color: Colors.grey,
                          size: 15,
                        )),
                  ],
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
            color: Colors.grey[850],
          ),
          child: Text(
            "+ Add Worker",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
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
