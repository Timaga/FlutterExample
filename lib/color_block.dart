import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent{event_blue,event_lime}

class ColorBloc{
  Color _color =Colors.red;
  
  final _inputEventController = StreamController<ColorEvent>();
  StreamSink<ColorEvent> get inputEventSink => _inputEventController.sink;
  final _outputStateController = StreamController<Color>();
  Stream<Color> get outputStatestream => _outputStateController.stream;

  void _mapEventTostate(ColorEvent event){
    if(event== ColorEvent.event_blue){
      _color = Color.fromARGB(255, 10, 2, 78);
    }
    else if(event == ColorEvent.event_lime){
      _color = Colors.lime;
    }
    else
     throw Exception('Wrong Event Type');

    _outputStateController.sink.add(_color);
    
   
  }
   ColorBloc(){
      _inputEventController.stream.listen(_mapEventTostate);
    }
  void dispose(){
      _inputEventController.close();
      _outputStateController.close();
    }
} 