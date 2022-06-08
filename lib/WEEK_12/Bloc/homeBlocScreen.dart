import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskproject/WEEK_12/Bloc/bloc_Controller.dart';

class BlocPage extends StatelessWidget {
  const BlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: HomeBlocScreen(),
      ),
    );
  }
}

class HomeBlocScreen extends StatefulWidget {
  const HomeBlocScreen({Key? key}) : super(key: key);

  @override
  State<HomeBlocScreen> createState() => _HomeBlocScreenState();
}

class _HomeBlocScreenState extends State<HomeBlocScreen> {
  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter With Bloc"),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return Text(
              "$state",
              style: TextStyle(fontSize: 36),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "1",
            child: Icon(Icons.add),
            onPressed: () => context.read<CounterBloc>().increment(),
          ),
          SizedBox(height: 4),
          FloatingActionButton(
            heroTag: "2",
            child: Icon(Icons.remove),
            onPressed: () => context.read<CounterBloc>().decrement(),
          ),
          SizedBox(height: 4),
          FloatingActionButton(
            heroTag: "3",
            child: Icon(Icons.restart_alt),
            onPressed: () => context.read<CounterBloc>().reset(),
          ),
        ],
      ),
    );
  }
}
