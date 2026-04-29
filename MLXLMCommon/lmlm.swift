import MLXVLM
import MLXLMCommon
import UIKit

func sendLocalImagePrompt(image: UIImage, prompt: String) async {
    do {
        // 1. Load a vision model from the MLX registry (e.g., a 4-bit quantized Llama)
        let container = try await VLMModelFactory.shared.loadContainer(
            modelName: "mlx-community/Llama-3.2-11B-Vision-Instruct-4bit"
        )

        // 2. Convert your image for the model
        guard let ciImage = CIImage(image: image) else { return }
        let input = UserInput(prompt: prompt, images: [.ciImage(ciImage)])

        // 3. Perform local inference
        let result = try await container.perform { context in
            let preparedInput = try await context.processor.prepare(input: input)
            return try MLXLMCommon.generate(input: preparedInput, parameters: .init(), context: context) { tokens in
                // This will print the response as it is being generated (streaming)
                print(context.tokenizer.decode(tokens: tokens))
                return .more
            }
        }
    } catch {
        print("Local model error: \(error)")
    }
}
