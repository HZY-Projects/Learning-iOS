//
//  Enum.swift
//  Learning
//
//  Created by  whatsup on 2024/10/29.
//

import Foundation

struct Enum {
    
    // north，south，east 和 west 不会被隐式地赋值为 0，1，2 和 3。相反，这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的 CompassPoint 类型。
    enum CompassPoint {
        case north
        case south
        case east
        case west
    }
    
    enum Beverage: CaseIterable {
        case coffee, tea, juice
    }
    
    // 类型关联
    enum Barcode {
        case upc(Int, Int, Int, Int)
        case qrCode(String)
    }
    
    let numberOfChoices = Beverage.allCases.count
    
    init() {
        for beverage in Beverage.allCases {
            print(beverage)
        }
        
        var productBarcode = Barcode.upc(8, 85909, 51226, 3)
        productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
        
        switch productBarcode {
        //关联值提取
        case .upc(let numberSystem, let manufacturer, let product, let check):
            print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
        case .qrCode(let productCode):
            print("QR code: \(productCode).")
        }
        
        switch productBarcode {
        case let .upc(numberSystem, manufacturer, product, check):
            print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
        case let .qrCode(productCode):
            print("QR code: \(productCode).")
        }
        
        enum Planet: Int {
            case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
        }
//        在上面的例子中，Plant.mercury 的显式原始值为 1，Planet.venus 的隐式原始值为 2，依次类推。
        
        enum CompassPoint: String {
            case north, south, east, west
        }
        
//        CompassPoint.north.rawValue
    }
   
}
