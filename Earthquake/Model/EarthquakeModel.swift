//
//  EarthquakeModel.swift
//  Earthquake
//
//  Created by Balazs Agnes on 07.08.2021.
//

import Foundation
import CoreLocation

struct EarthquakeModel{
    let flagSource: String
    let place: String
    let strength: Double
    let timeInMilliseconds : Double
    var time: Date{
        return Date(timeIntervalSince1970: timeInMilliseconds/1000)

    }
    let dateFormatter = DateFormatter()
    var date: String{dateFormatter.string(from: time)}
    
    let coordinates :[Double]
    var location: String{
        var loc : String = ""
            let longitude :CLLocationDegrees = coordinates[0]
            let latitude :CLLocationDegrees = coordinates[1]
            
            let location = CLLocation(latitude: latitude, longitude: longitude) //changed!!!
            print(location)
            
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
               
                guard error == nil else {
                    print("Reverse geocoder failed with error" + error!.localizedDescription)
                    return
                }
                guard placemarks!.count > 0 else {
                    print("Problem with the data received from geocoder")
                    return
                }
                let pm = placemarks![0]
                if let place = pm.locality{
                    loc = place
                }else{
                    loc = "Somewhere"
                }
                print("The location is \(loc)")
            })
       
        return loc
        }
        
        
    
}


