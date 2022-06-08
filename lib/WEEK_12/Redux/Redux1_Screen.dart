import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

enum Actions { Add, Subtract }

int counterReducer(int state, action) {
  if (action == Actions.Add) {
    return state + 1;
  }
  if (action == Actions.Subtract) {
    return state - 1;
  }
  return state;
}

class Redux1_Screen extends StatelessWidget {
  const Redux1_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Store<int>(counterReducer, initialState: 0);

    return StoreProvider<int>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Reducer"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StoreConnector<int, String>(
                  converter: (store) => store.state.toString(),
                  builder: (context, count) {
                    return Text(
                      'Answer :: $count',
                      style: TextStyle(fontSize: 20),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StoreConnector<int, VoidCallback>(converter: (store) {
                      return () => store.dispatch(Actions.Add);
                    }, builder: (context, callback) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black45,
                        ),
                        onPressed: callback,
                        child: Text("+"),
                      );
                    }),
                    SizedBox(
                      width: 20,
                    ),
                    StoreConnector<int, VoidCallback>(converter: (store) {
                      return () => store.dispatch(Actions.Subtract);
                    }, builder: (context, callback) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black45,
                        ),
                        onPressed: callback,
                        child: Text("-"),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
