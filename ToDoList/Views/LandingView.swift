//
//  ContentView.swift
//  ToDoList
//
//  Created by Marcus Li on 2025-01-28.
//

import SwiftUI
import SwiftData

struct LandingView: View {
    // MARK: Stored Properties
    // item currently being added
    @State var newItemDescription =  ""
    // the search text
    @State var searchText = ""
    // Access model context
    @Environment(\.modelContext) var modelContext
    // List of To do Item
    @Query var todos: [TodoItem]
    
    
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(todos) { todo in
                        
                        ItemView(currentItem: todo)
                 
                    }
                    .onDelete(perform: removeRows)
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
            .onAppear{
                printCommandToOpenDatabaseFile()
            }
        }
    }
    
    // MARK: Function
    func createToDo(withTitle title: String) {
        let todo = TodoItem (
            title: title,
            done: false
        )
        
        // Use the model context to insert the new to-do
        modelContext.insert(todo)

    }
    
    func removeRows(at offsets: IndexSet) {
        
        // Accept the offset within the list
        // (the position of the item being deleted)
        //
        // Then ask the model context to delete this
        // for us, from the 'todos' array
        for offset in offsets {
            modelContext.delete(todos[offset])
        }
    }
}

#Preview {
    LandingView()
        .modelContainer(TodoItem.preview)
}




