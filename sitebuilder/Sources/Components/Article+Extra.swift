import Foundation
import Ignite

extension ArticleLoader {
    public var sortedByDate: [Article] {
        all.sorted { $0.date > $1.date }
    }
}

struct BlogCard: HTML {

    var article: Article

    var body: some HTML {
        ZStack(alignment: .bottom) {
            if let image = article.image {
                Image(image)
                    .imageFit(.fit, anchor: .top)
                    .frame(height: 320)
                    .frame(maxWidth: .percent(100%))
                    .opacity(0.8)
            }
            VStack(spacing: 6) {
                Text(article.date.formatted(date: .abbreviated, time: .omitted))
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
                Link(article.title, target: article.path)
                    .role(.primary)
                    .font(.title3)
                    .fontWeight(.bold)
                if let subtitle = article.subtitle {
                    Text(subtitle)
                }
            }
            .lineSpacing(1.2)
            .padding(.horizontal, .medium)
            .padding(.vertical, .small)
            .background(.regularMaterial)
            .frame(maxWidth: .percent(100%))
        }
        .frame(width: 480)
        .clipped()
        .cornerRadius(15)
        .margin(.bottom, .medium)
    }
}



