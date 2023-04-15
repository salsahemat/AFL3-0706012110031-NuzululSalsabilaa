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
    var body: some View {
        NavigationView {
            //Display the categories that can be identifies each item in the list
            List {
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    Text(key)
                }
            }
            .navigationTitle("Featured")
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
