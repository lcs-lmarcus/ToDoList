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
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ItemView(
                        title: "Study for Chemistry quiz",
                        done: false
                    )
                    ItemView(
                        title: "Finish Computer Science assignment",
                        done: true
                    )
                    ItemView(
                        title: "Go for a run around campus",
                        done: false
                    )
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


struct ItemView: View {
    
    let title: String
    let done: Bool
    
    var body: some View {
        Label(
            title: {
                Text(title)
            }, icon: {
                if done == true {
                    Image(systemName: "checkmark.circle")
                } else {
                    Image(systemName: "circle")
                }
                
            }
        )
    }
}
