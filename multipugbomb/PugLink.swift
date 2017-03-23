//
//  PugLink.swift
//  multipugbomb
//
//  Created by Raquel Rahmey on 3/22/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation

class PugLink {
    var pugURL: String
    
    init(dictionary: [String:String]) {
        self.pugURL = dictionary["pug"] ?? "nothing"
        
    }
}
