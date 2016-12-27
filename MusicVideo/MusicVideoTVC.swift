//
//  MusicVideoTVC.swift
//  MusicVideo
//
//  Created by will on 21/12/2016.
//  Copyright © 2016 will. All rights reserved.
//

import UIKit

class MusicVideoTVC: UITableViewController {

    var videos = [Videos]()
    
    // Call many times
//    override func viewDidAppear(_ animated: Bool) {
//        <#code#>
//    }
    
    // Call once
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.reachabilityStatusChanged), name: NSNotification.Name("abc"), object: nil)
        
        //NotificationCenter.default.addObserver(self, selector: selector("reachabilityStatusChanged"), name: NSNotification.Name.reachabilityChanged, object: nil)
        
        reachabilityStatusChanged()
        
        
    }
    
    
    func runAPI(){
        
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
            // move back to Main Queue
            DispatchQueue.main.async {
                self.view.backgroundColor = UIColor.red
                let alert = UIAlertController(
                    title: "No Internet Access",
                    message: "Please make sure you are connected to the Internet",
                    preferredStyle: UIAlertControllerStyle.alert)
                
                let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: { action -> () in
                    print("Cancel")
                })
                
                let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.destructive, handler: { action -> () in
                    print("delete")
                })
                
                let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: { action -> Void in
                    print("Ok")
                })
                
                alert.addAction(okAction)
                alert.addAction(cancelAction)
                alert.addAction(deleteAction)
                
                
                self.present(alert, animated: true, completion: nil)
            }
            
            
        default:
            view.backgroundColor = UIColor.green
            if videos.count <= 0 {
                runAPI()
            }else{
                print("do not refresh API")
            }
            
        }
        
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.reachabilityChanged, object: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return videos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let video = videos[indexPath.row]
        cell.textLabel?.text = ("\(indexPath.row + 1)")
        cell.detailTextLabel?.text = video.vName


        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
