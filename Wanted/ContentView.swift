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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
