//
//  ViewController.swift
//  CoffeeShopFinder
//
//  Created by Scotty Shaw on 10/29/15.
//  Copyright © 2015 ___sks6___. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Make the request
        Alamofire.request(.GET, "https://streamer.oit.duke.edu/places/items?tag=coffee_bar&access_token=+8709bea1abafc2b954e3543460e3dce0").responseJSON { (response) -> Void in
            
            if response.result.isSuccess {
                let json = JSON(response.result.value!)
                debugPrint(json)
            }
        }
        
        // Parse the JSON return
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

