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

    @IBOutlet weak var displayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.reachabilityStatusChanged), name: NSNotification.Name("abc"), object: nil)
        
        //NotificationCenter.default.addObserver(self, selector: selector("reachabilityStatusChanged"), name: NSNotification.Name.reachabilityChanged, object: nil)
        
        reachabilityStatusChanged()
        
        let api = APIManager()
        
        api.loadData(urlString: "https://itunes.apple.com/tw/rss/topmusicvideos/limit=10/json", completion: didLoadData)
        
       
    }
    
    func didLoadData(videos:[Videos]){
        
        //print(reachabilityStatus)
        
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
    
    
    func reachabilityStatusChanged()
    {
        switch reachabilityStatus {
        case NOACCESS:
            view.backgroundColor = UIColor.red
            displayLabel.text = "No Internet"
        case WIFI:
            view.backgroundColor = UIColor.green
            displayLabel.text = "Reachable with WIFI"
        case WWAN:
            view.backgroundColor = UIColor.yellow
            displayLabel.text = "Reachable with Cellular"
        default:
            return
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.reachabilityChanged, object: nil)
    }
  
    

    
}

