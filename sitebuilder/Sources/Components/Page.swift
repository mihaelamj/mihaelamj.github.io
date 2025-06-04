import Foundation
import Ignite

enum Page: String, CaseIterable {
    case home = "Home"
    case about = "About"
    case cv = "CV"
    
    @MainActor
    var page: any StaticPage {
        switch self {
        case .home: return Home()
        case .about: return About()
        case .cv: return CVPage()
        }
    }
    
    @MainActor
    static var all: [any StaticPage] {
        Self.allCases.map { $0.page }
    }
}

