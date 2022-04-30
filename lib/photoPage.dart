import 'package:flutter/material.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff121252),
        toolbarHeight: 0.0,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.topCenter,
            color: Color(0xff121252),
            height: 110,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.grey, width: 0.8)),
                            child: Text(
                              "DP",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                              ),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Demo Project",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 38,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Icon(
                        Icons.people,
                        color: Colors.grey,
                      ),
                      itemText(text: "PAYMENT"),
                      itemText(text: "ATTENDANCE"),
                      itemText(text: "MATERIAL"),
                      itemText(text: "TASK"),
                      itemText(text: "PHOTO"),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
                      item(image: 'assets/1.jpg'),
                      item(image: 'assets/2.jpg'),
                      item(image: 'assets/3.jpg'),
                      item(image: 'assets/4.jpg'),
                      item(image: 'assets/5.jpg'),
                      item(image: 'assets/6.jpg'),
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
