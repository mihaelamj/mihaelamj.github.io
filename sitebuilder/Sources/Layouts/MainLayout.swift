import Foundation
import Ignite

struct MainLayout: Layout {
    
    var body: some Document {
        Body {
            NavBar(name: "Aleahim")
                .padding(.bottom, 80)
            
            content
            
            Section {
                SocialFooter()
                    .margin(.bottom, 80)
            }
        }
    }
}

