import FirebaseAILogic

func sendGemini3Prompt(image: UIImage, prompt: String) async {
    // 1. Initialize with the Gemini 3 Pro model
    let ai = FirebaseAI.firebaseAI(backend: .googleAI())
    let model = ai.generativeModel(modelName: "gemini-3.1-pro-preview")
    
    guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
    
    do {
        // 2. Generate content using multimodal inputs
        let response = try await model.generateContent(prompt, imageData)
        print("Gemini 3:", response.text ?? "No response")
    } catch {
        print("Error: \(error)")
    }
}
