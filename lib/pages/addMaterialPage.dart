import 'package:flutter/material.dart';

import 'package:onsiteclone/pages/selectTrade.dart';

class AddMatPage extends StatefulWidget {
  const AddMatPage({Key? key, required String selMat}) : super(key: key);

  @override
  State<AddMatPage> createState() => _AddMatPageState();
}

class _AddMatPageState extends State<AddMatPage> {
  bool _onClicked = false;
  List<String> items = ['bags', 'numbers', 'meter', 'kg', 'litre', 'ton'];
  String trade = '';
  // List<String> trades = [
  //   'Civil',
  //   'Electrical',
  //   'Plumbing',
  //   'Earth Work',
  //   'Painting',
  //   'Wood Work'
  // ];
  List<String> tile = [];

  String? selectedItem = 'bags';
  //String? selectedTrade = 'Civil';
  String? value;
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Material Library"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _onClicked
                ? Visibility(
                    visible: _onClicked,
                    child: Container(
                      //margin: EdgeInsets.all(8),
                      //padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _textController,
                            onChanged: (text) {
                              value = text;
                            },
                            style: TextStyle(color: Colors.white),
                            //keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              labelText: "Material Name",
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: size.width * 0.95,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Colors.black, width: 0.8)),
                            child: DropdownButton<String>(
                                underline: Container(),
                                value: selectedItem,
                                items: items
                                    .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                        )))
                                    .toList(),
                                onChanged: (item) => setState(
                                      () => selectedItem = item,
                                    )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () async {
                              final newTrade = await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SelectTrade(
                                    trade: trade,
                                  ),
                                ),
                              );
                              setState(() {
                                this.trade = newTrade;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              height: 50,
                              //width: size.width * 0.95,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.black, width: 0.8)),
                              child: Text(
                                trade,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          // Container(
                          //   alignment: Alignment.center,
                          //   width: size.width * 0.95,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(5),
                          //       border: Border.all(
                          //           color: Colors.black, width: 0.8)),
                          //   child: DropdownButton<String>(
                          //       underline: Container(),
                          //       value: selectedTrade,
                          //       items: trades
                          //           .map((trade) => DropdownMenuItem<String>(
                          //               value: trade,
                          //               child: Text(
                          //                 trade,
                          //               )))
                          //           .toList(),
                          //       onChanged: (trade) => setState(
                          //             () => selectedTrade = trade,
                          //           )),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                value = _textController.text;
                              });
                            },
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  tile.add(value!);
                                  //tile.add(selectedItem!);
                                  //tile.add(selectedTrade!);
                                  //tile2.add(selectedItem!);
                                });
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  //width: size.width * 0.9,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff121252),
                                  ),
                                  child: Text(
                                    "CONTINUE",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ))
                : Column(
                    children: [
                      TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Search Material",
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                      // TextFormField(
                      //   style: TextStyle(color: Colors.white),
                      //   //keyboardType: TextInputType.number,
                      //   decoration: const InputDecoration(
                      //     labelStyle: TextStyle(color: Colors.white),
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.white),
                      //     ),
                      //     labelText: "Search Material",
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            _onClicked = !_onClicked;
                          });
                        },
                        leading: Icon(
                          Icons.delivery_dining,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Add New Material",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Company Material Library",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
            Flexible(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: ListView(
                  children: tile.map((element) => Text(element)).toList(),
                ),
              ),
            ),
            // Expanded(
            //   child: ListView.builder(
            //       //padding: const EdgeInsets.all(8),
            //       itemCount: 6,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Padding(
            //           padding: const EdgeInsets.all(5.0),
            //           child: Container(
            //             padding: EdgeInsets.all(12),
            //             decoration: BoxDecoration(
            //               color: Colors.grey[850],
            //               borderRadius: BorderRadius.circular(5),
            //             ),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               //crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       "Steel 10 mm",
            //                       //"$value",
            //                       style: TextStyle(color: Colors.white),
            //                     ),
            //                     Text(
            //                       "Trade: Steel Structure",
            //                       //"$selectedTrade",
            //                       style: TextStyle(color: Colors.white),
            //                     ),
            //                   ],
            //                 ),
            //                 Text(
            //                   "Unit: numbers",
            //                   //"$selectedItem",
            //                   style: TextStyle(color: Colors.white),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         );
            //       }),
            // ),
          ],
        ),
      ),
    );
  }
}
