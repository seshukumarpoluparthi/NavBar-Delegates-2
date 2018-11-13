//
//  Video.swift
//  YouTube Example
//
//  Created by Sean Allen on 4/9/17.
//  Copyright © 2017 Sean Allen. All rights reserved.
//

import Foundation
import UIKit

class Video {
    
    var image: UIImage
    var url: String
    var title: String
    
    init(image: UIImage, url: String, title: String) {
        self.image = image
        self.url = url
        self.title = title
    }
    
}
