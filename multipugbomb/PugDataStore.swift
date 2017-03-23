//
//  PugDataStore.swift
//  multipugbomb
//
//  Created by Raquel Rahmey on 3/22/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation

final class PugDataStore {
    static let sharedInstance = PugDataStore()
    private init () {}
    
    var pugLinks = [PugLink]()
    var newPugLink: PugLink?
    
    func getLinksFromAPIClient(completion:@escaping() -> ()) {
        pugLinks = []
        for i in 0...450 {
            PugAPIClient.getImage { (links) in
                
                let pugLinksDict = PugLink(dictionary: links)
                print("hey", pugLinksDict)
                self.pugLinks.append(pugLinksDict)
                if i == 450 {
                    print("I am complete")
                    //if pugLinks.count != 0 { then do some more stuff maybe }
                    completion()
                }
            }
            print(pugLinks)
        }
        
    }
    
    func getMoreLinksFromAPI(completion:@escaping() ->()) {
            PugAPIClient.getImage { (link) in
                let brandNewPugLink = PugLink(dictionary: link)
                print(brandNewPugLink)
                self.newPugLink = brandNewPugLink
                completion()
    }
}
}
