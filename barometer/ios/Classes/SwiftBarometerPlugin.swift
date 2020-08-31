import Flutter
import UIKit
import CoreMotion

public class SwiftBarometerPlugin: NSObject, FlutterPlugin {
  var altimeter: CMAltimeter?
  var _pressure: NSNumber = NSNumber(value: 0.0)
  
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "barometer", binaryMessenger: registrar.messenger())
    let instance = SwiftBarometerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "getPlatformVersion" {
      result("iOS " + UIDevice.current.systemVersion)
      return
    }

    if call.method == "initializeBarometer" {
      altimeter = CMAltimeter()
      altimeter?.startRelativeAltitudeUpdates(to: OperationQueue.main, withHandler: { (data, error) in
        if let pressure = data?.pressure {
          self._pressure = pressure
        }
      })
      result(NSNumber(value: true))
      return
    }

    if call.method == "getBarometer" {
      result(_pressure)
      return
    }
    
    result(FlutterMethodNotImplemented)

  }
}
