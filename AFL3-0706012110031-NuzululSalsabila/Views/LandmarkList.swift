//
//  LandmarkList.swift
//  AFL3-0706012110031-NuzululSalsabila
//
//  Created by Nuzulul Salsabila on 14/04/23.
//

import SwiftUI

struct LandmarkList: View {
    //called  showFavoritesOnly set to true to see how the list reacts.
    @State private var showFavoritesOnly = true

    
    //checking the showFavoritesOnly property and each landmark
    var filteredLandmarks: [Landmark] {
            landmarks.filter { landmark in
                (!showFavoritesOnly || landmark.isFavorite)
            }
        }
    var body: some View {
       //identifiable data by passing along with data key path to a property
        NavigationView {
            List(filteredLandmarks) { landmark in
                //Specifying the Landmark Detail view 
                NavigationLink{
                    LandmarkDetail(landmark: landmark)
                } label: {
                    // return a landmark Row from the closure
                    LandmarkRow(landmark: landmark)
                }
            }
            //set the title of the navbar
            .navigationTitle("Landmarks")
        }
    }
}

// show landmarkList
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
