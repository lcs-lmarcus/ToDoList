//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Marcus Li on 2025-01-28.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            LandingView()
                .modelContainer(for: TodoItem.self)
        }
    }
}
