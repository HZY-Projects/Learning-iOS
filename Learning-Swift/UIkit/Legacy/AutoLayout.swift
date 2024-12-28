//
//  AutoLayout.swift
//  Learning
//
//  Created by  whatsup on 2024/10/30.
//

import Foundation

// frame 基于父视图坐标系 origin bounds等 简单视图方便 复杂的需要大量的计算

// autoResizingMask 是当视图内容转变时候起作用的类 可以保持宽高不变或者距离左右间距不变等 简单页面的转屏幕比较适合
// autoResizeMask 也是基于父视图 当视图进行旋转或变化的时候 去添加子视图需要固定的位置  宽固定 高固定 上边距 左边距固定等等 xib等就是使用此方法 处理以前的屏幕旋转等

// autoLayout    autoResizingMask = false
// autoLayout 自动布局 / leading trailing width height anchor  constant   multiple *
// autoLayout 几个视图之间建立联系 还添加有优先级的属性 top bottom leading trailing等添加视图之间的约束 子视图可以和父视图建立联系 子视图之间也可以建立联系 添加约束

// swiftUI stack flex那一套
