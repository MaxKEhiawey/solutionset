//
//  ManageXMLData.swift
//  AgentApp
//
//  Created by AMALITECH MACBOOK on 31/07/2023.
//


import Foundation
import Combine
import SwiftUI

enum Errors: Error {
    case badUrl
    case parsingError
}

struct RSSItem {
    var title: String
    var link: String
    var pubDate: String
        // Add more properties as needed
}

class RSSParserDelegate: NSObject, XMLParserDelegate {
    var rssItems: [RSSItem] = []
    var currentElement: String = ""
    var currentTitle: String = ""
    var currentLink: String = ""
    var currentPubDate: String = ""

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName: String?, attributes attributeDict: [String: String] = [:]) {
        currentElement = elementName
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
            case "title":
                currentTitle = string
            case "link":
                currentLink = string
            case "pubDate":
                currentPubDate = string
            default:
                break
        }
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName: String?) {
        if elementName == "item" {
            let rssItem = RSSItem(title: currentTitle, link: currentLink, pubDate: currentPubDate)
            rssItems.append(rssItem)

            currentTitle = ""
            currentLink = ""
            currentPubDate = ""
        }
    }
}

class XMLNetwork {
    func fetchRSSData() -> AnyPublisher<[RSSItem], Error> {
        guard let url = URL(string: "https://www.who.int/rss-feeds/news-english.xml") else {
            return Fail(error: Errors.badUrl).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, _ in
                let parser = XMLParser(data: data)
                let delegate = RSSParserDelegate()
                parser.delegate = delegate

                if parser.parse() {
                        // Parsing succeeded
                    return delegate.rssItems
                } else {
                        // Parsing failed
                    throw Errors.parsingError
                }
            }
            .mapError { error -> Error in
                error
            }
            .eraseToAnyPublisher()
    }

}

class XMLDataViewModel: ObservableObject {

    @Published var rssItems: [RSSItem] = []
    let network = XMLNetwork()

    init (){
        fetchRSSData()
    }
    private func fetchRSSData() {
        network.fetchRSSData()
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Error fetching RSS data: \(error)")
                }
            }, receiveValue: { rssItems in
                DispatchQueue.main.async {
                    self.rssItems = rssItems
                }

            })
            .store(in: &cancellables)
    }

    private var cancellables = Set<AnyCancellable>()

}

struct RSSListPage: View {
    @ObservedObject var vm = XMLDataViewModel()
    var body: some View {
        NavigationView {
            List(vm.rssItems, id: \.title) { rssItem in
                NavigationLink(destination: RSSDetailPage(rssItem: rssItem)) {
                    VStack(alignment: .leading) {
                        Text(rssItem.title)
                            .font(.headline)
                        Text(rssItem.pubDate)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("RSS Feeds")

        }
    }


}

struct RSSDetailPage: View {
    let rssItem: RSSItem
    @State var frame: CGFloat = 240
    var body: some View {
        VStack {
            Text(rssItem.title)
                .font(.title)
                .padding()
            Text(rssItem.pubDate)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding()

            VStack {
                if let url = URL(string:rssItem.link) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .frame(height: frame) // Adjust the width and height as needed
                    } placeholder: {
                        ProgressView(value: 0.10)
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.0) // Adjust the scale factor as needed
                            .padding()
                    }
                } else {
                    ProgressView(value: 0.10)
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.0) // Adjust the scale factor as needed
                        .padding()
                
                }
            }
            .padding(.all, 4)
                // Add more details if needed
            Spacer()
        }
        .navigationTitle("RSS Detail")
    }
}
