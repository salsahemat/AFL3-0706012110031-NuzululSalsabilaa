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
        //show content in horizontal way
        HStack {
            // adding image
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name) //use the landmark property's name
            
            Spacer()
            //test whether the current landmark is a favorite.
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

//defines a preview provider for the LandmarkRow view
struct LandmarkRow_Previews: PreviewProvider {
    //to work with the ModelData object
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        // Wrap the LandmarkRow into a group
        Group {
            // add landmark parameter to LandmarkRow initializer
            LandmarkRow(landmark:landmarks[0])
            LandmarkRow(landmark:landmarks[1])
        }
        //set a size that approximates a row in a list
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
