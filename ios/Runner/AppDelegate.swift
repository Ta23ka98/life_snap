import UIKit
import Flutter
import GoogleMaps
import apikey.h

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey(maps_api_key)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}