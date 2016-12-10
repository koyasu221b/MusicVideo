//
//  ViewController.swift
//  MusicVideo
//
//  Created by will on 04/12/2016.
//  Copyright © 2016 will. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var videos = [Videos]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let api = APIManager()
        
        api.loadData(urlString: "https://itunes.apple.com/tw/rss/topmusicvideos/limit=10/json", completion: didLoadData)
        
       
    }
    
    func didLoadData(videos:[Videos]){
        
        self.videos = videos
        for item in videos {
            print("name = \(item.vName)")
        }
        
        for (index, item) in videos.enumerated(){
            print("\(index) name = \(item.vName)")
        }
        
//        for i in 0..<videos.count {
//            let video = videos[i]
//            print("\(i) name = \(video.vName)")
//        }
    }
    
  
    

    
}

