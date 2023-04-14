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
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark) // return a landmark Row from the closure 
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
