import SwiftUI

struct ContentView: View {
    @State private var image: UIImage?
    @State private var prompt = ""
    @State private var result = "Result will appear here"

    var body: some View {
        VStack(spacing: 20) {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }

            Button("Pick Photo") {
                pickImage()
            }

            TextField("Prompt", text: $prompt)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button("Send to Gemini Vision") {
                if let img = image {
                    sendImagePrompt(image: img, prompt: prompt)
                }
            }

            Text(result)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding()
        }
        .padding()
    }

    func pickImage() {
        // This requires a custom image picker wrapper for SwiftUI
    }

    func sendImagePrompt(image: UIImage, prompt: String) {
        // Placeholder – handled in ViewController in UIKit setup
    }
}
