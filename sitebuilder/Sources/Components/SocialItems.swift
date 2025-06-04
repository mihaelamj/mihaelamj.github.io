import Foundation
import Ignite

public struct SocialFooter: HTML {
    let icons = [
        Image(systemName: "github"),
        Image(systemName: "linkedin"),
    ]

    let urlStrings = [
        "https://github.com/mihaelamj",
        "https://www.linkedin.com/in/mihaelamj/"
    ]

    public var body: some HTML {
        VStack {
            HStack {
                ForEach(zip(icons, urlStrings)) { (icon, urlString) in
                    Link(icon, target: urlString)
                        .role(.secondary)
                        .target(.blank)
                        .relationship(.noOpener, .noReferrer)
                }
            }
        }
        .margin(.top, .xLarge)
        .font(.title2)
    }
}
