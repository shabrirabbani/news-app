//
//  DetailView.swift
//  news-app
//
//  Created by Shabri Rabbani on 27/06/24.
//

import SwiftUI

struct DetailView: View {
    let article: Article

    var body: some View {
        VStack(alignment: .leading) {
            Text(article.title)
                .font(.largeTitle)
                .padding(.bottom, 10)
            
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
            
            if let description = article.description {
                Text(description)
                    .font(.body)
                    .padding(.bottom, 10)
            }

            if let url = URL(string: article.url) {
                Link("Read more", destination: url)
                    .padding(.top, 10)
            }
        }
        .padding()
        .navigationBarTitle(Text("Detail"), displayMode: .inline)
    }
}
