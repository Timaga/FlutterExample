import 'package:flutter/material.dart';

class Images1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Images1();
  }
}

class _Images1 extends State<Images1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My New Page'),
        ),
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image(
                image: AssetImage('assests/Images/bg.jpg'),
              ),
              Image.asset('assests/Images/Phoenix.png'),
              Positioned(
                top: 16,
                left: 50,
                child: Text(
                  'My custom font',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.lime,
                    fontFamily: 'IndieFlower',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
