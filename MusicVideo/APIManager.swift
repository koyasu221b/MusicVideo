//
//  APIManager.swift
//  MusicVideo
//
//  Created by will on 04/12/2016.
//  Copyright © 2016 will. All rights reserved.
//

import Foundation

class APIManager {

    func loadData(urlString: String, completion: @escaping ([Videos])-> Void){
        
        let config = URLSessionConfiguration.ephemeral
        
        let session = URLSession(configuration: config)
        
//        let session = URLSession.shared
        
        let url = URL(string: urlString)!
        
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) -> Void in
            
            if error != nil {
               print(error!.localizedDescription)
            }else{
              
                do{
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? JSONDictionary,
                        let feed = json["feed"] as? JSONDictionary,
                        let entries = feed["entry"] as? JSONArray {
                        
                        //print(json)
                        var videos = [Videos]()
                        for entry in entries {
                            let entry = Videos(data: entry as! JSONDictionary)
                            videos.append(entry)
                            
                        }
                        
                        let i = videos.count
                        print("iTunesApiManager - total count --> \(i)")
                        print(" ")
                        
                        
                        DispatchQueue.global(qos: .userInitiated).async {
                            DispatchQueue.main.async {
                                //completion("JSONSerialization Successful")
                                completion(videos)
                            }
                        }
                        
                    }
                }catch{
                    //DispatchQueue.main.async {
                    //    completion("error in JSONSerialization")
                    //}
                    print("error in JSONSerialization")
                }
            }
        })
        
        task.resume()
        
    }
}
