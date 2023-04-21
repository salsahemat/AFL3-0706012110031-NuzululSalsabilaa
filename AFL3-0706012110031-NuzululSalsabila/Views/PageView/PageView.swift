//
//  PageView.swift
//  AFL3-0706012110031-NuzululSalsabila
//
//  Created by Nuzulul Salsabila on 21/04/23.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    //declare a state variable whose value can change during the lifecycle of the view
    @State private var currentPage = 0
    
    var body: some View {
        //$currentPage allowing the view controller to update the value of currentPage
        VStack {
            PageViewController(pages: pages, currentPage: $currentPage)
            Text("Current Page: \(currentPage)")
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        // pass the required array of views
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
