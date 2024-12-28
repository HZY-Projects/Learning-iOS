//
//  Drawrect.swift
//  Learning
//
//  Created by  whatsup on 2024/10/28.
//

import Foundation
import UIKit
import SwiftUI


public struct TempView: UIViewRepresentable {
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    public func makeUIView(context: Context) -> StarView {
        let star = StarView(frame: .init(x: 50, y: 50, width: 50, height: 50))
        star.drawStar(level: 3, count: 5)
        star.canSelect = true
        return star
    }
}


public class StarView: UIView {
    
    public var space: CGFloat = 15
    public var canSelect: Bool = false
    private(set) var maxStars: Int = 0//只读
    private(set) var _level: Int = 0
    private var shapeLayers: [CAShapeLayer] = []//准备一个数组重用一下layer
    
    //    MARK: - public method
    public func drawStar(level: Int, count:Int){
        
        _level = level
        maxStars = count
        
        for i in 0...maxStars - 1 {
            
            let color = i < level ? UIColor.orange : UIColor.gray
            let height = frame.size.height
            let rect = CGRect(x: (height + space) * CGFloat(i), y: 0, width: height, height: height)
            drawSingleStar(rect: rect, color: color, index: i)
        }
    }
    
    //    MARK: - private method
    private func DEG(angle: Double) -> Double {
        return angle * Double.pi / 180.0
    }
    
    private func P_SIN(radius: Double, angle: Double) -> Double {
        return radius * sin(angle * Double.pi / 180.0)
    }
    
    private func P_COS(radius: Double, angle: Double) -> Double {
        return radius * cos(angle * Double.pi / 180.0)
    }
    
    private func drawSingleStar(rect: CGRect, color: UIColor, index: Int) {
        
        if index > shapeLayers.count - 1 { //如果缺少layer，就创建
            
            let shapeLayer = CAShapeLayer()
            shapeLayers.append(shapeLayer)
            
            let r = Double(rect.size.height / 2.0)
            let path = UIBezierPath()
            let point1 = CGPoint(x: 0, y: -r)
            let point2 = CGPoint(x: P_COS(radius: r, angle: 18), y: -P_SIN(radius: r, angle: 18));
            let point3 = CGPoint(x: P_COS(radius: r, angle: 54), y: P_SIN(radius: r, angle: 54));
            let point4 = CGPoint(x:-P_SIN(radius: r, angle: 36), y: P_COS(radius: r, angle: 36));
            let point5 = CGPoint(x:-P_COS(radius: r, angle: 18), y: -P_SIN(radius: r, angle: 18));
            path.move(to: point1)
            path.addLine(to: point3)
            path.addLine(to: point5)
            path.addLine(to: point2)
            path.addLine(to: point4)
                    path.close()  //调不调用都可以
            
            shapeLayer.frame = CGRect(x: Double(rect.origin.x) + r, y: Double(rect.origin.y) + r, width: Double(rect.size.height), height: Double(rect.size.height))
//            shapeLayer.backgroundColor = UIColor.blue.cgColor
            shapeLayer.path = path.cgPath
            shapeLayer.fillColor = color.cgColor
            layer.backgroundColor = UIColor.red.cgColor
            
//            let path1 = UIBezierPath()
//            // 添加起始点
//            path1.move(to: CGPoint(x: 50, y: 100))
////            path1.addLine(to: CGPoint(x: 150, y: 100))
////            path1.addLine(to: CGPoint(x: 150, y: 150))
////            path1.close()
//               
//            // 添加曲线段
//            path1.addCurve(to: CGPoint(x: 250, y: 100),
//                          controlPoint1: CGPoint(x: 150, y: 0),
//                          controlPoint2: CGPoint(x: 150, y: 200))
//               
//            // 设置线宽和颜色
//            path1.lineWidth = 3.0
//            
//            path1.stroke()
//            shapeLayer.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
//            shapeLayer.path = path1.cgPath
//            shapeLayer.strokeColor = UIColor.red.cgColor
//            shapeLayer.fillColor = UIColor.clear.cgColor
            layer.addSublayer(shapeLayer)
            
        }else{
            let shapeLayer = shapeLayers[index]
            shapeLayer.fillColor = color.cgColor
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if(!canSelect){
            return
        }
        
        let touch = touches.first!
        let point = touch.location(in: self)
        var index = _level
        for (i, starLayer) in shapeLayers.enumerated(){
            //            var starLayer = shapeLayers[i]
            let width = starLayer.frame.size.width
            let rect = CGRect(x: starLayer.frame.origin.x - width / 2.0 - 7.5, y: starLayer.frame.origin.y - width / 2.0 - 7.5, width: width + 15, height: width + 15)
            if(rect.contains(point)){
                index = i + 1
            }
        }
        
        drawStar(level: index, count: maxStars)
    }
}

// 扩大点击区域
extension UIButton {
    
    private static var edgeInsetKey = "edgeInsetKey"
    
    public var scaleEdgeInset: UIEdgeInsets? {
        set {
            objc_setAssociatedObject(self, Self.edgeInsetKey, newValue, .OBJC_ASSOCIATION_COPY)
        }
        get {
            objc_getAssociatedObject(self, Self.edgeInsetKey) as? UIEdgeInsets ?? UIEdgeInsets()
        }
    }
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        guard let edge = self.scaleEdgeInset else {
            return super .point(inside: point, with: event)
        }
        var bounds = self.bounds
        let x = -edge.left
        let y = -edge.top
        let width = bounds.width + edge.left + edge.right
        let height = bounds.height + edge.top + edge.bottom
        bounds = .init(x: x, y: y, width: width, height: height)
        return bounds.contains(point)
    }
}

