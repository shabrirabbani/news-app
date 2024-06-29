//
//  NewsRouter.swift
//  news-app
//
//  Created by Shabri Rabbani on 27/06/24.
//

import Foundation
import SwiftUI

class NewsRouter: RouterProtocol {
    static func createModule() -> some View {
        let view = NewsView()
        let interactor = NewsInteractor()
        let router = NewsRouter()
        let presenter = NewsPresenter(view: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        view.router = router

        return ContentView(newsView: view)
    }

    func navigateToDetail(with article: Article) -> DetailView {
        return DetailView(article: article)
    }
}

