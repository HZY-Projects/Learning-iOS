//
//  DocumentVC.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/18.
//

import UIKit

class DocumentVC: UIViewController {
    
    @IBOutlet weak var readBtn: UIButton!
    @IBOutlet weak var writeBtn: UIButton!
    @IBOutlet weak var logLab: UILabel!
    var doc: Document?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.readBtn.titleLabel?.text = "Read Data"
        self.writeBtn.titleLabel?.text = "Write Data"
    }
    
    @IBAction func clickToWrite(_ sender: Any) {
        let url = Document.urlForFile(fileName: "data.txt")
        if let url {
            doc = Document(fileURL: url)
            doc?.saveText = "test data"
            doc?.save(to: url, for: .forCreating) {
                debugPrint("isSuccessed ---- \($0)")
            }
        }
    }
    
    @IBAction func clickToReadData(_ sender: Any) {
        if let doc {
            doc.open {
                debugPrint("isOpen ---- \($0)")
            }
            logLab.text = "save data: \(doc.saveText), file path: \(String(describing: Document.urlForFile(fileName: "data.txt")))"
        }
    }
}
