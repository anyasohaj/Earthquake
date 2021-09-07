//
//  EarthquakeData.swift
//  Earthquake
//
//  Created by Balazs Agnes on 07.08.2021.
//

import Foundation

struct EarthquakeData: Decodable{
    let features: [Features]
}

struct Features: Decodable{
    let properties : Properties
    let geometry: Geometry
    let id: String
}

struct Properties: Decodable{
    let mag : Double
    let place: String
    let time: Int
}
struct Geometry: Decodable{
    let coordinates:[Double]
}
