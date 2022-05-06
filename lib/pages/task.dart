import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
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
                          "Delayed",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          "1",
                          style: TextStyle(
                            color: Colors.red,
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
                          "On Track",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          "2",
                          style: TextStyle(
                            color: Colors.green,
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
                          "Completed",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "1",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Flexible(
                child: ListTile(
                  leading: Text(
                    "Starts",
                    style: TextStyle(color: Colors.grey),
                  ),
                  title: Text(
                    "Task Name",
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Text(
                    "Ends",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Text("Progress", style: TextStyle(color: Colors.grey)),
            ],
          ),
          Row(
            children: [
              redTile("18 Apr", "Walls Erection", "03 May"),
              SizedBox(
                width: 2,
              ),
              prgRed("80%"),
            ],
          ),
          Row(
            children: [
              greenTile("08 Apr", "Foundation", "26 Apr"),
              SizedBox(
                width: 2,
              ),
              prgGreen("30%"),
            ],
          ),
          Row(
            children: [
              greenTile("26 Apr", "Lanter for House", "07 Jun"),
              SizedBox(
                width: 2,
              ),
              prgGreen("0%"),
            ],
          ),
          Row(
            children: [
              greyTile("29 Mar", "Excavation", "23 Apr"),
              SizedBox(
                width: 2,
              ),
              prgGrey("100%"),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          _bottomSheet2(context);
        },
        child: Container(
            alignment: Alignment.center,
            height: 50,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff121252),
            ),
            child: Text(
              "+ ADD NEW TASK",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
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

  Widget redTile(String leading, String title, String trailing) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.red[200], borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: Text(leading, style: TextStyle(color: Colors.red)),
            title: Text(title, style: TextStyle(color: Colors.red)),
            trailing: Text(trailing, style: TextStyle(color: Colors.red)),
          ),
        ),
      ),
    );
  }

  Widget greenTile(String leading, String title, String trailing) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Text(leading, style: TextStyle(color: Colors.green)),
              title: Text(title, style: TextStyle(color: Colors.green)),
              trailing: Text(trailing, style: TextStyle(color: Colors.green)),
            )),
      ),
    );
  }

  Widget greyTile(String leading, String title, String trailing) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Text(leading, style: TextStyle(color: Colors.white)),
              title: Text(title, style: TextStyle(color: Colors.white)),
              trailing: Text(trailing, style: TextStyle(color: Colors.white)),
            )),
      ),
    );
  }

  Widget prgRed(String prg) {
    return Container(
      alignment: Alignment.center,
      height: 55,
      width: 55,
      decoration: BoxDecoration(
          color: Colors.red[200], borderRadius: BorderRadius.circular(10)),
      child: Text(
        prg,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Widget prgGreen(String prg) {
    return Container(
      alignment: Alignment.center,
      height: 55,
      width: 55,
      decoration: BoxDecoration(
          color: Colors.green[200], borderRadius: BorderRadius.circular(10)),
      child: Text(
        prg,
        style: TextStyle(color: Colors.green),
      ),
    );
  }

  Widget prgGrey(String prg) {
    return Container(
      alignment: Alignment.center,
      height: 55,
      width: 55,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(10)),
      child: Text(
        prg,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  _bottomSheet2(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext c) {
          return Container(
            //height: 350,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Task Name", border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    //height: 50,
                    //width: size.width * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black, width: 0.8)),
                    child: Row(
                      children: [
                        Text("Start Date"),
                        Text(
                          "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
                          style: TextStyle(
                            color: Colors.black,
                            //fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    //height: 50,
                    //width: size.width * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black, width: 0.8)),
                    child: Row(
                      children: [
                        Text("End Date"),
                        Text(
                          "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
                          style: TextStyle(
                            color: Colors.black,
                            //fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  color: Colors.pink,
                  onPressed: () {},
                  child: Text("SAVE TASK"),
                ),
              ],
            ),
          );
        });
  }
}
