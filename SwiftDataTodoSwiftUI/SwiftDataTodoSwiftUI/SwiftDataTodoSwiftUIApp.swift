//
//  SwiftDataTodoSwiftUIApp.swift
//  SwiftDataTodoSwiftUI
//
//  Created by Owner on 2023/07/30.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataTodoSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
