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

  bool switchChange() {
    if (_switchState) {
      _color = Colors.orange;
      _switchState = false;
      notifyListeners();
      return false;
    } else {
      _color = Colors.green;
      _switchState = true;
      notifyListeners();
      return true;
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
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              height: 200.0,
              width: 200.0,
              color: Colors.grey[300],
            ),
            Switch(
                value: _state._switchState,
                onChanged: (_) => _state.switchChange()
            )
          ],
        ),
      ),
    );
  }
}


