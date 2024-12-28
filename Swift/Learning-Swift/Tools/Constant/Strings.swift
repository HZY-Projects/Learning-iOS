//
//  Strings.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/12.
//

import SwiftUICore
import UIKit

struct Strings {
    
    let mapView = LocalizedStringKey("mapView")
    let CollectionView = LocalizedStringKey("CollectionView")
    let TableView = LocalizedStringKey("TableView")
    let Document = LocalizedStringKey("Document")
    let ScrollView = LocalizedStringKey("ScrollView")
    let ActivityView = LocalizedStringKey("ActivityView")
    let CalendarView = LocalizedStringKey("CalendarView")
    let UnavailableView = LocalizedStringKey("UnavailableView")
    
    enum type: String {
        case mapView
        case collectionView
        case tableView
        case document
        case scrollView
        case activityView
        case canlendarView
        case unavailableView
        
        func getLocalized() -> LocalizedStringKey {
            switch self {
            case .mapView:
                Strings().mapView
            case .collectionView:
                Strings().CollectionView
            case .tableView:
                Strings().TableView
            case .document:
                Strings().Document
            case .scrollView:
                Strings().ScrollView
            case .activityView:
                Strings().ActivityView
            case .canlendarView:
                Strings().CalendarView
            case .unavailableView:
                Strings().UnavailableView
            }
        }
        
        func getVC() -> UIViewController.Type {
            return switch self {
            case .mapView:
                MapVC.self
            case .tableView:
                TableViewVC.self
            case .document:
                DocumentVC.self
            case .collectionView:
                CollectDetailVC.self
            case .scrollView:
                ScrollViewVC.self
            case .activityView:
                ActivityViewVC.self
            case .canlendarView:
                if #available(iOS 16.0, *) {
                    CalendarViewVC.self
                } else {
                    UIViewController.self
                }
            case .unavailableView:
                if #available(iOS 17.0, *) {
                    UnavailableViewVC.self
                } else {
                    UIViewController.self
                }
            }
        }
    }
}

