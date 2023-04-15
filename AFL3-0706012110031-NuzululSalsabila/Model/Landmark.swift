//
//  Landmark.swift
//  AFL3-0706012110031-NuzululSalsabila
//
//  Created by Nuzulul Salsabila on 14/04/23.
//

import Foundation
import SwiftUI
import CoreLocation

//Define landmark structure with a few properties
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    //to access and modify the category of a specific landmark
    var category: Category
       enum Category: String, CaseIterable, Codable {
           case lakes = "Lakes"
           case rivers = "Rivers"
           case mountains = "Mountains"
       }
    
    //add an imageName property to read the name of the image from the data
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    //mark as private because only to create a public compute locationCoordinate
    private var coordinates: Coordinates
    
    //Calculate a location coordinator property
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    //add coordinates property to reflects the storage in the JSON data structure
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
