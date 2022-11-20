import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/count_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (BuildContext context) => CountBloc(),
          child: MyHomePage(title: 'Flutter BLoc')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CountBloc, CountState>(builder: (context, state) {
        _counter = state.num;
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              state.status == CountStatus.init
                  ? Text(
                      'BLoc 초기화',
                      style: Theme.of(context).textTheme.headline4,
                    )
                  : Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
            ],
          ),
        );
      }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () =>
                context.read<CountBloc>().add(CountPlusEvent(num: _counter)),
            tooltip: 'Increment',
            child: const Icon(Icons.plus_one),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () =>
                context.read<CountBloc>().add(CountMinusEvent(num: _counter)),
            tooltip: 'decrement',
            child: const Icon(Icons.exposure_minus_1),
          )
        ],
      )
    );
  }
}
