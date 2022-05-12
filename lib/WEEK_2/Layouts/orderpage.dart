import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class orderpage extends StatefulWidget {
  const orderpage({Key? key}) : super(key: key);

  @override
  State<orderpage> createState() => _orderpageState();
}

class _orderpageState extends State<orderpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      // textBaseline: TextBaseline.ideographic,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 30,
                                color: Colors.red,
                              ),
                              Text(
                                'Golf Course Road',
                                style: TextStyle(
                                    // decoration: TextDecoration.underline,
                                    //   decorationStyle: TextDecorationStyle.dotted,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("Images/profile.jpg"),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //serach//
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 13, horizontal: 5),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [Colors.white70, Colors.white70],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      border: Border.all(width: 0.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 8,
                          spreadRadius: 1,
                          offset: Offset(1, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 35),
                          child: Text(
                            'Restaurant name,cuisine,or a dish',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 16),
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.black54,
                          thickness: 1,
                          endIndent: 8,
                          indent: 8,
                        ),
                        Icon(
                          Icons.align_horizontal_left_outlined,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     gradient: LinearGradient(
                  //       colors: [Colors.white70, Colors.white70],
                  //       begin: Alignment.centerLeft,
                  //       end: Alignment.centerRight,
                  //     ),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.grey.shade200,
                  //         blurRadius: 8,
                  //         spreadRadius: 1,
                  //         offset: Offset(1, 8),
                  //       ),
                  //     ],
                  //   ),
                  //   child: TextField(
                  //     enabled: false,
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10)),
                  //       prefixIcon: Icon(
                  //         Icons.search,
                  //         size: 30,
                  //         color: Colors.red,
                  //       ),
                  //       suffixIcon: Icon(
                  //         Icons.align_horizontal_left,
                  //         color: Colors.black,
                  //       ),
                  //       hintText: 'Restaurant name,cuisine,or a dish',
                  //     ),
                  //   ),
                  // ),

                  DefaultTabController(
                    initialIndex: 0,
                    length: 6,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: TabBar(
                            indicatorColor: Colors.black87,
                            labelColor: Colors.black87,
                            isScrollable: true,
                            tabs: [
                              Tab(
                                text: 'All',
                              ),
                              Tab(text: 'Biryani'),
                              Tab(text: 'Dosa'),
                              Tab(text: 'Sushi'),
                              Tab(text: 'Pizza'),
                              Tab(text: 'Dal Makhan'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 425,
                          child: TabBarView(
                            children: [
                              AllPage(),
                              Container(
                                child: Center(
                                  child: Text('Biryani',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Text('Dosa',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Text('Sushi',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Text('Pizza',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Text('Dal Makhan',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*-------------------------------------------------------------------------------------------------*/
class AllPage extends StatefulWidget {
  const AllPage({Key? key}) : super(key: key);

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  List<anc> _list = [
    anc(
      img: "Images/man.jpg",
      flat: ' % FLAT 15-25% OFF ',
      pro: " * Pro ",
      rat: ' 4.5 ★ ',
      toplab: ' ★Top Rated  ',
      firstText: 'Veg Manchurian',
      lastText: 'Japanese, Korean',
    ),
    anc(
      img: "Images/im2.jpg",
      flat: ' % FLAT 15-20% OFF ',
      pro: '',
      rat: ' 4.4 ★ ',
      toplab: ' 💗 Frequently Ordered  ',
      firstText: 'Asian Food Haus',
      lastText: 'Asian, Chinese',
    ),
    anc(
      img: "Images/bishmillah.jpg",
      flat: ' % FLAT 10-25% OFF ',
      pro: '',
      rat: ' 4.0 ★ ',
      toplab: ' ★Top Rated  ',
      firstText: 'Bishmillah',
      lastText: 'Ice Cream',
    ),
    anc(
      img: "Images/snack.jpg",
      flat: ' % FLAT 5-7% OFF ',
      pro: " * Pro ",
      rat: ' 3.2 ★ ',
      toplab: ' 💗 Frequently Ordered  ',
      firstText: 'Kailash Snacks',
      lastText: 'Mithai',
    )
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        //order again//
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 5, right: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order again',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 23),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  'see all',
                  style: TextStyle(color: Colors.pink, fontSize: 15),
                ),
              )
            ],
          ),
        ),

        //images//

        Container(
          height: 165,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("Images/burger.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              'PRO',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  backgroundColor: Colors.red),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 70,
                          width: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Burger',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 3, bottom: 3),
                                child: Text('30 mins'),
                              ),
                              Text(
                                '40% off',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("Images/Berries.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 70,
                          width: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Food house home',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 3, bottom: 3),
                                child: Text('30-35 mins'),
                              ),
                              Text(
                                '20% off',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("Images/pizza.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 60,
                          width: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "La Pino'z Pizza",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 3, bottom: 3),
                                child: Text('30 mins'),
                              ),
                              Text(
                                '10% off',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("Images/tea.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  'PRO',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      backgroundColor: Colors.red),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 60,
                          width: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tinkopa in cafe',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 3, bottom: 3),
                                child: Text('30-35 mins'),
                              ),
                              Text(
                                '25% off',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("Images/home.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          // child: Container(
                          //   margin: EdgeInsets.only(top: 10),
                          //   child: Text(
                          //     'PRO',
                          //     style: TextStyle(
                          //         fontSize: 16,
                          //         color: Colors.white,
                          //         backgroundColor:
                          //             Colors.red),
                          //   ),
                          // ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 70,
                          width: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Home Style lunch',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 3, bottom: 3),
                                child: Text('10-20 mins'),
                              ),
                              Text(
                                '5% off',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("Images/kachori.jpg"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 60,
                            width: 85,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kachori',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 3, bottom: 3),
                                  child: Text('26-30 mins'),
                                ),
                                Text(
                                  '13% off',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        //list//

        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.save_alt_outlined,
                      size: 30,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade200,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Saved',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          'Places',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('Images/pro.jpg'),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'PRO',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          'Partners',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: Text(
                      '%',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.shade100,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Great',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          'Offers',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('Images/star.jpg'),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Top',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          'Rated',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('Images/diamond.jpg'),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Premium',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          'Picks',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        /////////////////

        Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 8, right: 5, bottom: 20),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  image: DecorationImage(
                      image: AssetImage("Images/chikan.jpg"),
                      fit: BoxFit.cover),
                  // shape: BoxShape.circle,
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Based on what you like',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      'Chiken Dumolings',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10),
                child: Text(
                  'see all',
                  style: TextStyle(color: Colors.pinkAccent),
                ),
              )
            ],
          ),
        ),
        /*
        Main image
        */

        GridView.builder(
            itemCount: _list.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 5, top: 10, bottom: 5, right: 5),
                alignment: Alignment.center,
                // height: size.height * 0.25,
                // width: size.width * 0.06,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: size.height * 0.19,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: AssetImage(_list[index].img),
                              fit: BoxFit.cover,
                            ),
                            // shape: BoxShape.circle,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  child: Text(_list[index].toplab,
                                      style: TextStyle(
                                        color: Colors.orange[800],
                                        //backgroundColor: Colors.white
                                      )),
                                ),
                                Container(
                                  width: size.width * 0.35,
                                  margin: EdgeInsets.only(right: 50, top: 65),
                                  decoration: BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.elliptical(5, 5),
                                        bottomRight: Radius.elliptical(5, 5)),
                                  ),
                                  child: Text(
                                    _list[index].flat,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 2, right: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: _list[index].pro != ''
                                              ? Colors.red
                                              : Colors.transparent,
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.elliptical(5, 5),
                                              bottomRight:
                                                  Radius.elliptical(5, 5)),
                                        ),
                                        child: Text(
                                          _list[index].pro,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: size.width * 0.05,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          _list[index].rat,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 3, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _list[index].firstText,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _list[index].lastText,
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Stack(
        //           children: [
        //             Container(
        //               width: MediaQuery.of(context).size.width / 2.2,
        //               height: 150,
        //               decoration: BoxDecoration(
        //                 color: Colors.red,
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(10),
        //                 ),
        //                 image: DecorationImage(
        //                     image: AssetImage("Images/man.jpg"),
        //                     fit: BoxFit.cover),
        //                 // shape: BoxShape.circle,
        //               ),
        //               child: Container(
        //                 decoration: BoxDecoration(
        //                   color: Colors.black12,
        //                   borderRadius: BorderRadius.all(
        //                     Radius.circular(10),
        //                   ),
        //                 ),
        //                 child: Column(
        //                   children: [
        //                     Container(
        //                       height: 20,
        //                       alignment: Alignment.center,
        //                       margin: EdgeInsets.only(
        //                           top: 10, right: 70, left: 10),
        //                       decoration: BoxDecoration(
        //                           color: Colors.white,
        //                           borderRadius: BorderRadius.circular(5)),
        //                       child: Text(' ★Top Rated  ',
        //                           style: TextStyle(
        //                             color: Colors.orange[800],
        //                             //backgroundColor: Colors.white
        //                           )),
        //                     ),
        //                     Container(
        //                       width: 120,
        //                       margin: EdgeInsets.only(right: 50, top: 75),
        //                       decoration: BoxDecoration(
        //                         color: Colors.indigo,
        //                         borderRadius: const BorderRadius.only(
        //                             topRight: Radius.elliptical(5, 5),
        //                             bottomRight: Radius.elliptical(5, 5)),
        //                       ),
        //                       child: Text(
        //                         ' % FLAT 15-25% OFF  ',
        //                         style: TextStyle(
        //                           fontSize: 13,
        //                           color: Colors.white,
        //                         ),
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding:
        //                           const EdgeInsets.only(top: 2, right: 5),
        //                       child: Row(
        //                         mainAxisAlignment:
        //                             MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           Container(
        //                             decoration: BoxDecoration(
        //                               color: Colors.red,
        //                               borderRadius: const BorderRadius.only(
        //                                   topRight: Radius.elliptical(5, 5),
        //                                   bottomRight:
        //                                       Radius.elliptical(5, 5)),
        //                             ),
        //                             child: Text(
        //                               ' * PRO ',
        //                               style: TextStyle(
        //                                 fontSize: 13,
        //                                 color: Colors.white,
        //                               ),
        //                             ),
        //                           ),
        //                           Container(
        //                             height: 19,
        //                             decoration: BoxDecoration(
        //                               color: Colors.green,
        //                               borderRadius: BorderRadius.circular(5),
        //                             ),
        //                             child: Text(
        //                               ' 4.5 ★ ',
        //                               style: TextStyle(
        //                                 fontSize: 13,
        //                                 fontWeight: FontWeight.bold,
        //                                 color: Colors.white,
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(top: 5, left: 3, bottom: 10),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 'Veg Manchurian',
        //                 style: TextStyle(
        //                     fontSize: 20, fontWeight: FontWeight.bold),
        //               ),
        //               Text(
        //                 'Japanese, Korean',
        //                 style: TextStyle(color: Colors.black54),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Stack(
        //           children: [
        //             Container(
        //               width: MediaQuery.of(context).size.width / 2.2,
        //               height: 150,
        //               decoration: BoxDecoration(
        //                 color: Colors.red,
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(10),
        //                 ),
        //                 image: DecorationImage(
        //                     image: AssetImage("Images/im2.jpg"),
        //                     fit: BoxFit.cover),
        //                 // shape: BoxShape.circle,
        //               ),
        //               child: Container(
        //                 decoration: BoxDecoration(
        //                   color: Colors.black12,
        //                   borderRadius: BorderRadius.all(
        //                     Radius.circular(10),
        //                   ),
        //                 ),
        //                 child: Column(
        //                   children: [
        //                     Container(
        //                       height: 20,
        //                       alignment: Alignment.center,
        //                       margin: EdgeInsets.only(
        //                           top: 10, right: 20, left: 10),
        //                       decoration: BoxDecoration(
        //                           color: Colors.white,
        //                           borderRadius: BorderRadius.circular(5)),
        //                       child: Text(' 💗 Frequently Ordered ',
        //                           style: TextStyle(
        //                             color: Colors.orange[800],
        //                           )),
        //                     ),
        //                     Stack(
        //                       children: [
        //                         Container(
        //                           width: 120,
        //                           margin: EdgeInsets.only(right: 50, top: 85),
        //                           decoration: BoxDecoration(
        //                             color: Colors.indigo,
        //                             borderRadius: const BorderRadius.only(
        //                                 topRight: Radius.elliptical(5, 5),
        //                                 bottomRight: Radius.elliptical(5, 5)),
        //                           ),
        //                           child: Text(
        //                             ' % FLAT 15-25% OFF  ',
        //                             style: TextStyle(
        //                               fontSize: 13,
        //                               color: Colors.white,
        //                             ),
        //                           ),
        //                         ),
        //                         Container(
        //                           height: 19,
        //                           margin: EdgeInsets.only(
        //                             left: 122,
        //                             top: 90,
        //                           ),
        //                           decoration: BoxDecoration(
        //                             color: Colors.green,
        //                             borderRadius: BorderRadius.circular(5),
        //                           ),
        //                           child: Text(
        //                             ' 4.5 ★ ',
        //                             style: TextStyle(
        //                               fontSize: 13,
        //                               fontWeight: FontWeight.bold,
        //                               color: Colors.white,
        //                             ),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(top: 5, left: 3, bottom: 10),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 'Asian Food Haus',
        //                 style: TextStyle(
        //                     fontSize: 20, fontWeight: FontWeight.bold),
        //               ),
        //               Text(
        //                 'Asian, Chinese',
        //                 style: TextStyle(color: Colors.black54),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     )
        //   ],
        // ),
        //
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Stack(
        //           children: [
        //             Container(
        //               width: MediaQuery.of(context).size.width / 2.2,
        //               height: 150,
        //               decoration: BoxDecoration(
        //                 color: Colors.red,
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(10),
        //                 ),
        //                 image: DecorationImage(
        //                     image: AssetImage("Images/bishmillah.jpg"),
        //                     fit: BoxFit.cover),
        //                 // shape: BoxShape.circle,
        //               ),
        //               child: Container(
        //                 decoration: BoxDecoration(
        //                   color: Colors.black12,
        //                   borderRadius: BorderRadius.all(
        //                     Radius.circular(10),
        //                   ),
        //                 ),
        //                 child: Column(
        //                   children: [
        //                     Container(
        //                       height: 20,
        //                       alignment: Alignment.center,
        //                       margin: EdgeInsets.only(
        //                           top: 10, right: 70, left: 10),
        //                       decoration: BoxDecoration(
        //                           color: Colors.white,
        //                           borderRadius: BorderRadius.circular(5)),
        //                       child: Text(' ★Top Rated   ',
        //                           style: TextStyle(
        //                             color: Colors.orange[800],
        //                             //backgroundColor: Colors.white
        //                           )),
        //                     ),
        //                     Padding(
        //                       padding:
        //                           const EdgeInsets.only(top: 90, right: 5),
        //                       child: Row(
        //                         mainAxisAlignment:
        //                             MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           Container(
        //                             decoration: BoxDecoration(
        //                               color: Colors.red,
        //                               borderRadius: const BorderRadius.only(
        //                                   topRight: Radius.elliptical(5, 5),
        //                                   bottomRight:
        //                                       Radius.elliptical(5, 5)),
        //                             ),
        //                             child: Text(
        //                               ' * PRO ',
        //                               style: TextStyle(
        //                                 fontSize: 13,
        //                                 color: Colors.white,
        //                               ),
        //                             ),
        //                           ),
        //                           Container(
        //                             height: 19,
        //                             decoration: BoxDecoration(
        //                               color: Colors.green,
        //                               borderRadius: BorderRadius.circular(5),
        //                             ),
        //                             child: Text(
        //                               ' 4.0 ★ ',
        //                               style: TextStyle(
        //                                 fontSize: 13,
        //                                 fontWeight: FontWeight.bold,
        //                                 color: Colors.white,
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(top: 5, left: 3, bottom: 10),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 'Bishmillah',
        //                 style: TextStyle(
        //                     fontSize: 20, fontWeight: FontWeight.bold),
        //               ),
        //               Text(
        //                 'Ice Cream',
        //                 style: TextStyle(color: Colors.black54),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Stack(
        //           children: [
        //             Container(
        //               width: MediaQuery.of(context).size.width / 2.2,
        //               height: 150,
        //               decoration: BoxDecoration(
        //                 color: Colors.red,
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(10),
        //                 ),
        //                 image: DecorationImage(
        //                     image: AssetImage("Images/snack.jpg"),
        //                     fit: BoxFit.cover),
        //                 // shape: BoxShape.circle,
        //               ),
        //               child: Container(
        //                 decoration: BoxDecoration(
        //                   color: Colors.black12,
        //                   borderRadius: BorderRadius.all(
        //                     Radius.circular(10),
        //                   ),
        //                 ),
        //                 child: Column(
        //                   children: [
        //                     Container(
        //                       height: 20,
        //                       alignment: Alignment.center,
        //                       margin: EdgeInsets.only(
        //                           top: 10, right: 20, left: 10),
        //                       decoration: BoxDecoration(
        //                           color: Colors.white,
        //                           borderRadius: BorderRadius.circular(5)),
        //                       child: Text(' 💗 Frequently Ordered ',
        //                           style: TextStyle(
        //                             color: Colors.orange[800],
        //                           )),
        //                     ),
        //                     Stack(
        //                       children: [
        //                         Container(
        //                           width: 120,
        //                           margin: EdgeInsets.only(right: 50, top: 85),
        //                           decoration: BoxDecoration(
        //                             color: Colors.indigo,
        //                             borderRadius: const BorderRadius.only(
        //                                 topRight: Radius.elliptical(5, 5),
        //                                 bottomRight: Radius.elliptical(5, 5)),
        //                           ),
        //                           child: Text(
        //                             ' % FLAT 5-7% OFF  ',
        //                             style: TextStyle(
        //                               fontSize: 13,
        //                               color: Colors.white,
        //                             ),
        //                           ),
        //                         ),
        //                         Container(
        //                           height: 19,
        //                           margin: EdgeInsets.only(
        //                             left: 122,
        //                             top: 90,
        //                           ),
        //                           decoration: BoxDecoration(
        //                             color: Colors.green,
        //                             borderRadius: BorderRadius.circular(5),
        //                           ),
        //                           child: Text(
        //                             ' 3.2 ★ ',
        //                             style: TextStyle(
        //                               fontSize: 13,
        //                               fontWeight: FontWeight.bold,
        //                               color: Colors.white,
        //                             ),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(top: 5, left: 3, bottom: 10),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 'Kailash Snacks',
        //                 style: TextStyle(
        //                     fontSize: 20, fontWeight: FontWeight.bold),
        //               ),
        //               Text(
        //                 'Mithai',
        //                 style: TextStyle(color: Colors.black54),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     )
        //   ],
        // ),
      ],
    );
  }
}

class anc {
  final String img;
  final String flat;
  final String rat;
  final String pro;
  final String toplab;
  final String firstText;
  final String lastText;

  anc({
    required this.img,
    required this.flat,
    required this.rat,
    required this.pro,
    required this.toplab,
    required this.firstText,
    required this.lastText,
  });
}
