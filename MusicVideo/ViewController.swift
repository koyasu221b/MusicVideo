//
//  ViewController.swift
//  MusicVideo
//
//  Created by will on 04/12/2016.
//  Copyright © 2016 will. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let api = APIManager()
        api.loadData(urlString: "https://itunes.apple.com/tw/rss/topmusicvideos/limit=10/json"){ (result:String) in
            print(result)
            
            let alert = UIAlertController(title: result, message: nil, preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default){
                    action -> Void in
            }
            
            alert.addAction(okAction)
            //self.present(alert, animated: true)
            
            self.present(alert, animated: true, completion: nil)
            
            
        }
    }
    
//    func didLoadData(result:String){
//        print(result)
//    }

    

    
}

