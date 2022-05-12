import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
import 'package:taskproject/Widget/commonWidget.dart';

class In_App_Purchase extends StatefulWidget {
  const In_App_Purchase({Key? key}) : super(key: key);

  @override
  State<In_App_Purchase> createState() => _In_App_PurchaseState();
}

class _In_App_PurchaseState extends State<In_App_Purchase> {
  StreamSubscription? _purchaseUpdatedSubscription;
  StreamSubscription? _purchaseErrorSubscription;
  StreamSubscription? _conectionSubscription;
  final List<String> _productLists = Platform.isAndroid
      ? [
          'android.test.purchased',
          'point_1000',
        ]
      : ['com.cooni.point1000', 'com.cooni.point5000'];

  String _platformVersion = 'Unknown';
  List<IAPItem> _items = [];
  List<PurchasedItem> _purchases = [];
  Color cardColor = Colors.white;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _getProduct();
  }

  Future<void> initPlatformState() async {
    String? platformVersion;
    try {
      platformVersion = await FlutterInappPurchase.instance.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    var result = await FlutterInappPurchase.instance.initConnection;
    print('result: $result');

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion!;
    });

    // refresh items for android
    try {
      String msg = await FlutterInappPurchase.instance.consumeAllItems;
      print('consumeAllItems: $msg');
    } catch (err) {
      print('consumeAllItems error: $err');
    }

    _conectionSubscription =
        FlutterInappPurchase.connectionUpdated.listen((connected) {
      print('connected: $connected');
    });

    _purchaseUpdatedSubscription =
        FlutterInappPurchase.purchaseUpdated.listen((productItem) {
      _getPurchases();
      print('purchase-updated: $productItem');
    });

    _purchaseErrorSubscription =
        FlutterInappPurchase.purchaseError.listen((purchaseError) {
      print('purchase-error: $purchaseError');
    });
    _getPurchases();
  }

  void _requestPurchase(IAPItem item) {
    FlutterInappPurchase.instance.requestPurchase(item.productId!);
  }

  Future _getProduct() async {
    List<IAPItem> items =
        await FlutterInappPurchase.instance.getProducts(_productLists);
    for (var item in items) {
      print('${item.toString()}');
      this._items.add(item);
    }

    setState(() {
      this._items = items;
      // this._purchases = [];
    });
  }

  Future _getPurchases() async {
    List<PurchasedItem>? items =
        await FlutterInappPurchase.instance.getAvailablePurchases();
    for (var item in items!) {
      print('${item.toString()}');
      this._purchases.add(item);
    }

    setState(() {
      this._purchases = items;
    });
    if (_purchases.length > 0) {
      setState(() {
        cardColor = Colors.grey;
      });
    }
  }

  Future _getPurchaseHistory() async {
    List<PurchasedItem>? items =
        await FlutterInappPurchase.instance.getPurchaseHistory();
    for (var item in items!) {
      print('${item.toString()}');
      this._purchases.add(item);
    }

    setState(() {
      this._items = [];
      this._purchases = items;
    });
  }

  @override
  void dispose() {
    if (_conectionSubscription != null) {
      _conectionSubscription?.cancel();
      _conectionSubscription = null;
    }
    super.dispose();
  }

  List<Widget> _renderInApps() {
    List<Widget> widgets = this
        ._items
        .map((item) => Column(
              children: [
                Card(
                  color: cardColor,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "productId :- ${item.productId.toString()}\nTitle :- ${item.title.toString()}\ncurrency :- ${item.currency.toString()}\nDescription :-  ${item.description.toString()}\nprice :- ${item.price.toString()}",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("---------- Buy Item Button Pressed");
                    this._requestPurchase(item);
                  },
                  child: commonButton(
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 110),
                      title: "Buy Item"),
                ),
              ],
            ))
        .toList();
    return widgets;
  }

  List<Widget> _renderPurchases() {
    List<Widget> widgets = this
        ._purchases
        .map((item) => Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        "TransactionId :-  ${item.transactionId.toString()}",
                        style: TextStyle(
                          // fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
        .toList();
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 20;
    double buttonWidth = (screenWidth / 3) - 20;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "In App Purchase",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topRight,
        //     end: Alignment.bottomLeft,
        //     colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)],
        //   ),
        // ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    child: Text(
                      '$_platformVersion\n',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 5,
                        ),

                        InkWell(
                          onTap: () {
                            print("Get Items Button Pressed");
                            this._getProduct();
                          },
                          child: commonButton(
                              title: 'Get Items', height: 40, width: 150),
                        ),

                        // Expanded(
                        //   child: FlatButton(
                        //     padding: EdgeInsets.all(0.0),
                        //     color: Colors.green,
                        //     onPressed: () {
                        //       print("Get Items Button Pressed");
                        //       this._getProduct();
                        //     },
                        //     child: Container(
                        //       padding: EdgeInsets.symmetric(horizontal: 20.0),
                        //       alignment: Alignment(0.0, 0.0),
                        //       child: Text(
                        //         'Get Items',
                        //         style: TextStyle(
                        //           fontSize: 16.0,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        // Flexible(
                        //     // width: buttonWidth,
                        //     // height: 60.0,
                        //     // margin: EdgeInsets.all(7.0),
                        //     child: FlatButton(
                        //   color: Colors.green,
                        //   padding: EdgeInsets.all(0.0),
                        //   onPressed: () {
                        //     print("---------- Get Purchases Button Pressed");
                        //     this._getPurchases();
                        //   },
                        //   child: Container(
                        //     padding: EdgeInsets.symmetric(horizontal: 20.0),
                        //     alignment: Alignment(0.0, 0.0),
                        //     child: Text(
                        //       'Get Purchases',
                        //       style: TextStyle(
                        //         fontSize: 16.0,
                        //       ),
                        //     ),
                        //   ),
                        // )),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        // Flexible(
                        //     // width: buttonWidth,
                        //     // height: 60.0,
                        //     // margin: EdgeInsets.all(7.0),
                        //     child: FlatButton(
                        //   color: Colors.green,
                        //   padding: EdgeInsets.all(0.0),
                        //   onPressed: () {
                        //     print(
                        //         "---------- Get Purchase History Button Pressed");
                        //     this._getPurchaseHistory();
                        //   },
                        //   child: Container(
                        //     padding: EdgeInsets.symmetric(horizontal: 20.0),
                        //     alignment: Alignment(0.0, 0.0),
                        //     child: Text(
                        //       'Get Purchase History',
                        //       style: TextStyle(
                        //         fontSize: 16.0,
                        //       ),
                        //     ),
                        //   ),
                        // )),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: this._renderInApps(),
                ),
                Column(
                  children: this._renderPurchases(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
