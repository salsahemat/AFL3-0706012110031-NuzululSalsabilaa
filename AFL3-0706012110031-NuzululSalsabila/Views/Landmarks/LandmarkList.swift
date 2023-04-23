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
    //initiate filter state variable
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: Landmark?
    
    //describe filter states
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
            && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    //Returns a string that is used as the title for the navigation bar in the LandmarkList view
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    //Returns the index of the selectedLandmark in the modelData.landmarks array
    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    
    
    var body: some View {
        //navigation stack is the new navigation list
        NavigationStack{
            List(modelData.landmarks) { landmark in
                NavigationLink{
                    LandmarkDetail(landmark: landmark)
                }label:{
                    LandmarkRow(landmark:landmark)
                }
            }
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        //make the filter appear together
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        //accessible to see   list of the landmarks gets
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                        
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            Text("Select a Landmark")
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
