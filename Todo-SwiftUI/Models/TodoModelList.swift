//
//  TodoList.swift
//  Todo-SwiftUI
//
//  Created by Erdem Tas on 2.05.2023.
//

import Foundation


class TodoModelList : ObservableObject {
   @Published var todos : [Todo] = []
    
    func addTodo(todo: Todo) {
        todos.append(Todo(title: todo.title, note: todo.note))
    }
    
}
