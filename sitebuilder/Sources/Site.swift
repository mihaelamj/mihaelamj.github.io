import Foundation
import Ignite
import CVBuilder

@main
struct IgniteWebsite {
    static func main() async {
        var site = AleahimSite()

        do {
            // Generate the CV Markdown before publishing the site
            generateMihaelasCVMarkdownInContentFolder()
            let output = "../docs"
            try await site.publish(buildDirectoryPath: output)
            // Copy static files after build
            try copyStaticFiles(to: output)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension IgniteWebsite {
    static func copyStaticFiles(to outputPath: String) throws {
        print("📄 Copying static files to \(outputPath)...")
        
        let fileManager = FileManager.default
        
        // Define files to copy (source -> destination filename)
        let filesToCopy = [
            "../mihaela-cv.pdf": "mihaela-cv.pdf"
            // Add more files here as needed:
            // "../resume.pdf": "resume.pdf",
            // "../portfolio.pdf": "portfolio.pdf"
        ]
        
        for (sourcePath, destinationFilename) in filesToCopy {
            let destinationPath = "\(outputPath)/\(destinationFilename)"
            
            // Check if source file exists
            guard fileManager.fileExists(atPath: sourcePath) else {
                print("⚠️  Source file not found: \(sourcePath)")
                continue
            }
            
            // Remove destination file if it exists (in case of overwrite)
            if fileManager.fileExists(atPath: destinationPath) {
                try fileManager.removeItem(atPath: destinationPath)
            }
            
            // Copy the file
            try fileManager.copyItem(atPath: sourcePath, toPath: destinationPath)
            print("✅ Copied \(sourcePath) → \(destinationPath)")
        }
    }
}

struct AleahimSite: Site {
    let mmcv = CV.createForMihaela()
    
    var name = "Aleahim.com"
    var titleSuffix = " – Mihaela's Site"
    var url = URL(static: "https://www.aleahim.com")
    var builtInIconsEnabled = true
    
    var syntaxHighlighterConfiguration: SyntaxHighlighterConfiguration = .init(languages: [.swift, .python, .ruby])
    
    // Add feed configuration for blog posts
    var feedConfiguration = FeedConfiguration(
        mode: .full,
        contentCount: 20,
        image: .init(url: "https://www.aleahim.com/images/icon32.png", width: 32, height: 32)
    )
    
    var author = "Mihaela Mihaljevic"

    var homePage = Home()
    var layout = MainLayout()
    
    var staticPages: [any StaticPage] {
        print("Pages:", Page.all.count)
        return Page.all
    }
    
    // Add article pages for Markdown content
    var articlePages: [any ArticlePage] {
        CoreAnimation3DCube()
        CVBuilder()
    }
}

