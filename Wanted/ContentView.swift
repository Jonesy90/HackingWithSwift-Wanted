//
//  ContentView.swift
//  Wanted
//
//  Created by Michael Jones on 03/09/2025.
//

import SwiftUI

struct ContentView: View {
    /// a property that stores our rendered image.
    @State private var renderedPoster: Image?
    
    @AppStorage("crime") private var crime = "Train Robbery, Horse Rustling, and Other Naughty Crimes"
    @AppStorage("reward") private var reward = "$500"
    @AppStorage("contact") private var contact = "Contact Camberley Police for more information"
    @AppStorage("paperOpacity") private var paperOpacity: Double = 0.75
    
    var body: some View {
        NavigationStack {
            Form {
                renderedPoster?
                    .resizable()
                    .scaledToFill()
            }
            .navigationTitle("Design Your Poster")
            .navigationBarTitleDisplayMode(.inline)
        }
        /// run this function when the body appears.
        .onAppear(perform: render)
    }
    
    
    /// turn the SwiftUI View into an Image and sends the image to the variable 'renderedPoster'.
    func render() {
        let render = ImageRenderer(content: WantedPosterView(crime: crime, reward: reward, contact: contact, paperOpacity: paperOpacity))
        
        /// increases the resolution of the image by 3.
        render.scale = 3
        
        if let image = render.uiImage {
            renderedPoster = Image(uiImage: image)
        }
    }
}

#Preview {
    ContentView()
}
