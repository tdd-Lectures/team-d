import 'package:flutter/material.dart';
import 'package:tdd_intro/loading_widget.dart';
import 'package:tdd_intro/vehicle_state.dart';
import 'package:tdd_intro/vehicle_state_gateway.dart';

class VehicleStateWidget extends StatelessWidget {
  final VehicleStateGateway _gateway;
  final String vehicleId;

  VehicleStateWidget(this._gateway, this.vehicleId, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<VehicleState>(
      initialData: VehicleState(isLocked: true, areWindowsClosed: true, areDoorsClosed: true),
      future: _gateway.getVehicleState(vehicleId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Unable to get data, please try again later...');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
              Text(snapshot.data.areWindowsClosed ? 'windows are closed' : 'windows are open'),
              Text(snapshot.data.isLocked ? 'OK' : 'UNLOCKED'),
              Text(snapshot.data.areDoorsClosed ? 'doors are closed' : 'doors are open'),
              Text('not authorized'),
            ],
          );
        }
        return LoadingScreen();
      },
    );
  }
}
