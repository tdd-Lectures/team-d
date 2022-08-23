import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_intro/main.dart';


void main() {
  testWidgets('a locked vehicle display OK', (WidgetTester tester) async {
    await pumpVehicleState(tester, VehicleStateGatewayFake(),
        vehicleId: "locked vehicle");

    expect(find.text('OK'), findsOneWidget);
  });
  testWidgets('a locked vehicle doesnt display UNLOCKED',
      (WidgetTester tester) async {
    await pumpVehicleState(tester, VehicleStateGatewayFake(),
        vehicleId: "locked vehicle");

    expect(find.text('UNLOCKED'), findsNothing);
  });
  testWidgets('an unlocked vehicle display UNLOCKED',
      (WidgetTester tester) async {
    await pumpVehicleState(tester, VehicleStateGatewayFake(),
        vehicleId: "unlocked vehicle");

    expect(find.text('UNLOCKED'), findsOneWidget);
  });
  testWidgets('an unlocked vehicle doesnt display OK',
      (WidgetTester tester) async {
    await pumpVehicleState(tester, VehicleStateGatewayFake(),
        vehicleId: "unlocked vehicle");

    expect(find.text('OK'), findsNothing);
  });
  testWidgets(
      'when collecting the vehicle state takes some time displays a Loading screen',
      (WidgetTester tester) async {
    await pumpVehicleState(tester, VehicleStateGatewayFake(),
        vehicleId: "delayed unlocked vehicle");

    expect(find.byType(LoadingScreen), findsOneWidget);
    await tester.pumpAndSettle(Duration(seconds: 1));
  });
  testWidgets('when collecting the vehicle state fails displays error message',
      (WidgetTester tester) async {
    await pumpVehicleState(tester, VehicleStateGatewayFake(),
        vehicleId: "failing vehicle");

    expect(
      find.text('Unable to get data, please try again later...'),
      findsOneWidget,
    );
  });
}

Future<void> pumpVehicleState(
  WidgetTester tester,
  VehicleStateGateway gateway, {
  String vehicleId = "",
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: VehicleState(gateway, vehicleId),
    ),
  );
  await tester.pumpAndSettle();
}
