import Foundation
import CVBuilder
import Ignite

func generateMihaelasCVMarkdownInContentFolder() {
    let cv = CV.createForMihaela()
    let markdown = MarkdownCVRenderer().render(cv: cv)

    let fileURL = URL(fileURLWithPath: "Assets/mihaela-cv.md")

    do {
        try markdown.write(to: fileURL, atomically: true, encoding: .utf8)
        print("✅ Written to \(fileURL.path)")
    } catch {
        print("❌ Failed to write Mihaela's CV: \(error.localizedDescription)")
    }
}

