//
//  ViewController.swift
//  MusicVideo
//
//  Created by will on 04/12/2016.
//  Copyright © 2016 will. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var videos = [Videos]()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var displayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.reachabilityStatusChanged), name: NSNotification.Name("abc"), object: nil)
        
        //NotificationCenter.default.addObserver(self, selector: selector("reachabilityStatusChanged"), name: NSNotification.Name.reachabilityChanged, object: nil)
        
        reachabilityStatusChanged()
        
        let api = APIManager()
        
        api.loadData(urlString: "https://itunes.apple.com/tw/rss/topmusicvideos/limit=50/json", completion: didLoadData)
        
       
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
        
        tableView.reloadData()
        
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
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let video = videos[indexPath.row]
        cell.textLabel?.text = ("\(indexPath.row + 1)")
        cell.detailTextLabel?.text = video.vName
        
        return cell
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    
}

