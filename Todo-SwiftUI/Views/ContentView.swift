//
//  ContentView.swift
//  Todo-SwiftUI
//
//  Created by Erdem Tas on 2.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var todoModelList = TodoModelList()
    @State var searchText = ""
    
    var searchResults: [Todo] {
           if searchText.isEmpty {
               return todoModelList.todos
           } else {
               return todoModelList.todos.filter { $0.title.contains(searchText) }
           }
       }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(searchResults) { (todo) in
                    NavigationLink(destination: Text(todo.title)) {
                        TodoItem(todo: todo)
                    }
                }
                .navigationTitle("Todos")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination:  AddTodoView(todoModelList: todoModelList),
                        label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25, alignment: .bottom)
                                .foregroundColor(.orange)
                        }
                    )}
                }
            }
        }.searchable(text: $searchText,prompt: "Search")
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
