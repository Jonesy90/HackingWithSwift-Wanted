//
//  ContentView.swift
//  Wanted
//
//  Created by Michael Jones on 03/09/2025.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    /// a property that stores our rendered image.
    @State private var renderedPoster: Image?
    
    @AppStorage("crime") private var crime = "Train Robbery, Horse Rustling, and Other Naughty Crimes"
    @AppStorage("reward") private var reward = "$500"
    @AppStorage("contact") private var contact = "Contact Camberley Police for more information"
    @AppStorage("paperOpacity") private var paperOpacity: Double = 0.75
    
    @State private var inputPickerItem: PhotosPickerItem?
    @State private var inputImage: Image?
    
    var body: some View {
        NavigationStack {
            Form {
                renderedPoster?
                    .resizable()
                    .scaledToFill()
                
                Section {
                    PhotosPicker("Select an image", selection: $inputPickerItem, matching: .images)
                }
                
                Section("What is their crime?") {
                    TextField("Enter their crime", text: $crime, axis: .vertical)
                }
                
                Section("What's the reward?") {
                    TextField("Enter the reward", text: $reward)
                }
                
                Section("Who should they contact?") {
                    TextField("Enter a contact", text: $contact, axis: .vertical)
                }
                
                Section("Paper Opacity") {
                    Slider(value: $paperOpacity, in: 0...1)
                }
            }
            .navigationTitle("Design Your Poster")
            .navigationBarTitleDisplayMode(.inline)
        }
        /// run this function when the body appears.
        .onAppear(perform: render)
        
        /// if any of these variables changes value, run the render again with the new value.
        .onChange(of: [crime, reward, contact, String(paperOpacity)], render)
        
        /// when the user has chosen a new picture, it will launch a new background task, that will load the data into inputImage.
        .onChange(of: inputPickerItem) {
            Task {
                /// take the image from the inputPickerItem and give it to inputImage.
                inputImage = try? await inputPickerItem?.loadTransferable(type: Image.self)
                /// calls render to use the new image.
                render()
            }
            
        }
        .toolbar {
            if let renderedPoster {
                ShareLink(item: renderedPoster, preview: SharePreview("Wanted for \(crime)", image: renderedPoster))
            }
        }
    }
    
    
    /// turn the SwiftUI View into an Image and sends the image to the variable 'renderedPoster'.
    func render() {
        let render = ImageRenderer(content: WantedPosterView(image: inputImage, crime: crime, reward: reward, contact: contact, paperOpacity: paperOpacity))
        
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
