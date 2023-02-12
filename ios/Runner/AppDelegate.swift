// Unlike Android, you need to modify this file for add API Key
import UIKit
import Flutter
import GoogleMaps // FEB11: Add this import googlemap header

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // FEB11: Add for Google Maps API
    GMSServices.provideAPIKey("AIzaSyC74wQBHNfrFVNowieNqxnWYZTe2J0Op5Q")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
