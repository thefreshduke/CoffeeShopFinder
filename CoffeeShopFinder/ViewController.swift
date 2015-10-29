//
//  ViewController.swift
//  CoffeeShopFinder
//
//  Created by Scotty Shaw on 10/29/15.
//  Copyright © 2015 ___sks6___. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    
    var coffeeShops: [String: [Double]] = [String: [Double]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Make the request
        Alamofire.request(.GET, "https://streamer.oit.duke.edu/places/items?tag=coffee_bar&access_token=+8709bea1abafc2b954e3543460e3dce0").responseJSON { (response) -> Void in
            
            if response.result.isSuccess {
                let json = JSON(response.result.value!)
                debugPrint(json)
                for (idx, subJson): (String, JSON) in json {
                    let name = subJson["name"].stringValue
                    let location = subJson["location"].stringValue
                    
                    let latitude = subJson["position"]["latitude"].doubleValue
                    let longitude = subJson["position"]["longitude"].doubleValue
                    
                    let pin = MKPointAnnotation()
                    pin.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    pin.title = name
                    pin.subtitle = location
                    
                    self.map.addAnnotation(pin)
                    
                    let content: [Double] = [latitude, longitude]
                    self.coffeeShops[name] = content
                }
            }
        }
        
        // Parse the JSON return
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

