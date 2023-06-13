import 'package:flutter/material.dart';
import 'package:tester/color_block.dart';

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  ColorBloc _block = ColorBloc();
  @override
  void dispose() {
    _block.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Block'),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder(
          stream: _block.outputStatestream,
          initialData: Colors.red,
          builder: (context, snapshot) {
            return AnimatedContainer(
              height: 100,
              width: 100,
              color: snapshot.data,
              duration: Duration(milliseconds: 500),
            );
          },
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        FloatingActionButton(
          heroTag: 1,
          backgroundColor: Colors.lime,
          onPressed: () {
            _block.inputEventSink.add(ColorEvent.event_lime);
          },
        ),
        SizedBox(width: 10),
        FloatingActionButton(
          heroTag: 2,
          backgroundColor: Color.fromARGB(255, 10, 2, 78),
          onPressed: () {
            _block.inputEventSink.add(ColorEvent.event_blue);
          },
        )
      ]),
    );
  }
}
