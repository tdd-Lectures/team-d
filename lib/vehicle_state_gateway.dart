import 'package:tdd_intro/vehicle_state.dart';

abstract class VehicleStateGateway {
  Future<VehicleState> getVehicleState(String vehicleId);
}
