import 'package:tdd_intro/vehicle_state.dart';
import 'package:tdd_intro/vehicle_state_gateway.dart';

class VehicleStateGatewayFake implements VehicleStateGateway {
  Future<bool> isVehicleLocked(String vehicleId) {
    if (vehicleId == "failing vehicle") {
      return Future.error(Object());
    }
    if (vehicleId == "delayed unlocked vehicle") {
      return Future.delayed(
        Duration(seconds: 1),
        () => false,
      );
    }
    if (vehicleId == "unlocked vehicle") {
      return Future.value(false);
    }
    return Future.value(true);
  }

  Future<bool> areWindowsClosed(String vehicleId) {
    if (vehicleId == "failing vehicle") {
      return Future.error(Object());
    }
    if (vehicleId.contains("window open")) {
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Future<VehicleState> getVehicleState(String vehicleId) async {
    return Future.value(VehicleState(
      isLocked: await isVehicleLocked(vehicleId),
      areWindowsClosed: await areWindowsClosed(vehicleId),
    ));
  }
}
