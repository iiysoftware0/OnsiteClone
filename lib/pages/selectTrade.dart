import 'package:flutter/material.dart';

class SelectTrade extends StatelessWidget {
  const SelectTrade({Key? key, required String trade}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> trades = [
      'Civil',
      'Electrical',
      'Plumbing',
      'Painting',
      'Wood Work',
      'Earth Work',
      'Others',
    ];
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Select Trade"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: trades.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(trades[index]);
                  },
                  child: ListTile(
                    title: Text(
                      trades[index].toString(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ),
                );
              },
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
            "+ ADD NEW TRADE",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
