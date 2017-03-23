//
//  PugViewCell.swift
//  multipugbomb
//
//  Created by Johann Kerr on 3/21/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit

class PugViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pugImage: UIImageView!
    
    func configCell(pug: PugLink) {
        PugAPIClient.loadPugImage(url: pug.pugURL) { (image, worked) in
        
            if worked {
                self.pugImage.image = image
            } else {
                
//                self.tryAgain(completion: { (image) in
//                    if image != nil {
//                        cell.pugImage.image = image
//                    }else {
//                        cell.pugImage.backgroundColor = UIColor.blue
//                    }
//                    
//                })
            }
        }
    }
   
}
