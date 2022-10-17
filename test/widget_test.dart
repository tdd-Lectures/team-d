import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_intro/loading_widget.dart';
import 'package:tdd_intro/vehicle_state_gateway.dart';
import '../lib/vehicle_state_gateway_fake.dart';
import 'package:tdd_intro/vehicle_state_widget.dart';

void main() {
  testWidgets('a locked vehicle display OK', (WidgetTester tester) async {
    await pumpVehicleState(tester, VehicleStateGatewayFake(), vehicleId: "locked vehicle");

    expect(find.text('OK'), findsOneWidget);
  });
  testWidgets('a locked vehicle doesnt display UNLOCKED', (WidgetTester tester) async {
    await pumpVehicleState(tester, VehicleStateGatewayFake(), vehicleId: "locked vehicle");

    expect(find.text('UNLOCKED'), findsNothing);
  });
  testWidgets('an unlocked vehicle display UNLOCKED', (WidgetTester tester) async {
    await pumpVehicleState(tester, VehicleStateGatewayFake(), vehicleId: "unlocked vehicle");

    expect(find.text('UNLOCKED'), findsOneWidget);
  });
  testWidgets('an unlocked vehicle doesnt display OK', (WidgetTester tester) async {
    await pumpVehicleState(tester, VehicleStateGatewayFake(), vehicleId: "unlocked vehicle");

    expect(find.text('OK'), findsNothing);
  });
  testWidgets('when collecting the vehicle state takes some time displays a Loading screen',
      (WidgetTester tester) async {
    await pumpVehicleState(tester, VehicleStateGatewayFake(), vehicleId: "delayed unlocked vehicle");

    expect(find.byType(LoadingScreen), findsOneWidget);
    await tester.pump(Duration(seconds: 1));
  });
  testWidgets('when collecting the vehicle state fails displays error message', (WidgetTester tester) async {
    await pumpVehicleState(tester, VehicleStateGatewayFake(), vehicleId: "failing vehicle");

    expect(
      find.text('Unable to get data, please try again later...'),
      findsOneWidget,
    );
  });

  testWidgets('an open window displays windows are open', (WidgetTester tester) async {
    await pumpVehicleState(tester, VehicleStateGatewayFake(), vehicleId: "window open");

    expect(find.text('windows are open'), findsOneWidget);
    expect(find.text('windows are closed'), findsNothing);
  });

  testWidgets('all closed window displays windows are closed', (WidgetTester tester) async {
    await pumpVehicleState(tester, VehicleStateGatewayFake(), vehicleId: "locked vehicle");

    expect(find.text('windows are closed'), findsOneWidget);
  });

  testWidgets('an open window on a locked vehicle displays windows are open', (WidgetTester tester) async {
    await pumpVehicleState(tester, VehicleStateGatewayFake(), vehicleId: "locked vehicle with window open");

    expect(find.text('windows are open'), findsOneWidget);
  });

  testWidgets('an open door displays doors are open', (WidgetTester tester) async {
    await pumpVehicleState(tester, VehicleStateGatewayFake(), vehicleId: "doors open");

    expect(find.text('doors are open'), findsOneWidget);
    expect(find.text('doors are closed'), findsNothing);
  });

  testWidgets('all closed doors displays doors are closed', (WidgetTester tester) async {
    await pumpVehicleState(tester, VehicleStateGatewayFake(), vehicleId: "doors closed");

    expect(find.text('doors are closed'), findsOneWidget);
    expect(find.text('doors are open'), findsNothing);
  });

  testWidgets('car not owned by user displays not authorized ', (WidgetTester tester) async  {
    await pumpVehicleState(tester, VehicleStateGatewayFake(), vehicleId: "doors closed");

    expect(find.text('not authorized'), findsOneWidget);

  });
}

Future<void> pumpVehicleState(
  WidgetTester tester,
  VehicleStateGateway gateway, {
  String vehicleId = "",
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: VehicleStateWidget(gateway, vehicleId),
    ),
  );
  await tester.pumpAndSettle();
}
