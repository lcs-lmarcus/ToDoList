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
    
    var body: some View {
        NavigationView {
            VStack {
                List (todos) { todo in
                    ItemView (currentItem: firstItem)
                    ItemView (currentItem: secondItem)
                    ItemView (currentItem: thirdItem)
                    ItemView(currentItem: todo)
                }
                .searchable(text: $searchText)
                
                HStack {
                    TextField("Enter a to-do list item", text: $newItemDescription)
                    Button("Add") {
                        
                    }
                    .font(.caption)
                }
                .padding(20)
            }
            .navigationTitle("To Do")
        }
    }
}

#Preview {
    LandingView()
}



