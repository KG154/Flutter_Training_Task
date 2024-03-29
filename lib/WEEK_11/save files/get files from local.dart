import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

import '../../Widget/commonWidget.dart';

List listFiles = List.empty(growable: true);

class file_Screen extends StatefulWidget {
  const file_Screen({Key? key}) : super(key: key);

  @override
  State<file_Screen> createState() => _file_ScreenState();
}

class _file_ScreenState extends State<file_Screen> {
  TextEditingController tname = TextEditingController();
  TextEditingController tdoc = TextEditingController();
  bool namestatus = false;
  bool docstatus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "save/get files from local",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25, left: 10, right: 10),
              child: commonTextField(
                controller: tname,
                onchange: (value) {
                  setState(() {
                    namestatus = false;
                  });
                },
                color: Colors.black54,
                labelText: 'File Name',
                errorText: namestatus ? 'File Name Is required' : null,
                prefixIcon: Icons.person,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25, left: 10, right: 10),
              child: commonTextField(
                controller: tdoc,
                maxLines: 5,
                onchange: (value) {
                  setState(() {
                    docstatus = false;
                  });
                },
                color: Colors.black54,
                labelText: 'Message',
                errorText: docstatus ? 'Message Is required' : null,
                prefixIcon: Icons.message,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (tname.text.isEmpty && tdoc.text.isEmpty) {
                    namestatus = true;
                    docstatus = true;
                  } else if (tname.text.isEmpty) {
                    namestatus = true;
                  } else if (tdoc.text.isEmpty) {
                    docstatus = true;
                  } else {
                    // saveFile();
                    // print("success");
                    FileUtils.saveToFile("${tname.text}.txt", tdoc.text).then(
                      (value) => {
                        FileUtils.getFiles().then(
                          (value) => {
                            setState(
                              () {
                                listFiles = value;
                              },
                            )
                          },
                        )
                      },
                    );
                    tdoc.clear();
                    tname.clear();
                  }
                });
              },
              child: Text("Save File"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ViewFilePAge();
                    },
                  ),
                );
              },
              child: Text("view"),
            ),
          ],
        ),
      ),
    );
  }

// Future<File> saveFile() async {
//   final directory = await getApplicationDocumentsDirectory();
//   final path = directory.path;
//   print("path == ${path}");
//   final file = File("$path/${tname.text}.txt");
//   print("file == ${file}");
//   print("${file.writeAsString(tdoc.text)}");
//   return file.writeAsString(tdoc.text);
// }
}

class ViewFilePAge extends StatefulWidget {
  const ViewFilePAge({Key? key}) : super(key: key);

  @override
  State<ViewFilePAge> createState() => _ViewFilePAgeState();
}

class _ViewFilePAgeState extends State<ViewFilePAge> {
  TextEditingController tname = TextEditingController();
  TextEditingController tdoc = TextEditingController();
  bool namestatus = false;
  bool docstatus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FileUtils.getFiles().then((value) => {
          setState(() {
            listFiles = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List of Files",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: listFiles.length,
        itemBuilder: (context, index) {
          String dt = '';
          String path = listFiles[index].path;
          String file_name = path.substring(path.lastIndexOf("/") + 1);
          FileUtils.readFromFile(file_name).then(
            (contents) {
              // setState(() {
              dt = contents;
              // });
            },
          );
          return Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      FileUtils.readFromFile(file_name).then((value) {
                        return showDialog(
                            context: context,
                             builder: (context) {
                              return AlertDialog(
                                elevation: 20,
                                title: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    file_name,
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Text(
                                        value,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 230,
                          child: Text(
                            file_name,
                            style: TextStyle(overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        onPressed: () {
                          FileUtils.readFromFile(file_name).then((value) {
                            tname.text = file_name;
                            tdoc.text = value;
                            // docstatus = true;
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    elevation: 20,
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 25, left: 10, right: 10),
                                            child: commonTextField(
                                              enabled: false,
                                              controller: tname,
                                              onchange: (value) {
                                                setState(() {
                                                  namestatus = false;
                                                });
                                              },
                                              color: Colors.black54,
                                              labelText: 'File Name',
                                              errorText: namestatus
                                                  ? 'File Name Is required'
                                                  : null,
                                              prefixIcon: Icons.person,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 25, left: 10, right: 10),
                                            child: commonTextField(
                                              controller: tdoc,
                                              maxLines: 5,
                                              onchange: (value) {
                                                setState(() {
                                                  docstatus = false;
                                                });
                                              },
                                              color: Colors.black54,
                                              labelText: 'Message',
                                              // errorText: docstatus
                                              //     ? 'Message Is required'
                                              //     : null,
                                              prefixIcon: Icons.message,
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              // setState(() {
                                              // if (tname.text.isEmpty) {
                                              //   namestatus = true;
                                              // }
                                              if (tdoc.text.isEmpty) {
                                                print("Docu");
                                                Fluttertoast.showToast(
                                                    msg: "Message Is required",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Colors.black54,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);

                                                docstatus = true;
                                              } else {
                                                FileUtils.saveToFile(
                                                        "${tname.text}",
                                                        tdoc.text)
                                                    .then(
                                                  (value) => {
                                                    FileUtils.getFiles().then(
                                                      (value) => {
                                                        setState(
                                                          () {
                                                            listFiles = value;
                                                          },
                                                        )
                                                      },
                                                    )
                                                  },
                                                );
                                                Navigator.pop(context);
                                              }
                                              // });
                                            },
                                            child: Text("Save File"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          });
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () async {
                          final file = await FileUtils.getFile(file_name);
                          await file.delete();
                          FileUtils.getFiles().then(
                            (value) => {
                              setState(
                                () {
                                  listFiles = value;
                                },
                              )
                            },
                          );
                          // Navigator.pop(context);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FileUtils {
  static String folderName = "MyFiles";

  static Future<String> get getFilePath async {
    final directory = await getExternalStorageDirectory();
    final Directory _appDocDirFolder =
        Directory('${directory!.path}/${folderName}/');
    // print("Path ======== ${_appDocDirFolder.path}");

    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
      return _appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder =
          await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }

  static Future<List> getFiles() async {
    final directory = await getExternalStorageDirectory();
    final Directory _appDocDirFolder =
        Directory('${directory!.path}/${folderName}/');
    print("getfiles ==== ${_appDocDirFolder}");

    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
      return _appDocDirFolder.listSync();
    }
    return List.empty(growable: true);
  }

  static Future<File> getFile(String name) async {
    final path = await getFilePath;

    return File('$path/$name');
  }

  static Future<File> saveToFile(String name, data) async {
    print(name);
    final file = await getFile(name);
    print("File ==== ${file}");
    return file.writeAsString(data);
  }

// static Future<File> renameToFile(String name, data) async {
//     print(name);
//     final file = await getFile(name);
//     print("File ==== ${file}");
//     return file.rename(data);
//   }

  // static Future<File> deletefile() async {
  //   final file = await getFiles();
  //
  //
  //
  //   return file.delete();
  // }

  static Future<String> readFromFile(name) async {
    try {
      final file = await getFile(name);
      String fileContents = await file.readAsString();
      return fileContents;
    } catch (e) {
      return "";
    }
  }

  static Future<String> createFolderInAppDocDir(String folderName) async {
    //Get this App Document Directory
    final Directory? _appDocDir = await getExternalStorageDirectory();
    //App Document Directory + folder name
    final Directory _appDocDirFolder =
        Directory('${_appDocDir!.path}/$folderName/');

    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
      return _appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder =
          await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }
}
