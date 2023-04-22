//
//  LandmarkList.swift
//  AFL3-0706012110031-NuzululSalsabila
//
//  Created by Nuzulul Salsabila on 14/04/23.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    //called  showFavoritesOnly set to false to see how the list reacts.
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: Landmark?
    
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory { self }
    }
    
    //checking the showFavoritesOnly property and each landmark
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    
    
    var body: some View {
        //identifiable data by passing along with data key path to a property
        //        NavigationView {
        //            List {
        //                //passing a binding to showFavoritesOnly
        //                Toggle(isOn: $showFavoritesOnly) {
        //                    Text("Favorites only")
        //                }
        //                ForEach(filteredLandmarks) { landmark in
        //                    //Specifying the Landmark Detail view
        //                    NavigationLink{
        //                        LandmarkDetail(landmark: landmark)
        //                    } label: {
        //                        // return a landmark Row from the closure
        //                        LandmarkRow(landmark: landmark)
        //                    }
        //                }
        //            }
        //            //set the title of the navbar
        //            .navigationTitle("Landmarks")
        //        }
        //navigation link kemana link akan menuju
        NavigationStack{
            List(modelData.landmarks) { landmark in
                NavigationLink{
                    LandmarkDetail(landmark: landmark)
                }label:{
                    LandmarkRow(landmark:landmark)
                }
            }
            .navigationTitle("Landmarks")
            .frame(minWidth: 300)
        }
    }
}

// show landmarkList
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
        //gets its value automatically
            .environmentObject(ModelData())
    }
}
