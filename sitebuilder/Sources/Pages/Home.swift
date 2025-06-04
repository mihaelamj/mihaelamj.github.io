import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Mihaela's Blog"
    var layout: any Layout = MainLayout()
    @Environment(\.articles) private var articles

    var body: some HTML {
        Text("Mihaela's Apple Dev Blog")
            .font(.title1)
        
        List {
            ForEach(articles.sortedByDate) { article in
                Section {
                    BlogCard(article: article)
                }
            }
        }
    }
}
