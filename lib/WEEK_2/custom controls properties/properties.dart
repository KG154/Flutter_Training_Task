import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:toggle_switch/toggle_switch.dart';

class propertis extends StatefulWidget {
  const propertis({Key? key}) : super(key: key);

  @override
  State<propertis> createState() => _propertisState();
}

class _propertisState extends State<propertis> {
  List ll = [
    "Male",
    "Female",
    "Other",
  ];
  List chek = [
    "one",
    "two",
    "tree",
  ];

  int? select;
  int? abc;
  bool _enable = false;


  bool? isSelected = false;
  bool? isSelected1 = false;
  bool? isSelected2 = false;
  bool? isSelected3 = false;
  bool value = false;

  String choi = "";
  late List<bool> _isChecked;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isChecked = List<bool>.filled(chek.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('custom controls properties'),
        backgroundColor:  Colors.black45,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                alignment: Alignment.center,
                height: 30,
                child: Text(
                  'Custom  controls properties',
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2)),
              ),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.center,
                // width: 30,
                height: 30,
                child: Text(
                  'Radio',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 170,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: ll.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        setState(() {
                          select = index;
                        });
                      },
                      title: Text(
                        ll[index],
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      leading: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: index == select ? Colors.blue : Colors.white,
                          border: Border.all(width: 2),
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                height: 30,
                child: Text(
                  'Check Box',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected!;
                  });
                },
                title: Text(
                  'Male',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                trailing: Container(
                  width: 25,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: isSelected! ? Colors.blue : Colors.transparent,
                      border: isSelected!
                          ? null
                          : Border.all(color: Colors.grey, width: 2)),
                  child: isSelected!
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    isSelected1 = !isSelected1!;
                  });
                },
                title: Text(
                  'Female',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                trailing: Container(
                  width: 25,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: isSelected1! ? Colors.blue : Colors.transparent,
                      border: isSelected1!
                          ? null
                          : Border.all(color: Colors.grey, width: 2)),
                  child: isSelected1!
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    isSelected2 = !isSelected2!;
                  });
                },
                title: Text(
                  'Other',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                trailing: Container(
                  width: 25,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: isSelected2! ? Colors.blue : Colors.transparent,
                      border: isSelected2!
                          ? null
                          : Border.all(color: Colors.grey, width: 2)),
                  child: isSelected2!
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    isSelected3 = !isSelected3!;
                  });
                },
                title: Text(
                  'ABCD',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                trailing: Container(
                  width: 25,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: isSelected3! ? Colors.blue : Colors.transparent,
                      border: isSelected3!
                          ? null
                          : Border.all(color: Colors.grey, width: 2)),
                  child: isSelected3!
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
              ////
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                height: 30,
                child: Text(
                  'Toggle',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Customs(
                value: _enable,
                onChanged: (bool val){
                  setState(() {
                    _enable = val;
                  });
                },
              ),
              // CupertinoSwitch(
              //   trackColor: Colors.limeAccent,
              //   activeColor: Colors.grey,
              //   thumbColor: Colors.redAccent,
              //   value: value,
              //   onChanged: (newvalue) {
              //     setState(
              //       () {
              //         value = newvalue;
              //       },
              //     );
              //   },
              // ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                alignment: Alignment.center,
                height: 30,
                child: Text(
                  'Default controls properties',
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2)),
              ),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                height: 30,
                child: Text(
                  'Default Radio',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RadioListTile(
                  title: Text('Male',                      style: TextStyle( color: Colors.white),
                  ),
                  value: "Male",
                  groupValue: choi,
                  // toggleable: true,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      choi = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('Female',style: TextStyle( color: Colors.white),),
                  value: "Female",
                  activeColor: Colors.green,
                  groupValue: choi,
                  // toggleable: true,
                  onChanged: (value) {
                    setState(() {
                      choi = value.toString();
                    });
                  }),
              RadioListTile(
                  title: Text('Other',style: TextStyle( color: Colors.white),),
                  value: "Other",
                  activeColor: Colors.green,
                  groupValue: choi,
                  // toggleable: true,
                  onChanged: (value) {
                    setState(() {
                      choi = value.toString();
                    });
                  }),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                height: 30,
                child: Text(
                  'Default Toggle Switch',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 107, vertical: 10),
                child: ToggleSwitch(
                  // minWidth: 90.0,
                  cornerRadius: 20.0,
                  activeBgColors: [
                    [Colors.green[800]!],
                    [Colors.red[800]!]
                  ],
                  activeFgColor: Colors.white,
                  // inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: 1,
                  totalSwitches: 2,
                  labels: ['True', 'False'],
                  radiusStyle: true,
                  // onToggle: (index) {
                  //   print('switched to: $index');
                  // },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                height: 30,
                child: Text(
                  'Default CheckBox',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              Container(
                // height: 225,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: chek.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      title: Text(chek[index],style: TextStyle( color: Colors.white),),
                      value: _isChecked[index],
                      onChanged: (value) {
                        setState(() {
                          _isChecked[index] = value!;
                        });
                      },
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

/**/

class Customs extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  Customs({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  _CustomsState createState() => _CustomsState();
}

class _CustomsState extends State<Customs>
    with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
        begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
        end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 45.0,
            height: 28.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: _circleAnimation!.value == Alignment.centerLeft
                  ? Colors.grey
                  : Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
              child: Container(
                alignment:
                widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.redAccent),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

