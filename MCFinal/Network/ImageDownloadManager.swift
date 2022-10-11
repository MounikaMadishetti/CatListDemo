//
//  ImageDownloadManager.swift
//  MCFinal
//
//  Created by Mounika Madishetti on 08/10/22.
//

import Foundation
import UIKit
final class CustomImageView: UIImageView {
    private let cache = NSCache<NSURL, UIImage>()
    
    func getImage(with url: URL) {
        if let img = cache.object(forKey: url as NSURL) {
            self.image = img
            return
        }
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.image = image
                        self?.cache.setObject(image, forKey: url as NSURL)
                         
                    }
                }
            }
        }
    }
}
