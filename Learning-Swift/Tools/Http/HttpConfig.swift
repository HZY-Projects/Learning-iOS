//
//  HttpConfig.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/29.
//

import Foundation

final class HttpConfig {
    
    typealias headerDicionary = [String: String]
    
    static let `default` = HttpConfig()
    
    let timeout: TimeInterval = 10
    
    fileprivate var httpHeader: headerDicionary?
    
    fileprivate var header: headerDicionary {
        guard Bundle.main.infoDictionary?["CFBundleShortVersionString"] is String else {
            return httpHeader ?? [:]
        }
//        httpHeader?["Version"] = version
        httpHeader?["Accept"] = "application/json"
//        if let CFBundleVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
//            httpHeader?["User-Agent"] = "Learning/\(version)"
//        }
        // Authorization  Bearer + Token
        return httpHeader ?? [:]
    }
    
    func configHttpHeader(_ header: headerDicionary) {
        httpHeader = header
    }
    
    func getHttpHeader() -> headerDicionary {
        header
    }
}
