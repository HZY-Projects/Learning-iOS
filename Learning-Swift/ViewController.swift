//
//  ViewController.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    

//      ------------------- Swift ---------------------
    
//    Variables are always initialized before use. 变量在使用前必须要初始化
//    Array indices are checked for out-of-bounds errors.  数组下标越界检测
//    Integers are checked for overflow. 整数溢出检测
//    Optionals ensure that nil values are handled explicitly. 可选确保nil会被明确的处理
//    Memory is managed automatically. 内存自动管理
//    Error handling allows controlled recovery from unexpected failures. 错误处理允许发生未知错误被恢复
    
//    you don’t always have to write the type explicitly.
//    let implicitInteger = 70  int
//    let implicitDouble = 70.0  double
//    let explicitDouble: Double = 70
    
//    Values are never implicitly converted to another type. If you need to convert a value to a different type, explicitly make an instance of the desired type.
//    let label = "The width is "
//    let width = 94
//    let widthLabel = label + String(width)
    
//    There’s an even simpler way to include values in strings: Write the value in parentheses, and write a backslash (\) before the parentheses. For example:
//    let apples = 3
//    let oranges = 5
//    let appleSummary = "I have \(apples) apples."
//    let fruitSummary = "I have \(apples + oranges) pieces of fruit."
    
    
//    Use three double quotation marks (""") for strings that take up multiple lines. Indentation at the start of each quoted line is removed, as long as it matches the indentation of the closing quotation marks. For example:
//    let quotation = """
//            Even though there's whitespace to the left,
//            the actual lines aren't indented.
//                Except for this line.
//            Double quotes (") can appear without being escaped.
//
//            I still have \(apples + oranges) pieces of fruit.
//            """

//    Create arrays and dictionaries using brackets ([]), and access their elements by writing the index or key in brackets. A comma is allowed after the last element.
//    var fruits = ["strawberries", "limes", "tangerines"]
//    fruits[1] = "grapes"
//
//
//    var occupations = [
//        "Malcolm": "Captain",
//        "Kaylee": "Mechanic",
//     ]
//    occupations["Jayne"] = "Public Relations"
    
//    Arrays automatically grow as you add elements.
//    fruits.append("blueberries")
//    print(fruits)
    // Prints "["strawberries", "grapes", "tangerines", "blueberries"]"
    
//    You also use brackets to write an empty array or dictionary. For an array, write [], and for a dictionary, write [:].
//    fruits = []
//    occupations = [:]
    
//    If you’re assigning an empty array or dictionary to a new variable, or another place where there isn’t any type information, you need to specify the type.
//    let emptyArray: [String] = []
//    let emptyDictionary: [String: Float] = [:]
}

