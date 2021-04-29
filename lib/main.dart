import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated with provider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Animated with provider'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyColorProvider>.value(value: MyColorProvider(),),
      ],
      child: MyColorPage(),
    );
  }
}

class MyColorProvider extends ChangeNotifier {
  Color _color = Colors.red;
  bool _switchState = false;

  Color get colorValue => _color;
  bool get switchState => _switchState;
  double get switchHeight => random.nextInt(300).toDouble();
  double get switchWidth => random.nextInt(300).toDouble();
  double get switchCircular => random.nextInt(100).toDouble();
  final random = Random();

  void switchColor() {
    _color = Colors.green;
    notifyListeners();
  }

  void switchChange() {
    if (_switchState) {
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      _switchState = false;
      notifyListeners();
    } else {
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      _switchState = true;
      notifyListeners();
    }
  }
}

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


