import FirebaseGenerativeAI
import UIKit

func sendImagePrompt(image: UIImage, prompt: String) {
    let api = GenerativeAI.shared
    guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }

    api.generate(
        with: .init(model: "gemini-vision", inputs: [
            .text(prompt),
            .imageData(imageData)
        ])
    ) { result in
        switch result {
        case .success(let response):
            print("AI:", response.text ?? "No response")
        case .failure(let error):
            print("Error:", error)
        }
    }
}
