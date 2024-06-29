//
//  newsAppApp.swift
//  newsApp
//
//  Created by Shabri Rabbani on 27/06/24.
//

import SwiftUI

@main
struct MyNewsAppApp: App {
    var body: some Scene {
        WindowGroup {
            let newsRouter = NewsRouter.createModule()
            newsRouter
        }
    }
}
