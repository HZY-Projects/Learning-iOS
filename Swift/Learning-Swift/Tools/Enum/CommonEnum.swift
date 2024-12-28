//
//  CommonEnum.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/25.
//

import UIKit

/* ---------------------------------------------------------------- */
// Controller type
enum ControllerType: String {
    case map
    case sun
    case location
    case person
    
    case gridCollection
    case distintCollection
    case videosCollection
    
    func viewController() -> UIViewController.Type? {
        return switch self {
        case .gridCollection: GridCollectionVC.self
        case .distintCollection: DistintCollectVC.self
        case .videosCollection: VideosController.self
        default: nil
        }
    }
}

/* ---------------------------------------------------------------- */
// collection section type
public enum GridSection: String {
    case feature
    case type
}
