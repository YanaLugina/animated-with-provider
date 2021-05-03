import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_color_provider.dart';
import 'dart:math';

class MyColorPage extends StatelessWidget {
  final random = Random();

  @override
  Widget build (BuildContext context) {
    MyColorProvider _state = Provider.of<MyColorProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Animated home',
          style: TextStyle(
            color: _state.colorValue,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            AnimatedContainer(
              height: _state.switchHeight,
              width: _state.switchWidth,
              padding: EdgeInsets.all(10.0),
              alignment: _state.switchState
                  ? Alignment.center
                  : AlignmentDirectional.bottomEnd,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              decoration: BoxDecoration(
                color: _state.colorValue,
                borderRadius: BorderRadius.circular(_state.switchCircular),
              ),
            ),
            Switch(
                value: _state.switchState,
                activeColor: _state.colorValue,
                onChanged: (_) => _state.switchChange()
            )
          ],
        ),
      ),
    );
  }
}