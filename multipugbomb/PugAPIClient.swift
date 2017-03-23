//
//  PugAPIClient.swift
//  multipugbomb
//
//  Created by Raquel Rahmey on 3/22/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import UIKit

class PugAPIClient {
    
    class func getImage(with completion: @escaping ([String:String]) -> ()) {
        
        let urlString = "http://pugme.herokuapp.com/random"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let unwrappedData = data else {fatalError("Unable to get data \(error?.localizedDescription)")}
            do {
                guard let responseJson = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [String:String] else {return}
                print(responseJson)
                completion(responseJson)
            } catch {
                
            }
        })
        dataTask.resume()
    }
    
    class func loadPugImage(url: String, completion: @escaping (UIImage?, Bool)-> ()) {
        guard let url = URL(string: url) else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let rawData = data, let image = UIImage(data: rawData)
                    else { completion(nil, false); return }
                completion(image, true)
            }
            
        }
        task.resume()
    }
}
    
   




