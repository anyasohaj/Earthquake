//
//  Networking.swift
//  Earthquake
//
//  Created by Balazs Agnes on 07.08.2021.
//

import Foundation
import UIKit


protocol NetworkingDelegate {
    func updateUI(datalist: [EarthquakeModel])
    func handleErrors(error: Error)
}

struct Networking{
    
    var delegate: NetworkingDelegate?
    
    let baseUrl = "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&eventtype=earthquake&orderby=time&minmag=6&limit=10"
    
    func perform() {
    
        if let url = URL(string: baseUrl){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){data, response, error in if let e = error{
                    print(e)
                }else{
                    if let safeData = data{
                        let earthquake = parseJSON(data: safeData)
                        DispatchQueue.main.async {
                            delegate?.updateUI(datalist: earthquake)
                        }
                   }
                }
            }
            print(baseUrl)
            task.resume()
            }else{
                print("Something went wrong with the url")
            }
    }
    
    func parseJSON(data: Data?)->[EarthquakeModel]{
        var earthquakeArray: [EarthquakeModel] = []
        if let dataString = data {
            let decoder = JSONDecoder()
            do{
                let decoded = try decoder.decode(EarthquakeData.self, from: dataString)
                
                let features = decoded.features
                let arraySize = features.count
                
                print("ArraySize is \(arraySize)")
                
                for num in 0...arraySize-1{
                
                let location = decoded.features[num].properties.place
                let strength = decoded.features[num].properties.mag
                let time = decoded.features[num].properties.time
                let coordinates = decoded.features[num].geometry.coordinates
                    
                    earthquakeArray.append(EarthquakeModel(flagSource: "flag", place: location, strength: strength, timeInMilliseconds: Double(time), coordinates: coordinates))
                }
            }catch{
                print("There's an error here")
            }
        }
        return earthquakeArray
    }
    
}

