//
//  NewsInteractor.swift
//  news-app
//
//  Created by Shabri Rabbani on 27/06/24.
//

import Foundation

class NewsInteractor: InteractorProtocol {
    var presenter: NewsPresenter?

    func fetchNews() {
        let url = "https://newsapi.org/v2/everything?q=keyword&apiKey=5c00e8ac603947aba808a81c74ecb736"
        
        guard let requestUrl = URL(string: url) else { return }

        URLSession.shared.dataTask(with: requestUrl) { data, response, error in
            if let data = data {
                do {
                    let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                    self.presenter?.didFetchNews(articles: newsResponse.articles)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func searchNews(by date: Date, completion: @escaping ([Article]) -> Void) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let dateString = dateFormatter.string(from: date)
        let apiKey = "5c00e8ac603947aba808a81c74ecb736"
        let url = "https://newsapi.org/v2/everything?q=keyword&from=\(dateString)&apiKey=\(apiKey)"
        
        guard let requestUrl = URL(string: url) else { return }

        URLSession.shared.dataTask(with: requestUrl) { data, response, error in
            if let data = data {
                do {
                    let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                    self.presenter?.didFetchNews(articles: newsResponse.articles)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    
}

