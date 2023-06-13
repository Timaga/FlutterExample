import 'dart:async';
import 'package:tester/ImageTest.dart';
import 'package:flutter/material.dart';
import 'package:tester/TestBloc_lib.dart';
import 'package:tester/counter.dart';
import 'package:tester/tests.dart';
import 'color_block_lib.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ColorBlocc colorBloc = ColorBlocc(Colors.red);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/ImageTest': (context) => Images1(),
        '/counter': (context) => Counter(),
        '/tests': (context) => MyHome(),
        '/TestBloc_lib': (context) => BlocProvider<ColorBlocc>(
          create: (context) => colorBloc,
          child: TestBloc(),
        ),
      },
      title: 'My App',
      home: MyFirst(),
      );
  }
}


class MyFirst extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFirst();
  }
}

class _MyFirst extends State<MyFirst> {
  late bool _loading;
  late double _progressValue;

  @override
  void initState() {
    super.initState();
    _loading = false;
    _progressValue = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application ХЫ!"),
        centerTitle: true,
        backgroundColor: Colors.lime,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(60),
          child: _loading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LinearProgressIndicator(value: _progressValue),
                    Text(
                      '${(_progressValue * 100).round()}%',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.w800,
                          fontSize: 30.0),
                    ),
                  ],
                )
              : Text(
                  'Идет загрузка подождите...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.w800,
                      fontSize: 20.0),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _loading = !_loading;
            _UpdatePorgressBar();
          });
        },
        child: Icon(Icons.cloud_download),
      ),
      bottomNavigationBar: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
         ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/TestBloc_lib');
          },
          child: Text('/TestBloc_lib'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/counter');
          },
          child: Text('/counter'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/tests');
          },
          child: Text('/tests'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/ImageTest');
          },
          child: Text('/ImageTest'),
        ),],
      ),
    );
  }

  void _UpdatePorgressBar() {
    const OneSec = const Duration(seconds: 1);
    Timer.periodic(OneSec, (Timer t) {
      setState(() {
        _progressValue += 0.2;

        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          _progressValue = 0.0;
          return;
        }
      });
    });
  }
}
