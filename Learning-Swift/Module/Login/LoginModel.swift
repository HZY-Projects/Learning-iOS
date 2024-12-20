//
//  LoginModel.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/30.
//

import Foundation

struct LoginModel: Codable {
    let code: String?
    let msg: String
    let data: LoginSubData?
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        msg = try container.decode(String.self, forKey: .msg)
        let codeTemp = try container.decode(Int.self, forKey: .code)
        code = String(codeTemp)
        data = try container.decode(LoginSubData?.self, forKey: .data)
    }
}

struct LoginSubData: Codable {
    let info: [LoginInfoData]?
}

struct LoginInfoData: Codable {
    let time: String?
    let content: String?
}
