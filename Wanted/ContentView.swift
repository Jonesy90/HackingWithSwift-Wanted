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
        .onAppear(perform: render)
    }
    
    
    /// turn the SwiftUI View into an Image and sends the image to the variable 'renderedPoster'.
    func render() {
        let render = ImageRenderer(content: WantedPosterView(crime: "Texting", reward: "$500", contact: "Police", paperOpacity: 0.5))
        
        if let image = render.uiImage {
            renderedPoster = Image(uiImage: image)
        }
    }
}

#Preview {
    ContentView()
}
