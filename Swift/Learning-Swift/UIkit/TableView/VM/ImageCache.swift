//
//  TableViewVC.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/16.
//

import UIKit
import Foundation

public class ImageCache {
    
    public static let publicCache = ImageCache()
    
    var placeholderImage = UIImage(systemName: "rectangle")!
    
    private let cachedImages = NSCache<NSURL, UIImage>()
    
    private var loadingResponses = [NSURL: [(TableViewSubModel, UIImage?) -> Void]]()
    
    public final func image(url: NSURL) -> UIImage? {
        return cachedImages.object(forKey: url)
    }

    final func load(url: NSURL, item: TableViewSubModel, completion: @escaping (TableViewSubModel, UIImage?) -> Void) {
        if let cachedImage = image(url: url) {
            DispatchQueue.main.async {
                completion(item, cachedImage)
            }
            return
        }

        if loadingResponses[url] != nil {
            loadingResponses[url]?.append(completion)
            return
        } else {
            loadingResponses[url] = [completion]
        }
        
        ImageURLProtocol.urlSession().dataTask(with: url as URL) { (data, response, error) in
            
            guard let responseData = data, let image = UIImage(data: responseData),
                let blocks = self.loadingResponses[url], error == nil else {
                DispatchQueue.main.async {
                    completion(item, nil)
                }
                return
            }
            
            self.cachedImages.setObject(image, forKey: url, cost: responseData.count)
            
            for block in blocks {
                DispatchQueue.main.async {
                    block(item, image)
                }
                return
            }
        }.resume()
    }
        
}
