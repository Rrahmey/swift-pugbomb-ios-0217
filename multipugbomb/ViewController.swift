//
//  ViewController.swift
//  multipugbomb
//
//  Created by Johann Kerr on 3/21/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    var pugStore = PugDataStore.sharedInstance
    var pugImages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadPugs()
        
 
    }
    
    func loadPugs() {
        
        pugStore.getLinksFromAPIClient {
            
            for pug in self.pugStore.pugLinks {
                PugAPIClient.loadPugImage(url: pug.pugURL, completion: { (image, success) in
                    if let pugImage = image {
                        self.pugImages.append(pugImage)
                        DispatchQueue.main.async {
                            self.collectionView?.reloadData()
                        }
                    }
                })
            }
            
            
            
            
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pugImages.count
    }
    
    
    func tryAgain (completion: @escaping (UIImage?)-> ()) {
        pugStore.getMoreLinksFromAPI {
            guard let newPugLink = self.pugStore.newPugLink else {return}
            PugAPIClient.loadPugImage(url: newPugLink.pugURL, completion: { (image, worked) in
                if worked {
                    completion(image)
                } else {
                    completion(nil)
                }
            })
        }
        
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pugCell", for: indexPath) as! PugViewCell
        cell.pugImage.image = self.pugImages[indexPath.row]
      //  cell.configCell(pug: self.pugStore.pugLinks[indexPath.row])
        
        //self.pugLinks.pugLinks = self.pugLinks.pugLinks.flatMap{$0}
        
//        if self.pugLinks.pugLinks.count < 100 {
//            self.pugLinks.getMoreLinksFromAPI {
//                print("done")
//            }
//        }
        
        
        return cell
    }
    
}





