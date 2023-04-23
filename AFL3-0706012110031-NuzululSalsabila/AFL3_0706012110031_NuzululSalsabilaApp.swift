//
//  AFL3_0706012110031_NuzululSalsabilaApp.swift
//  AFL3-0706012110031-NuzululSalsabila
//
//  Created by Nuzulul Salsabila on 11/04/23.
//

import SwiftUI

@main
struct AFL3_0706012110031_NuzululSalsabilaApp: App {
    //create a model instance
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        //sets the content view of a SwiftUI app to an instance of the ContentView
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        //adds a custom command set to a SwiftUI view, but only if the target operating system is watchOS
        #if os(watchOS)
        .commands {
            LandmarkCommands()
        }
        #endif
        // defining a notification scene for a watchOS app
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
