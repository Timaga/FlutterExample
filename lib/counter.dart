import 'package:flutter/material.dart';

//class Digits extends StatefulWidget {}

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Counter();
  }
}

class _Counter extends State<Counter> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  void _CounterInc() {
    setState(() {
      count++;
    });
  }

  void _CounterDic() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("СЧЁТЧИК"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _CounterInc,
                child: Text('Инкремент'),
              ),
              Text(
                '$count',
                style: TextStyle(fontSize: 40),
              ),
              ElevatedButton(
                onPressed: _CounterDic,
                child: Text('Декремент'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
