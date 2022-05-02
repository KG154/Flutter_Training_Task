import 'package:flutter/material.dart';
import 'package:taskproject/Widget/commonWidget.dart';

class Second2 extends StatefulWidget {
  String tt = '';
  String hh = '';
  String kk = '';
  Function(String, String, String) onEdit;

  Second2(
      {Key? key,
      required this.tt,
      required this.hh,
      required this.kk,
      required this.onEdit})
      : super(key: key);

  @override
  State<Second2> createState() => _Second2State();
}

class _Second2State extends State<Second2> {
  TextEditingController tname = TextEditingController();
  TextEditingController temail = TextEditingController();
  TextEditingController tpass = TextEditingController();
  bool namestatus = false;
  bool emailstatus = false;
  bool passstatus = false;
  bool showpass = true;
  String emailerror = "";
  String passworderror = "";

  @override
  void initState() {
    // TODO: implement initState
    tname.text = widget.tt;
    temail.text = widget.hh;
    tpass.text = widget.kk;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScopeNode current = FocusScope.of(context);
        if (!current.hasPrimaryFocus) {
          current.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('View And Edit Data'),
          backgroundColor: Colors.black45,
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
          child: ListView(
            padding: EdgeInsets.only(top: 100, left: 10, right: 10),
            children: [
              Container(
                child: TextField(
                  controller: tname,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    setState(() {
                      namestatus = false;
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    labelText: 'Name',
                    hintText: 'abc',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    errorText: namestatus ? 'Name Is required' : null,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: TextField(
                  controller: temail,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {
                      emailstatus = false;
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    labelText: 'Email',
                    hintText: 'abc@gmail.com',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.mail,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    errorText: emailstatus ? '$emailerror' : null,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: TextField(
                  controller: tpass,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) {
                    setState(() {
                      passstatus = false;
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    labelText: 'Password',
                    hintText: 'abc@123',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    suffixIcon: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          showpass = !showpass;
                        });
                      },
                      icon: Icon(
                          showpass ? Icons.visibility_off : Icons.visibility),
                    ),
                    errorText: passstatus ? '$passworderror' : null,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    String name = tname.text;
                    String email = temail.text;
                    String password = tpass.text;
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email);
                    // bool passwordValid = RegExp(
                    //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                    //     .hasMatch(password);
                    if (name.isEmpty && email.isEmpty && password.isEmpty) {
                      namestatus = true;
                      emailstatus = true;
                      emailerror = 'Email Is required';
                      passstatus = true;
                      passworderror = 'Password Is required';
                    } else if (name.isEmpty && email.isEmpty) {
                      namestatus = true;
                      emailstatus = true;
                      emailerror = 'Email Is required';
                    } else if (email.isEmpty && password.isEmpty) {
                      emailstatus = true;
                      emailerror = 'Email Is required';
                      passstatus = true;
                      passworderror = 'Password Is required';
                    } else if (name.isEmpty &&
                        password.isEmpty &&
                        !emailValid) {
                      namestatus = true;
                      passstatus = true;
                      passworderror = 'Password Is required';
                      emailstatus = true;
                      emailerror = 'Enter Valid Email..';
                    } else if (name.isEmpty && password.isEmpty) {
                      namestatus = true;
                      passstatus = true;
                      passworderror = 'Password Is required';
                    } else if (name.isEmpty && !emailValid) {
                      namestatus = true;
                      emailstatus = true;
                      emailerror = 'Enter Valid Email..';
                    } else if (password.isEmpty && !emailValid) {
                      passstatus = true;
                      passworderror = 'Password Is required';
                      emailstatus = true;
                      emailerror = 'Enter Valid Email..';
                    } else if (name.isEmpty) {
                      namestatus = true;
                    } else if (email.isEmpty) {
                      emailstatus = true;
                      emailerror = 'Email Is required';
                    } else if (password.isEmpty) {
                      passstatus = true;
                      passworderror = 'Password Is required';
                    } else if (!emailValid) {
                      emailstatus = true;
                      emailerror = 'Enter Valid Email..';
                    } else {
                      widget.onEdit(tname.text, temail.text, tpass.text);
                      Navigator.pop(
                        context,
                      );
                    }
                  });
                },
                child: commonButton(
                  title: "Edit",
                  margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.3,
                      vertical: size.height * 0.02),
                  width: size.width * 0.27,
                  height: size.height * 0.06,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
