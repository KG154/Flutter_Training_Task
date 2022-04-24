import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class Search1 extends StatefulWidget {
  const Search1({Key? key}) : super(key: key);

  @override
  State<Search1> createState() => _Search1State();
}

class _Search1State extends State<Search1> {
  TextEditingController _textEditingController = TextEditingController();
  List foodListSearch = [];
  bool search = false;

  List<String> foodList = [
    'Orange',
    'Berries',
    'Lemons',
    'Apples',
    'Mangoes',
    'Dates',
    'Avocados',
    'Black Beans',
    'Chickpeas',
    'Pinto beans',
    'White Beans',
    'Green lentils',
    'Split Peas',
    'Rice',
    'Oats',
    'Quinoa',
    'Pasta',
    'Sparkling water',
    'Coconut water',
    'Herbal tea',
    'Kombucha',
    'Almonds',
    'Peannuts',
    'Chia seeds',
    'Flax seeds',
    'Canned tomatoes',
    'Olive oil',
    'Broccoli',
    'Onions',
    'Garlic',
    'Carots',
    'Leafy greens',
    'Meat',
  ];

  List<String> foodimage = [
    'Images/Orange.jpg',
    'Images/Berries.jpg',
    'Images/Lemons.jpg',
    'Images/Apples.jpg',
    'Images/Mangoes.jpg',
    'Images/Dates.jpg',
    'Images/Avocados.jpg',
    'Images/Rice.jpg',
    'Images/Orange.jpg',
    'Images/Berries.jpg',
    'Images/Lemons.jpg',
    'Images/Apples.jpg',
    'Images/Mangoes.jpg',
    'Images/Dates.jpg',
    'Images/Avocados.jpg',
    'Images/Rice.jpg',
    'Images/Orange.jpg',
    'Images/Berries.jpg',
    'Images/Lemons.jpg',
    'Images/Apples.jpg',
    'Images/Mangoes.jpg',
    'Images/Dates.jpg',
    'Images/Avocados.jpg',
    'Images/Rice.jpg',
    'Images/Orange.jpg',
    'Images/Berries.jpg',
    'Images/Lemons.jpg',
    'Images/Apples.jpg',
    'Images/Mangoes.jpg',
    'Images/Dates.jpg',
    'Images/Avocados.jpg',
    'Images/Rice.jpg',
    'Images/Apples.jpg',
    'Images/Mangoes.jpg',
  ];
  Icon custmicon = Icon(Icons.search);
  Widget customsearchbar = Text('Search Item');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black45,
        // title: customsearchbar,
        // automaticallyImplyLeading: false,
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       setState(() {
        //         if (custmicon.icon == Icons.search) {
        //           custmicon = const Icon(Icons.cancel);
        //           customsearchbar = const ListTile(
        //             leading: Icon(
        //               Icons.search,
        //               color: Colors.white,
        //               size: 28,
        //             ),
        //             title: TextField(
        //               onChanged: (String value) {
        //                 setState(() {
        //                   foodListSearch = foodList
        //                       .where((element) => element
        //                       .toLowerCase()
        //                       .contains(value.toLowerCase()))
        //                       .toList();
        //                 });
        //               },
        //               decoration: InputDecoration(
        //                 hintText: 'type in journal name...',
        //                 hintStyle: TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 18,
        //                   fontStyle: FontStyle.italic,
        //                 ),
        //                 border: InputBorder.none,
        //               ),
        //               style: TextStyle(
        //                 color: Colors.white,
        //               ),
        //             ),
        //           );
        //         } else {
        //           custmicon = const Icon(Icons.search);
        //           customsearchbar = const Text('My Personal Journal');
        //         }
        //       });
        //     },
        //     icon: custmicon,
        //   )
        // ],
        title: search
            ? Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    setState(() {
                      foodListSearch = foodList
                          .where((element) => element
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // focusedBorder: InputBorder.none,
                    // enabledBorder: InputBorder.none,
                    // errorBorder: InputBorder.none,
                    // disabledBorder: InputBorder.none,
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.white),
                    // contentPadding: EdgeInsets.all(8),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _textEditingController.clear();
                            search = false;
                          });
                        },
                        icon: Icon(Icons.close),
                        color: Colors.white),
                  ),
                ),
              )
            : Text('Search'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                search = true;
              });
            },
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: _textEditingController.text.isNotEmpty && foodListSearch.isEmpty
          ? Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off_outlined,
                      size: 50,
                      color: Colors.blue,
                    ),
                    Text(
                      "No Data",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
              child: ListView.builder(
                itemCount: _textEditingController.text.isNotEmpty
                    ? foodListSearch.length
                    : foodList.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.white70,
                    margin: EdgeInsets.all(4),
                    child: ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(foodimage[index]),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      title: Text(
                        _textEditingController.text.isNotEmpty
                            ? foodListSearch[index]
                            : foodList[index],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                    ),
                  );

                  //   Row(
                  //   children: [
                  //     CircleAvatar(
                  //       child: Icon(Icons.shop),
                  //     ),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     Text(
                  //       _textEditingController.text.isNotEmpty
                  //           ? foodListSearch[index]
                  //           : foodList[index],
                  //       style:
                  //           TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  //     ),
                  //   ],
                  // );
                },
              ),
            ),
    );
  }
}
