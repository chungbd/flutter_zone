import 'dart:async';

import 'package:flutter/services.dart';

class Barometer {
  static const MethodChannel _channel =
      const MethodChannel('barometer');

  static const EventChannel _eventChannel = const EventChannel("pressureStream");
  
  static Stream<double> _pressureStream;

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<double> get reading async {
    final double version = await _channel.invokeMethod('getBarometer');
    return version;
  }

  static Stream<double> get pressureStream {
    _pressureStream ??= _eventChannel.receiveBroadcastStream().map<double>((value) => value);

    return _pressureStream;
  }

  static Future<bool>  get initializeBarometer async {
    final bool initializeBarometer = await _channel.invokeMethod('initializeBarometer');
    return initializeBarometer;
  }
}
