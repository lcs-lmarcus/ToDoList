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
                    Label(
                        title: {
                            Text("Study for Chemistry quiz")
                        }, icon: {
                            Image(systemName: "circle")
                        }
                    )
                    Label(
                        title: {
                            Text("Finish Computer Science assignment")
                        }, icon: {
                            Image(systemName: "circle")
                        }
                    )
                    Label(
                        title: {
                            Text("Go for a run around campus")
                        }, icon: {
                            Image(systemName: "circle")
                        }
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

