import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class ThiredScreen extends StatefulWidget {
  const ThiredScreen({Key? key}) : super(key: key);


  @override
  State<ThiredScreen> createState() => _ThiredScreenState();
}

class _ThiredScreenState extends State<ThiredScreen> {
  List<int> numberList = [];
  late List<bool> numberStatus;
  List<int> numberVisibleList = [];

  bool allowClick = true;
  int? selectedIndex;

  @override
  void initState() {
    genrateList(12);
    super.initState();
  }

  void genrateList(int number) {
    Random random = Random();
    for (int i = 0; i < number / 2; i++) {
      int randomNumber = random.nextInt(100);
      if (!numberList.contains(randomNumber)) {
        numberList.add(randomNumber);
        numberList.add(randomNumber);
      }
    }
    numberList.shuffle();
    numberStatus = List<bool>.generate(number, (index) => false);
    numberVisibleList = List<int>.generate(number, (index) => -1);
    allowClick = true;
    selectedIndex = null;
    print(numberList.toList());
    print(numberStatus.toList());
    print(numberVisibleList.toList());
  }

  void machCondition(int index) {
    if (selectedIndex == null) {
      selectedIndex = index;
      numberStatus[index] = true;
      allowClick = true;
      setState(() {});
    } else {
      Future.delayed(
        const Duration(milliseconds: 500),
            () {
          if (numberList[selectedIndex!] == numberList[index]) {
            numberVisibleList[selectedIndex!] = numberList[selectedIndex!];
            numberVisibleList[index] = numberList[selectedIndex!];
            numberStatus[selectedIndex!] = true;
            numberStatus[index] = true;
          } else {
            numberStatus[index] = false;
            numberStatus[selectedIndex!] = false;
          }
          selectedIndex = null;
          allowClick = true;
          setState(() {});
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game"),
      ),
      body: GridView.builder(
        itemCount: numberList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: allowClick
                ? () {
              allowClick = false;
              if (numberStatus[index] == false && numberVisibleList[index] == -1) {
                numberStatus[index] = true;
                machCondition(index);
                setState(() {});
              }
            }
                : null,
            child: FlipCard(

              front: Card(
                color: numberStatus[index] ? Colors.white10 : Colors.green,
                child: Center(
                  child: Text(
                    numberStatus[index] ? "${numberList[index]}" : "?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              back: Card(
                color: numberStatus[index] ? Colors.white10 : Colors.green,
                child: Center(
                  child: Text(
                    numberStatus[index] ? "${numberList[index]}" : "?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
          );
          // return InkWell(
          //   onTap: allowClick
          //       ? () {
          //           allowClick = false;
          //           if (numberStatus[index] == false && numberVisibleList[index] == -1) {
          //             numberStatus[index] = true;
          //             machCondition(index);
          //             setState(() {});
          //           }
          //         }
          //       : null,
          //   child: Card(
          //     color: numberStatus[index] ? Colors.white10 : Colors.green,
          //     child: Center(
          //       child: Text(
          //         numberStatus[index] ? "${numberList[index]}" :"",
          //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //       ),
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
