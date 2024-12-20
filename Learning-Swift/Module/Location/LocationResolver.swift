//
//  LocationResolver.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/1.
//

//Always verify that location services are available before you attempt to use them. Services might be unavailable for many different reasons, including:
//The device is in Airplane mode.
//The device doesn’t have the required hardware.
//The device doesn’t support a specific service.
//Your app doesn’t have authorization to use the service.
import CoreLocation
import Foundation
import UIKit

class LocationResolver: NSObject, LocationResolving {
    
    @Published var currentLocation: CLLocation?
    let location = CLLocationManager()
    let commonResolver = CommonResolver()
//    let stream = CLLocationUpdate.liveUpdates()
    
    override init() {
        super.init()
        location.delegate = self
    }
    
    func requestAuthorization() {
//        location.delegate = self
        switch location.authorizationStatus {
        case .notDetermined:
            location.requestWhenInUseAuthorization()
            location.requestAlwaysAuthorization()
        case .restricted, .denied:
            if let currentVC = commonResolver.getCurrentVC() {
                // style  UIAlertController.Style actionsheet
                let alert = UIAlertController(title: "定位权限未开启", message: "如果需要使用此功能需要你在系统设置里开启， 是否前往系统定位权限设置？", preferredStyle: .alert)
//                alert.addTextField { res in
//
//                }
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    self.openSettings()
                }))
                alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Default action"), style: .cancel, handler: { _ in
                }))
                currentVC.present(alert, animated: true)
            }
        case .authorizedWhenInUse, .authorizedAlways:
            startUpdatingLocation()
        default:
            break
        }
    }
    
    
    func openSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

extension LocationResolver: CLLocationManagerDelegate {
    
    func isMonitoringAvailable() -> Bool {
        CLLocationManager.significantLocationChangeMonitoringAvailable()
    }
    
    func headingAvailable() -> Bool {
        CLLocationManager.headingAvailable()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {

    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        location.stopMonitoringVisits()
    }
    
    func startUpdatingLocation() {
        if location.authorizationStatus == .authorizedAlways || location.authorizationStatus == .authorizedWhenInUse {
            location.startUpdatingLocation()
        }
    }
    
    func stopUpdatingLocation() {
        location.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            currentLocation = lastLocation
            stopUpdatingLocation()
        }
    }

    // Iterate over the stream and handle incoming updates.
//    for try await update in stream {
//         if update.location != nil {
//              // Process the location.
//         } else if update.authorizationDenied {
//              // Process the authorization denied state change.
//         } else {
//              // Process other state changes.
//         }
//    }
}
