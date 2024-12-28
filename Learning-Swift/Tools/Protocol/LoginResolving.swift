//
//  LoginResolving.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/25.
//
import Foundation

protocol LoginResolving {
    func login(paramter: [String : Any]?) async -> LoginModel?
}

struct LoginResolver: LoginResolving {
    
    func login(paramter: [String : Any]?) async -> LoginModel? {
        do {
            let res: LoginModel = try await HttpRequest.postRequest(path: "https://v2.alapi.cn/api/kd", paramter: paramter)
            return res
        } catch  {
            return nil
        }
        
//        var request = URLRequest(url: URL(string: "https:www.baidu.com")!)
//        request.httpMethod = "Post"
//        request.allHTTPHeaderFields = HttpConfig.default.getHttpHeader()
//        do {
//            let response = try await URLSession(configuration: .default).data(for: request)
//            if !response.0.isEmpty {
//                return .init()
//            }
//            return .init()
//        } catch {
//            debugPrint("request error")
//            return .init()
//        }
    }
}

class LoginManager {
    static var main = LoginManager()
    fileprivate let resolver = LoginResolver()
    var modelInfo: LoginModel? = nil
    
    var isLogin: Bool {
        if let _ = modelInfo {
            return true
        }
        return false
    }
    
    func login(paramter: [String : Any]?, complete: @escaping (LoginModel?) -> Void) {
        Task {
            modelInfo = await resolver.login(paramter: paramter)
            complete(modelInfo)
        }
    }
}
