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
}

protocol InteractorProtocol: AnyObject {
    func fetchNews()
}

protocol PresenterProtocol: AnyObject {
    func viewDidLoad()
}

protocol RouterProtocol: AnyObject {
    func navigateToDetail(with article: Article) -> DetailView
}
