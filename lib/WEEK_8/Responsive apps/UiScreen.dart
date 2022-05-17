import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class ResponsiveScreen extends StatefulWidget {
  const ResponsiveScreen({Key? key}) : super(key: key);

  @override
  State<ResponsiveScreen> createState() => _ResponsiveScreenState();
}

class _ResponsiveScreenState extends State<ResponsiveScreen> {
  bool potrait = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
          "Responsive UI",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (potrait) {
            SystemChrome.setPreferredOrientations(
                [DeviceOrientation.landscapeLeft]);
            potrait = false;
            updateui();
          } else {
            SystemChrome.setPreferredOrientations(
                [DeviceOrientation.portraitUp]);
            potrait = true;
            updateui();
          }
          updateui();
        },
        child: Icon(Icons.rotate_left),
      ),
      body: potrait
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  images(),
                  SizedBox(
                    height: 10,
                  ),
                  text(),

                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  images(),
                  SizedBox(
                    width: 10,
                  ),
                  text(),
                ],
              ),
            ),
    );
  }

  void updateui() {
    setState(() {});
  }

  Widget images() {
    return Expanded(
      child: Image.asset(
        "Images/Elephant.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget text() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              '''What is Lorem Ipsum?
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
Where does it come from?
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.''',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
