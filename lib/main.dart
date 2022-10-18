import 'package:flutter/material.dart';
import 'package:tdd_intro/vehicle_state_gateway_fake.dart';
import 'package:tdd_intro/vehicle_state_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VehicleStateWidget(VehicleStateGatewayFake(), "locked vehicle"),
    );
  }
}

class VehicleAuthorizationWidget extends StatelessWidget {
  final String userId;

  const VehicleAuthorizationWidget({Key key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return userId == "authorized"
        ? VehicleStateWidget(VehicleStateGatewayFake(), "locked vehicle")
        : Container();
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
