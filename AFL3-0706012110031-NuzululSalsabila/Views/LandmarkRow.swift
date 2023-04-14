//
//  LandmarkRow.swift
//  AFL3-0706012110031-NuzululSalsabila
//
//  Created by Nuzulul Salsabila on 14/04/23.
//

import SwiftUI

//add stored property
struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        //menampilkan konten secara horizontal
        HStack {
            // adding image 
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name) //use the landmark property's name
            
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        // add landmark parameter to LandmarkRow initializer
        LandmarkRow(landmark:landmarks[0])
    }
}
