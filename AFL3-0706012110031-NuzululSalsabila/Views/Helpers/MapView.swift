//
//  MapView.swift
//  AFL3-0706012110031-NuzululSalsabila
//
//  Created by Nuzulul Salsabila on 11/04/23.
//

import SwiftUI
import MapKit

//Define mapview to show maps
struct MapView: View {
    //save coordinate geographis
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    var body: some View {
        Map(coordinateRegion: $region) //reference to state private var region
            .onAppear {
                setRegion(coordinate)
            }
    }
    //method that updates the region based on a coordinate value
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
            region = MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
        }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        //update the preview provider to pass a fixed coordinate
        MapView(coordinate:CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
