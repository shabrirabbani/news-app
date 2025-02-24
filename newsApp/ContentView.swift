//
//  ContentView.swift
//  newsApp
//
//  Created by Shabri Rabbani on 27/06/24.
//

import SwiftUI

struct ContentViewProtocol: View {
    @ObservedObject var newsView: NewsView
    @State private var searchDate: Date = Date()

    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    DatePicker("Search by Date", selection: $searchDate, displayedComponents: .date)
                                       .padding()
                                   Button(action: {
                                       newsView.searchNews(by: searchDate)
                                   }) {
                                       Text("Search")
                                           .padding(5)
                                           .background(Color.blue)
                                           .foregroundColor(.white)
                                           .cornerRadius(8)
                                   }
                }
                List(newsView.articles, id: \.title) { article in
                    NavigationLink(destination: newsView.router?.navigateToDetail(with: article)) {
                        VStack(alignment: .leading) {
                            if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
                                                       AsyncImage(url: url) { phase in
                                                           switch phase {
                                                           case .empty:
                                                               ProgressView()
                                                           case .success(let image):
                                                               image
                                                                   .resizable()
                                                                   .aspectRatio(contentMode: .fit)
                                                           case .failure:
                                                               Image(systemName: "photo")
                                                                   .resizable()
                                                                   .aspectRatio(contentMode: .fit)
                                                                   .foregroundColor(.gray)
                                                           @unknown default:
                                                               Image(systemName: "photo")
                                                                   .resizable()
                                                                   .aspectRatio(contentMode: .fit)
                                                                   .foregroundColor(.gray)
                                                           }
                                                       }
                                                   } else {
                                                       Image(systemName: "photo")
                                                           .resizable()
                                                           .aspectRatio(contentMode: .fit)
                                                           .foregroundColor(.gray)
                                                   }
                            Text(article.title)
                                .font(.headline)
                            Text(article.description ?? "")
                                .font(.subheadline)
                        }
                    }
                }
            }

            .onAppear {
                newsView.onAppear()
            }
            
            .refreshable {
                searchDate = Date()
                newsView.onAppear()
            }
            .navigationBarTitle("News")
            
        }
    }
}

struct ContentViewProtocol_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewProtocol(newsView: NewsView())
    }
}

