//
//  RotatedBadgeSymbol.swift
//  AFL3-0706012110031-NuzululSalsabila
//
//  Created by Nuzulul Salsabila on 14/04/23.
//

import SwiftUI

//
struct RotatedBadgeSymbol: View {
    let angle: Angle
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

//
struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        //to encapsulate the concept of a rotated symbol
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
