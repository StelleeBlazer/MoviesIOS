//
//  MovieTableViewController.swift
//  Movies
//
//  Created by Mac n Cheese on 10/06/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class MovieTableViewController: UITableViewController {
    
    var results = [[String : Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let apiKey = "00864a15ca3b7f66e0705d19d47d4ca9"
        let language = "en-US"
        let page = "1"
        
        Alamofire.request("https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)&language=\(language)&page=\(page)")
            .responseJSON { (response) in
                
                let allJson = JSON(response.result.value as Any)
                self.results = allJson["results"].arrayObject as! [[String : Any]]
            
               if self.results.count > 0{
                    self.tableView.reloadData()
                }
                
                
                
            
        }
        
        
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return results.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMovie", for: indexPath) as! MovieTableViewCell
        
        let index = results[indexPath.row]
        let title = index["original_title"]
        let overview = index["overview"]
        let poster = index["poster_path"]
        
        cell.cellOverview.text = overview as? String
        cell.cellTitle.text = title as? String
        
        Alamofire.request("https://image.tmdb.org/t/p/w500\(poster!)").response { (poster) in
            cell.cellPoster.image = UIImage(data: poster.data!)
        }
        return cell
        // Configure the cell...
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
