//
//  APIManager.swift
//  MusicVideo
//
//  Created by will on 04/12/2016.
//  Copyright © 2016 will. All rights reserved.
//

import Foundation

class APIManager {

    func loadData(urlString: String, completion: @escaping (String)-> Void){
        
        let config = URLSessionConfiguration.ephemeral
        
        let session = URLSession(configuration: config)
        
//        let session = URLSession.shared
        
        let url = URL(string: urlString)!
        
//        let task = session.dataTask(with: url, completionHandler: {
//            (data, response, error) -> Void in
//            
//            DispatchQueue.main.async {
//                if error != nil {
//                    completion((error?.localizedDescription)!)
//                }else {
//                    completion("URLSession successful!")
//                    print(data)
//                }
//            }
//            
//           
//        })
//        
//        task.resume()
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) -> Void in
            
            if error != nil {
                DispatchQueue.main.async {
                    completion((error?.localizedDescription)!)
                    
                }
            }else{
                print(data)
                do{
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: AnyObject]{
                        print(json)
                        
                        DispatchQueue.global(qos: .userInitiated).async {
                            DispatchQueue.main.async {
                                completion("JSONSerialization Successful")
                            }
                        }
                        
                    }
                }catch{
                    DispatchQueue.main.async {
                        completion("error in JSONSerialization")
                    }
                }
            }
        })
        
        task.resume()
        
    }
}
