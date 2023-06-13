import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorEvents{event_red,event_lime}

class ColorBlocc extends Bloc<ColorEvents,Color>{
  Color _color = Colors.red;

  ColorBlocc(Color initialState) : super(initialState);

  @override
  Color get initialState => Colors.red;
  @override
  Stream<Color> mapEventTostate(ColorEvents event) async*{
    if(event==ColorEvents.event_lime){
      _color=Colors.amber;
      yield _color;
    }
    else if(event == ColorEvents.event_red){
      _color=Colors.lightGreen;
      yield _color;
    }
  }

}