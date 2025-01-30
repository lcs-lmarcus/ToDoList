//
//  TodoItem.swift
//  ToDoList
//
//  Created by Marcus Li on 2025-01-28.
//

import SwiftData

@Model
struct TodoItem: Identifiable {
    var title:  String
    var done: Bool
    
    init(title: String, done: Bool) {
        self.title = title
        self.done = done
    }
}

let firstItem = TodoItem(title: "Study for Chemistry quiz", done: false)
let secondItem = TodoItem(title: "Finish Computer Science assignment", done: true)
let thirdItem = TodoItem(title: "Go for a run around campus", done: false)

let exampleItem = [
    firstItem,
    secondItem,
    thirdItem
]
