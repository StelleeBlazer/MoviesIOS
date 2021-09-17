//
//  ViewController.swift
//  Movies
//
//  Created by Mac n Cheese on 10/06/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let apiKey = "00864a15ca3b7f66e0705d19d47d4ca9"
        let language = "en-US"
        let page = "1"
        
        Alamofire.request("https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)&language=\(language)&page=\(page)")
            .responseJSON{ (response) in
                
                let allJson = JSON(response.result.value as Any)
                let page = allJson["page"]
                print("page \(page)")
                
                let dates = allJson["dates"]
                let maximum = dates["maximum"]
                print("maximum \(maximum)")
                
                let results = allJson["results"].arrayValue
                for index in results{
                    let title = index ["original_title"]
                    print("title \(title)")
                    
                }
        }
            
    }


}

