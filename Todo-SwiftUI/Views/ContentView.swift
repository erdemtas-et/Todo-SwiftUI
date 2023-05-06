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
                List {
                    ForEach(searchResults) { (todo) in
                        NavigationLink(destination: AddTodoView( todoModelList: todoModelList,todoFromContentView: todo)) {
                            TodoItem(todo: todo)
                        }
                    }.onDelete(perform: todoModelList.deleteTodo)
                }
                
                .navigationTitle("Todos")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination:  AddTodoView(todoModelList: todoModelList),
                                       label: {
                                           Image(systemName: "plus.circle")
                                               .resizable()
                                               .frame(width: 30, height: 30, alignment: .bottom)
                                               .foregroundColor(.blue)
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
