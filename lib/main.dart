import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  void switchColor() {
    _color = Colors.green;
    notifyListeners();
  }

  void switchChange() {
    if (_switchState) {
      _color = Colors.orange;
      _switchState = false;
      notifyListeners();
    } else {
      _color = Colors.green;
      _switchState = true;
      notifyListeners();
    }
  }
}

class MyColorPage extends StatelessWidget {
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
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            AnimatedContainer(
              height: _state.switchState ? 100.0 : 200.0,
              width: _state.switchState ? 350.0 : 15.0,
              padding: EdgeInsets.all(10.0),
              alignment: _state.switchState
                  ? Alignment.center
                  : AlignmentDirectional.bottomEnd,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              color: _state.colorValue,
            ),
            Switch(
                value: _state.switchState,
                onChanged: (_) => _state.switchChange()
            )
          ],
        ),
      ),
    );
  }
}


