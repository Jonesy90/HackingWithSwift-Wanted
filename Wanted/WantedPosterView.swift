//
//  WantedPosterView.swift
//  Wanted
//
//  Created by Michael Jones on 03/09/2025.
//

import SwiftUI

struct WantedPosterView: View {
    var image: Image?
    var crime: String
    var reward: String
    var contact: String
    var paperOpacity: Double
    
    var body: some View {
        VStack(spacing: 0) {
            Text("WANTED")
            Text("DEAD OR ALIVE")
            
            image
            
            Text("For \(crime)")
            
            Spacer()
            
            Text("REWARD")
            Text(reward)
            
            Spacer()
            
            Text("CONTACT")
            Text(contact)
        }
    }
}

#Preview {
    WantedPosterView(crime: "Texting", reward: "$500", contact: "Police", paperOpacity: 0.5)
}
