import Foundation
import Ignite

struct About: StaticPage {
    var title = "About"
    var layout: any Layout = MainLayout()

    var body: some HTML {
        Section {
            // About Section
            Section {
                Text("About Me")
                    .font(.title2)
                    .margin(.bottom, .medium)
                
                Text("I'm Mihaela, an iOS developer passionate about creating elegant and efficient solutions. With a background in software engineering and a keen interest in Apple technologies, I specialize in developing robust iOS applications.")
                    .margin(.bottom, .large)
            }
            .margin(.bottom, .xLarge)
            
            // Contact Section
            Section {
                Text("Contact")
                    .font(.title2)
                    .margin(.bottom, .medium)
                
                Text("Let's connect! You can reach me through:")
                    .margin(.bottom, .medium)
                
                List {
                    ListItem {
                        Link("GitHub", target: "https://github.com/mihaelamj")
                            .margin(.trailing, .small)
                        Text("for code samples and projects")
                    }
                    ListItem {
                        Link("LinkedIn", target: "https://www.linkedin.com/in/mihaelamj")
                            .margin(.trailing, .small)
                        Text("for professional networking")
                    }
                    ListItem {
                        Link("Email", target: "mailto:mihaelamj@gmail.com")
                            .margin(.trailing, .small)
                        Text("for direct communication")
                    }
                }
            }
        }
        .padding(.vertical, .xLarge)
    }
}
