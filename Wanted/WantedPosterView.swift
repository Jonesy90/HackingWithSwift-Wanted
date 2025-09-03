//
//  WantedPosterView.swift
//  Wanted
//
//  Created by Michael Jones on 03/09/2025.
//

import SwiftUI

/// creating a custom colour via code.
extension ShapeStyle where Self == Color {
    static var darkBrown: Color {
        Color(red: 0.3, green: 0.2, blue: 0.1)
    }
}

struct WantedPosterView: View {
    var image: Image?
    var crime: String
    var reward: String
    var contact: String
    var paperOpacity: Double
    
    var body: some View {
        ZStack {
            Color.white
            
            /// the paper image added behind the text.
            Image(.paper)
                .resizable()
                .scaledToFill()
                /// prevents the text to on beyond the size of the view.
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .opacity(paperOpacity)
            
            VStack(spacing: 0) {
                Text("WANTED")
                    .font(.custom("Superclarendon", size: 60))
                    .fontWeight(.black)
                    /// spaces the letters out.
                    .tracking(5)
                    .foregroundStyle(.darkBrown)
                    .padding(.bottom, -10)
                
                Text("DEAD OR ALIVE")
                    .font(.custom("Copperplate", size: 24))
                    .bold()
                    .tracking(2)
                    .foregroundStyle(.darkBrown)
                
                image?
                    .resizable()
                    .scaledToFill()
                    .frame(width: 270, height: 270)
                    .clipShape(Circle())
                    .grayscale(1)
                    .blendMode(.multiply)
                    .overlay(Circle().strokeBorder(.darkBrown, lineWidth: 8))
                    .padding(.vertical)
                
                Text("For \(crime)")
                    .font(.custom("Copperplate", size: 22))
                    .multilineTextAlignment(.center)
                    .bold()
                    .tracking(1)
                    .foregroundStyle(.darkBrown)
                
                Spacer()
                
                Text("REWARD")
                    .font(.custom("Copperplate", size: 30))
                    .tracking(3)
                    .bold()
                    .foregroundStyle(.darkBrown)
                Text(reward)
                    .font(.custom("Copperplate", size: 44))
                    .bold()
                    .tracking(2)
                    .foregroundStyle(.darkBrown)
                
                Spacer()

                Text(contact)
                    .font(.custom("Copperplate", size: 18))
                    .multilineTextAlignment(.center)
                    .tracking(3)
                    .bold()
                    .foregroundStyle(.darkBrown)
                    .padding(.bottom, 10)
            }
            /// provides a white shadow effect which helps pick the letters off the page.
            .shadow(color: Color.white, radius: 3)
            
            /// some horizontal padding.
            .padding(.horizontal)
        }
        /// this frame matches exactly with A4 paper.
        .frame(width: 420, height: 594)
    }
}

#Preview {
    WantedPosterView(crime: "Texting", reward: "$500", contact: "Police", paperOpacity: 1.0)
}
