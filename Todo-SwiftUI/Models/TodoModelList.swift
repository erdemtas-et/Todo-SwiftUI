//
//  TodoList.swift
//  Todo-SwiftUI
//
//  Created by Erdem Tas on 2.05.2023.
//

import Foundation


class TodoModelList : ObservableObject {
    @Published var todos : [Todo] = [] {
        didSet {
            saveTodos()
        }
    }
    
    init() {
        getTodos()
    }
    
    func addTodo(todo: Todo) {
        todos.append(Todo(title: todo.title, note: todo.note,deadlineDate: todo.deadlineDate))
    }
    
    func deleteTodo(index: IndexSet) {
        todos.remove(atOffsets: index)
    }
    
    func saveTodos() {
        do {
        try UserDefaults.standard.set(JSONEncoder().encode(todos), forKey: "todosUD")
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func getTodos() {
        guard let savedTodosUD = UserDefaults.standard.data(forKey: "todosUD") else {return}
        guard let savedTodosList = try? JSONDecoder().decode([Todo].self, from: savedTodosUD) else {return}

        self.todos = savedTodosList
        
       
    }
    
}
