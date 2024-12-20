//
//  MapView.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/1.
//

import Combine
import UIKit
import MapKit
import CoreLocationUI

class MapView: UIView, UITextFieldDelegate {
    
    let mapView: MKMapView = .init()
    let locationButton = CLLocationButton()
    let searchTF = UITextField()
    let resolver: LocationResolver
    var cancellables = Set<AnyCancellable>()
    var currentSearchText: String?
    let searchButton: UIButton = .init()
    let viewModel = MapViewModel()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    init(resolver: LocationResolver) {
        self.resolver = resolver
        
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mapView)
        mapView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        mapView.showsUserLocation = true
        
        searchTF.translatesAutoresizingMaskIntoConstraints = false
        searchTF.delegate = self
        searchTF.returnKeyType = .done
        searchTF.placeholder = "search location"
        searchTF.borderStyle = .roundedRect
        searchTF.layer.borderWidth = 1
        searchTF.layer.cornerRadius = 5
        searchTF.clearButtonMode = .whileEditing
        self.addSubview(searchTF)
        
        searchTF.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        searchTF.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        searchTF.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100).isActive = true
        searchTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setTitle("search", for: .normal)
        searchButton.backgroundColor = .link
        searchButton.layer.cornerRadius = 8
        searchButton.addTarget(self, action: #selector(searchLocation), for: .touchUpInside)
        addSubview(searchButton)
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchButton.leadingAnchor.constraint(equalTo: searchTF.trailingAnchor, constant: 10),
            searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        locationButton.icon = .arrowFilled
        locationButton.label = .currentLocation
        locationButton.backgroundColor = .link
        locationButton.tintColor = .white
        locationButton.cornerRadius = 25
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.addTarget(self, action: #selector(didPressLocationButton), for: .touchUpInside)
        
        self.addSubview(locationButton)
        
        locationButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        locationButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        locationButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        locationButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
        
        resolver.$currentLocation
            .receive(on: RunLoop.main)
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveCompletion: { _ in
                
            }, receiveValue: { result in
                self.currentLocation(location: result)
            })
            .store(in: &cancellables)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didPressLocationButton() {
        resolver.startUpdatingLocation()
    }
    
    func currentLocation(location: CLLocation?) {
        viewModel.getCurrentLocation(location: location) { region in
            if let region {
                let adjustRegion: MKCoordinateRegion = self.mapView.regionThatFits(region)
                self.mapView.setRegion(adjustRegion, animated: true)
            }
        }
        
    }
    
    @objc func searchLocation() {
        searchTF.resignFirstResponder()
        if let searchText = self.searchTF.text, !searchText.isEmpty {
            viewModel.getLocationSearch(searchText: searchText) { mapItems in
                if let item = mapItems, item.count > 0 {
                    if let coordinate = item.first?.placemark.coordinate {
                        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 300, longitudinalMeters: 300)
                        self.mapView.setRegion(region, animated: true)
                    }
                }
                self.mapView.removeAnnotations(self.mapView.annotations)
                for item in mapItems ?? [] {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.placemark.name
                    self.mapView.addAnnotation(annotation)
                }
            }
        }
    }
}
