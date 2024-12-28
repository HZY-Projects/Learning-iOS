//
//  Document.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/18.
//

import UIKit

class Document: UIDocument {
    
    var saveText: String = ""
    
    override func contents(forType typeName: String) throws -> Any {
        debugPrint(typeName)
        return saveText.data(using: .utf8) ?? ""
    }
    
    static func urlForFile(fileName: String) -> URL? {
        let fileUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let url = fileUrl?.appendingPathComponent(fileName)
        return url
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        if let contents = contents as? Data {
            self.saveText = String.init(data: contents, encoding: .utf8) ?? ""
        }
    }
       
}
