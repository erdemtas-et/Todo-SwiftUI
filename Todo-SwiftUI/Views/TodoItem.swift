//
//  TodoItem.swift
//  Todo-SwiftUI
//
//  Created by Erdem Tas on 2.05.2023.
//

import SwiftUI

struct TodoItem: View {
    
   @ObservedObject var todo : Todo
    @State var todoList: TodoModelList
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    todoList.toggleTodo(todo: todo)
                } label: {
                    Image(systemName : todo.imageName)
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .leading)
                        .foregroundColor(todo.isCompleted ? .green  :.pink)
                }.buttonStyle(BorderlessButtonStyle())

                
                HStack {
                    VStack(alignment: .leading) {
                        Text(todo.title)
                            .font(.system(.callout))
                            .fontWeight(.bold)
                            .strikethrough(todo.isCompleted)
                            .padding(.bottom,3.0)
                        Text(todo.note)
                            .font(.caption)
                            .strikethrough(todo.isCompleted)
                    }
                    Spacer()
                    VStack{
                        Text( todo.deadlineDate.formatDateTime())
                            .font(.caption)
 
                    }.padding(.all,10.0)
                    
                }
            }
        }
    }
}

struct TodoItem_Previews: PreviewProvider {
    static var previews: some View {
        TodoItem(todo: Todo(title: "Title Example", note: "Note Example",deadlineDate: Date.now),todoList: TodoModelList())
    }
}
