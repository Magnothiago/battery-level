import 'package:flutter/services.dart';

class Repository {
  static const platform = MethodChannel('samples.flutter.dev/battery');

  Future<String> getBatteryLevel() async {
    String batteryLevel = 'Bateria não encontrada.';
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Nível da bateria: $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Falha: '${e.message}'.";
    }
    batteryLevel = batteryLevel;
    return batteryLevel;
  }
}
