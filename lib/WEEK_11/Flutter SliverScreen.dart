import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class SliverScreen extends StatefulWidget {
  const SliverScreen({Key? key}) : super(key: key);

  @override
  State<SliverScreen> createState() => _SliverScreenState();
}

class _SliverScreenState extends State<SliverScreen> {
  double top = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.orangeAccent,
              automaticallyImplyLeading: false,
              expandedHeight: 250,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  top = constraints.biggest.height;
                  return Center(
                    child: FlexibleSpaceBar(
                      centerTitle: true,
                      titlePadding: EdgeInsets.only(top: 0, bottom: 7),
                      title: AnimatedOpacity(
                        opacity: top <= 80 ? 1 : 0,
                        duration: Duration(milliseconds: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                  // height: 20,
                                ),
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage("Images/burger.jpg"),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text("Guest"),
                              ],
                            ),
                            Icon(
                              Icons.more_vert_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      background: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("Images/burger.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              "Guest",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.message,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        "chet",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.call,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        "call",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.video_call,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        "video call",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                  '''An important part of studying English is to read. This helps with your vocabulary, grammar, and pronunciation (if you read out loud to yourself). You can even write about what you read!

But many students choose texts that are very long. This means they will be less effective.


 
First, you should choose a text that you think is interesting. Maybe you like reading about history, or maybe you find the news more interesting. Lots of students like to read fiction, like stories or novels.

You must also choose a text that is right for your English level. If the reading is too difficult, you will be frustrated and you will not enjoy your reading practice.

Finally, you should choose a text that is short. The best reading material is short enough for you to read it all at once. This is why short stories are such a great option!

Whether you read the text in class with your teacher or on your own, it is best if you can read it from start to finish without stopping for a break.

This is important because:
You understand what is happening in the text without getting lost
You do not feel bored by something that is too long
You do not forget what the text is about when you start to read it after a break
You feel good after finishing a whole text
You can complete some exercises about the text while the information is still fresh in your mind
So look for texts that you can comfortably read in 10-30 minutes. If you have a higher level and want to read books, try to find something with shorter chapters so that you can read each chapter in one sitting.

Remember to write down the new vocabulary words and grammar structures you find in your texts. You will really improve your English if you read texts that are right for you! An important part of studying English is to read. This helps with your vocabulary, grammar, and pronunciation (if you read out loud to yourself). You can even write about what you read!

But many students choose texts that are very long. This means they will be less effective.


 
First, you should choose a text that you think is interesting. Maybe you like reading about history, or maybe you find the news more interesting. Lots of students like to read fiction, like stories or novels.

You must also choose a text that is right for your English level. If the reading is too difficult, you will be frustrated and you will not enjoy your reading practice.

Finally, you should choose a text that is short. The best reading material is short enough for you to read it all at once. This is why short stories are such a great option!

Whether you read the text in class with your teacher or on your own, it is best if you can read it from start to finish without stopping for a break.

This is important because:
You understand what is happening in the text without getting lost
You do not feel bored by something that is too long
You do not forget what the text is about when you start to read it after a break
You feel good after finishing a whole text
You can complete some exercises about the text while the information is still fresh in your mind
So look for texts that you can comfortably read in 10-30 minutes. If you have a higher level and want to read books, try to find something with shorter chapters so that you can read each chapter in one sitting.

Remember to write down the new vocabulary words and grammar structures you find in your texts. You will really improve your English if you read texts that are right for you!'''),
            ),
          ],
        ),
      ),
    );
  }
}
