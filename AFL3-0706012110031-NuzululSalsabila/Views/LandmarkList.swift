//
//  LandmarkList.swift
//  AFL3-0706012110031-NuzululSalsabila
//
//  Created by Nuzulul Salsabila on 14/04/23.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
       //identifiable data by passing along with data key path to a property
        NavigationView {
            List(landmarks) { landmark in
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
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
                    LandmarkList()
                        .previewDevice(PreviewDevice(rawValue: deviceName))
                        .previewDisplayName(deviceName)
                }
    }
}
