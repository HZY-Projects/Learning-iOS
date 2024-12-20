//
//  MapViewModel.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/2.
//

import CoreLocation
import MapKit

class MapViewModel {
    
    typealias completation = (MKCoordinateRegion?) -> Void
    typealias mapItems = ([MKMapItem]?) -> Void
    
    func getCurrentLocation(location: CLLocation?, region: @escaping completation) {
        guard let location else {
            return
        }
        let geo = CLGeocoder()
        //        await geo.reverseGeocodeLocation(location)
//        geo.geocodeAddressString("巴音郭") { response, error in
//            debugPrint(response)
//        }
        geo.reverseGeocodeLocation(location) { placeMarks, error in
            guard let placeMarks else {
                return
            }
            if let coordinate = placeMarks.first?.location?.coordinate {
                region(MKCoordinateRegion(center: coordinate, latitudinalMeters: 300, longitudinalMeters: 300))
            }
        }
        
//        geo.cancelGeocode()
       
    }
    
    func getLocationSearch(searchText: String?, mapItems: @escaping mapItems) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if error != nil {
                return
            }
            mapItems(response?.mapItems)
        }
    }
}

