import 'package:flutter/material.dart';

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

abstract class VehicleStateGateway {
  Future<VehicleState> getVehicleState(String vehicleId);  
  Future<bool> isVehicleUnlocked(String vehicleId);
}

class VehicleState {
  bool isLocked;
  bool areWindowsClosed;
  VehicleState(this.isLocked, this.areWindowsClosed);
}

class VehicleStateGatewayFake implements VehicleStateGateway {
  @override
  Future<bool> isVehicleUnlocked(String vehicleId) {
    if (vehicleId == "failing vehicle") {
      return Future.error(Object());
    }
    if (vehicleId == "delayed unlocked vehicle") {
      return Future.delayed(
        Duration(seconds: 1),
        () => true,
      );
    }
    if (vehicleId == "unlocked vehicle") {
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  Future<VehicleState> getVehicleState(String vehicleId) {
    return Future.value(VehicleState(false, true));
  }
}

class VehicleStateWidget extends StatelessWidget {
  final VehicleStateGateway _gateway;
  final String vehicleId;

  VehicleStateWidget(this._gateway, this.vehicleId, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: false,
      future: _gateway.isVehicleUnlocked(vehicleId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Unable to get data, please try again later...');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
              Text(snapshot.data ? 'windows are open' : 'windows are closed'),
              Text(snapshot.data ? 'UNLOCKED' : 'OK'),
            ],
          );
        }
        return LoadingScreen();
      },
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Loading...');
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
