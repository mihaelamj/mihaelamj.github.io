import Foundation
import Ignite

struct NavBar: HTML {
    let name: String
    
    private var logo: any InlineElement {
        Span(name)
    }
    
    var body: some HTML {
        NavigationBar(logo: logo) {
            for item in Page.allCases {
                Link(item.rawValue, target: item.page)
                    .role(.primary)
            }
        }
        .navigationItemAlignment(.trailing)
        .position(.fixedTop)
    }
}
