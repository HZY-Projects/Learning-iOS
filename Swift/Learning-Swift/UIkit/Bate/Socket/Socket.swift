//
//  Socket.swift
//  Learning
//
//  Created by  whatsup on 2024/11/24.
//

import Foundation
//import SocketIO

final class Socket {
    
//    let manager = SocketManager(socketURL: URL(string: "http://localhost:8900")!, config: [.log(true), .compress])
//    var socket:SocketIOClient!
//    var name: String?
//    var resetAck: SocketAckEmitter?
//    
//    func addHandlers() {
//        socket.on("startGame") {[weak self] data, ack in
////            self?.handleStart()
//            return
//        }
//        
//        socket.on("name") {[weak self] data, ack in
//            if let name = data[0] as? String {
//                self?.name = name
//            }
//        }
//        
//        socket.on("playerMove") {[weak self] data, ack in
//            if let name = data[0] as? String, let x = data[1] as? Int, let y = data[2] as? Int {
////                self?.handlePlayerMove(name, coord: (x, y))
//            }
//        }
//        
//        socket.on("win") {[weak self] data, ack in
//            if let name = data[0] as? String, let typeDict = data[1] as? NSDictionary {
////                self?.handleWin(name, type: typeDict)
//            }
//        }
//        
//        socket.on("draw") {[weak self] data, ack in
////            self?.handleDraw()
//            return
//        }
//        
//        socket.on("currentTurn") {[weak self] data, ack in
//            if let name = data[0] as? String {
////                self?.handleCurrentTurn(name)
//                
//            }
//        }
//        
//        socket.on("gameReset") {[weak self] data, ack in
//            guard let sself = self else { return }
//            self?.resetAck = ack
////            self?.present(sself.alertController, animated: true, completion: nil)
//        }
//        
//        socket.on("gameOver") {data, ack in
//            exit(0)
//        }
//        
//        socket.onAny {print("Got event: \($0.event), with items: \($0.items!)")}
//    }
//    
//    init() {
//        socket = manager.defaultSocket
//        
//        addHandlers()
//        socket.connect()
//    }
}
