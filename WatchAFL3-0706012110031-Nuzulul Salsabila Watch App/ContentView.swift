//
//  ContentView.swift
//  WatchAFL3-0706012110031-Nuzulul Salsabila Watch App
//
//  Created by Nuzulul Salsabila on 21/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // displays the List view
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
