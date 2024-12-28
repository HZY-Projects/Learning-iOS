//
//  MapVC.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/12.
//

import UIKit

class MapVC: UIViewController {

    let resolver: CommonResolver
    let locationResolver: LocationResolver

    var mapView: MapView!

    init(resolver: CommonResolver, locationResolver: LocationResolver) {
        self.resolver = resolver
        self.locationResolver = locationResolver
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = .init(resolver: locationResolver)
        view.addSubview(mapView)
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        //        mapView.accessibilityHint = "tips: this is a map"
        //        mapView.accessibilityLabel = "Amap"
        //        mapView.accessibilityTraits = .image
        //        mapView.accessibilityElementsHidden = true
    }
}
