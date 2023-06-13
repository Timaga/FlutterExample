import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tester/color_block_lib.dart';

// Определяем события, которые блок может обрабатывать


class TestBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBlocc _bloc = BlocProvider.of<ColorBlocc>(context);

    // Регистрируем обработчик событий
    _bloc.on<ColorEvents>((event, emit) {
      if (event == ColorEvents.event_red) {
        emit(Colors.red);
      } else if (event == ColorEvents.event_lime) {
        emit(Colors.lime);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc'),
      ),
      body: Center(
        child: BlocBuilder<ColorBlocc, Color>(
          builder: (context, curColor) => AnimatedContainer(
            height: 100,
            width: 100,
            color: curColor,
            duration: Duration(milliseconds: 500),
          ),
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        FloatingActionButton(
          heroTag: 3,
          onPressed: () {
            _bloc.add(ColorEvents.event_red);
          },
          backgroundColor: Colors.amber,
        ),
        SizedBox(
          width: 20,
        ),
        FloatingActionButton(
          heroTag: 4,
          onPressed: () {
            _bloc.add(ColorEvents.event_lime);
          },
          backgroundColor: Colors.lightGreen,
        )
      ]),
    );
  }
}
