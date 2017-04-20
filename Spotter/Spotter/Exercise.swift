//
//  Exercise.swift
//  Spotter
//
//  Created by Matthew Trahan on 4/3/17.
//  Copyright © 2017 Matthew Trahan. All rights reserved.
//

import Foundation

class Exercise {
    
    var name: String = ""
    var description: String = ""
    var videoLink: String = ""
    dynamic var category: Category!
    
    init(name: String, description: String, videoLink: String) {
        self.name = name
        self.description = description
        self.videoLink = videoLink
    }
}
