//
//  Protocols.swift
//  news-app
//
//  Created by Shabri Rabbani on 27/06/24.
//

import Foundation
import SwiftUI

protocol ViewProtocol: AnyObject {
    func showArticles(_ articles: [Article])
    func searchNews(by date: Date)
}

protocol InteractorProtocol: AnyObject {
    func fetchNews()
    func searchNews(by date: Date, completion: @escaping ([Article]) -> Void)
}

protocol PresenterProtocol: AnyObject {
    func viewDidLoad()
    func searchNews(by date: Date)
}

protocol RouterProtocol: AnyObject {
    func navigateToDetail(with article: Article) -> DetailView
}
