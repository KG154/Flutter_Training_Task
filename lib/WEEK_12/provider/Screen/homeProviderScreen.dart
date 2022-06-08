import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskproject/WEEK_12/provider/Movies_Provider.dart';
import 'package:taskproject/WEEK_12/provider/Screen/My_list_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyListScreen(),
                  ),
                );
              },
              icon: Icon(Icons.favorite),
              label: Text(
                "Go to Cart page",
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                  // primary: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 10)),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (_, index) {
                    final currentMovie = movies[index];
                    return Card(
                      key: ValueKey(currentMovie.title),
                      // color: Colors.amberAccent.shade100,
                      elevation: 4,
                      child: ListTile(
                        title: Text(currentMovie.title),
                        // subtitle:
                        //     Text(currentMovie.runtime ?? 'No information'),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: myList.contains(currentMovie)
                                ? Colors.red
                                : Colors.black87,
                            size: 30,
                          ),
                          onPressed: () {
                            if (!myList.contains(currentMovie)) {
                              context
                                  .read<MovieProvider>()
                                  .addToList(currentMovie);
                            } else {
                              context
                                  .read<MovieProvider>()
                                  .removeFromList(currentMovie);
                            }
                          },
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
