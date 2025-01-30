//
//  ContentView.swift
//  ToDoList
//
//  Created by Marcus Li on 2025-01-28.
//

import SwiftUI

struct LandingView: View {
    
    @State var newItemDescription: String = ""
    @State var searchText = ""
    @State var todos: [TodoItem] = exampleItem
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            VStack {
                List ($todos) { $todo in
                    ItemView(currentItem: $todo)
                        .swipeActions {
                            Button (
                                "Delete",
                                role: .destructive,
                                action: {
                                    delete(todo)
                                }
                            )
                        }
                }
                .searchable(text: $searchText)
                
                HStack {
                    TextField("Enter a to-do list item", text: $newItemDescription)
                    Button("Add") {
                        createToDo(withTitle: newItemDescription)
                    }
                    .font(.caption)
                    .disabled(newItemDescription.isEmpty == true)
                }
                .padding(20)
            }
            .navigationTitle("To Do")
        }
    }
    
    // MARK: Function
    func createToDo(withTitle title: String) {
        let todo = TodoItem (
            title: title,
            done: false
        )
        
        todos.append(todo)
    }
    
    func delete(_ todo: TodoItem) {
        todos.removeAll { currentItem in
            currentItem.id == todo.id
        }
    }
}

//#Preview {
//    LandingView()
//}




