import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loadmore/loadmore.dart';

import 'users.dart';

// table view with image save- lazy loading
class lazy_loading extends StatefulWidget {
  const lazy_loading({Key? key}) : super(key: key);

  @override
  State<lazy_loading> createState() => _lazy_loadingState();
}

class _lazy_loadingState extends State<lazy_loading> {
  int count = 1;
  bool isLoading = false;

  List<Users> list = [];

  // List<String> categories = [];

  void initState() {
    super.initState();
    // getCategories();
    load();
  }

  load() async {
    print("load");
    var url = Uri.parse(
        'https://jsonplaceholder.typicode.com/comments?_limit=8&_page=$count');
    var response = await http.get(
      url,
    );
    print('Response body: ${response.body}');
    var jsonResponse = json.decode(response.body);
    for (var i = 0; i < jsonResponse.length; i++) {
      list.add(Users.fromJson(jsonResponse[i]));
    }
    count = count + 1;
    print("list $list");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lazy_loading'),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: list.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: LoadMore(
                textBuilder: DefaultLoadMoreTextBuilder.english,
                isFinish: list.length >= 1500,
                onLoadMore: _loadMore,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Material(
                      elevation: 5,
                      child: ListTile(
                        title: Text(list[index].name.toString()),
                        subtitle: Text(list[index].email.toString()),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }

  Future<bool> _loadMore() async {
    print("onLoadMore");
    await load();
    return true;
  }
}

/**/

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
//
// class MyHomePage extends StatefulWidget {
//
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   List<int> data = [];
//   int currentLength = 0;
//
//   final int increment = 12;
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     _loadMore();
//     super.initState();
//   }
//
//   Future _loadMore() async {
//     setState(() {
//       isLoading = true;
//     });
//
//     // Add in an artificial delay
//     await Future.delayed(const Duration(milliseconds: 500));
//     data.addAll(List.generate(increment, (index) => data.length + index));
//     await Future.delayed(
//       const Duration(milliseconds: 500),
//
//     );
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Lazy Loading"),
//         backgroundColor: Colors.green,
//       ),
//       body: LazyLoadScrollView(
//         isLoading: isLoading,
//         onEndOfPage: () => _loadMore(),
//         child: ListView.builder(
//           itemCount: data.length + 1,
//           itemBuilder: (context, position) {
//             if (position == data.length) {
//               return _buildProgressIndicator();
//             } else {
//               return DemoItem(position);
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget DemoItem(int position) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Container(
//                 //   width: 50,
//                 //   height: 50,
//                 //   decoration: BoxDecoration(
//                 //     image: DecorationImage(image: NetworkImage("https://strgblobimagedemo.blob.core.windows.net/imagecontainer/che.jpg"),
//                 //     fit: BoxFit.cover),
//                 //     shape: BoxShape.circle
//                 //   ),
//                 // ),
//                 Text("Item $position"),
//               ],
//             ),
//             Text("in mind to provide well written, well"),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildProgressIndicator() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Center(
//         child: Opacity(
//           opacity: isLoading ? 1.0 : 00,
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
// }
