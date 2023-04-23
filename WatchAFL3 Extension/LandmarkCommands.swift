//
//  LandmarkCommands.swift
//  AFL3-0706012110031-NuzululSalsabila
//
//  Created by Nuzulul Salsabila on 23/04/23.
//
import SwiftUI

struct LandmarkCommands: Commands {
    //create a binding to the selectedLandmark focused value
    @FocusedBinding(\.selectedLandmark) var selectedLandmark
    var body: some Commands {
        SidebarCommands()
        
        CommandMenu("Landmark") {
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }
}

//conforms to the FocusedValueKey protocol and associates a Binding<Landmark>
private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}
//manage the focused value for the selected landmark across multiple views
extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}
