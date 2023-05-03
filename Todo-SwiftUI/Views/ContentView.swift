//
//  ContentView.swift
//  Todo-SwiftUI
//
//  Created by Erdem Tas on 2.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var todoModelList = TodoModelList()
    
    var body: some View {
        NavigationView {
            VStack {
                List(todoModelList.todos) { (todo) in
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
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
