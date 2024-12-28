//
//  LocationResolving.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/1.
//

import CoreLocation

protocol LocationResolving {
    
    var currentLocation: CLLocation? { set get }
    
    func requestAuthorization()
    func openSettings()
    func startUpdatingLocation()
    func stopUpdatingLocation()
}
