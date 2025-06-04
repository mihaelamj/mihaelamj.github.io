import Foundation
import Ignite
import CVBuilder
import CVBuilderIgnite

struct CVPage: StaticPage {
    var title = "CV"
    var layout: any Layout = MainLayout()

    var body: some HTML {
        Section {
            Text("Mihaela's CV")
                .font(.title1)
            
            Link("Download PDF Version", target: "/mihaela-cv.pdf")
                .margin(.bottom, .large)
                .attribute("download", "mihaela-cv.pdf")
            
            IgniteRenderer(cv: CV.createForMihaela()).body
                .padding()
            
            Link("Download PDF Version", target: "/mihaela-cv.pdf")
                .margin(.bottom, .large)
                .attribute("download", "mihaela-cv.pdf")
        }
    }
}
