import 'package:flutter/material.dart';

import 'second.dart';

class First1 extends StatefulWidget {
  const First1({Key? key}) : super(key: key);

  @override
  State<First1> createState() => _First1State();
}

class _First1State extends State<First1> {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode current = FocusScope.of(context);
        if (!current.hasPrimaryFocus) {
          current.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Insert Data'),
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
            padding: EdgeInsets.only(top: 180, left: 10, right: 10),
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
                  style: const TextStyle(color: Colors.white),
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
                padding: EdgeInsets.only(top: 15, bottom: 30),
                child: TextField(
                  controller: tpass,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: showpass,
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
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        String name = tname.text;
                        String email = temail.text;
                        String password = tpass.text;

                        bool emailValid = RegExp(
                                r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
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
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Second2(
                                tt: name,
                                hh: email,
                                kk: password,
                                onEdit: (n1, n2, n3) {
                                  tname.text = n1;
                                  temail.text = n2;
                                  tpass.text = n3;
                                },
                              );
                            },
                          ));
                        }
                      });
                    },
                    child: Text('SUBMIT')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
