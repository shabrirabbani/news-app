//
//  NewsPresenter.swift
//  news-app
//
//  Created by Shabri Rabbani on 27/06/24.
//

import Foundation

class NewsPresenter: PresenterProtocol {
    weak var view: ViewProtocol?
    var interactor: InteractorProtocol
    var router: RouterProtocol

    init(view: ViewProtocol, interactor: InteractorProtocol, router: RouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        interactor.fetchNews()
    }

    func didFetchNews(articles: [Article]) {
        DispatchQueue.main.async {
            self.view?.showArticles(articles)
        }
    }
    
    func searchNews(by date: Date) {
        print("Searching news by date:", date)
            interactor.searchNews(by: date) { articles in
                DispatchQueue.main.async {
                    self.view?.showArticles(articles)
                }
            }
        }
}

