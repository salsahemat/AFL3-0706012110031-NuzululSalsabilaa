//
//  AFL3_0706012110031_NuzululSalsabilaApp.swift
//  AFL3-0706012110031-NuzululSalsabila
//
//  Created by Nuzulul Salsabila on 11/04/23.
//

import SwiftUI

@main
struct AFL3_0706012110031_NuzululSalsabilaApp: App {
    //Update the LandmarksApp to create a model instance
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
