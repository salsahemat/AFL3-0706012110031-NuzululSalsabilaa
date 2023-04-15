//
//  CategoryHome.swift
//  AFL3-0706012110031-NuzululSalsabila
//
//  Created by Nuzulul Salsabila on 14/04/23.
//

import SwiftUI

// shows the featured content in a navigation view
struct CategoryHome: View {
    //access an instance of ModelData
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    var body: some View {
        NavigationView {
            //Display the categories that can be identifies each item in the list
            List {
                //displays one of the featured landmarks with a scaled and cropped preview image
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                //set edgeinsets to zero
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            //pick a list style that better suits the content
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

//preview provider for the CategoryHome view
struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
        //pass data and state around
            .environmentObject(ModelData())
    }
}
