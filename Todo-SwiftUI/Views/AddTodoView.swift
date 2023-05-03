//
//  AddTodoView.swift
//  Todo-SwiftUI
//
//  Created by Erdem Tas on 3.05.2023.
//

import SwiftUI
import Combine

struct AddTodoView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var todoModelList : TodoModelList
    @State var titleString : String = ""
    @State var noteString : String = ""
    @State private var todoDate : Date = .now
    @State var todoColor : Color = .gray
    @State var isButtonActivated  = false
    @State var path = [String]()
    
    func validateFields() {
        if titleString != "" && noteString != "" {
            isButtonActivated = true
        } else {
            isButtonActivated = false
        }
    }
    
    var body: some View {
        
        Form {
            Section {
                VStack(alignment: .leading) {
                    Text("Title")
                        .foregroundColor(.black)
                        .font(.caption)
                    TextField("Title", text: $titleString)
                        .onReceive(Just(titleString)) { newValue in
                        validateFields()
                    }
                }.padding(.vertical,4.0)
                
                VStack(alignment: .leading) {
                    Text("Note")
                        .foregroundColor(.black)
                        .font(.caption)
                    TextField("Note", text: $noteString)
                }.padding(.vertical,4.0)
            }
            
            Section {
                HStack{
                    DatePicker("Deadline", selection: $todoDate,in:.now...)
                        .datePickerStyle(.graphical)
                        .frame(width: 320)
                }
            }

            Section {
                VStack {
                    HStack {
                        Text("Choose a color:")
                        Circle()
                            .fill(todoColor)
                            .frame(width: 30, height: 30, alignment: .center)
                    }
                           
                        
                           LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                               ForEach(Color.colorArray, id: \.self) { color in
                                   Button(action: {
                                       todoColor = color
                                   }, label: {
                                       Circle()
                                           .fill(color)
                                   })
                                   .buttonStyle(.borderless)
                               }
                           }
                       }
                }
        }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        todoModelList.addTodo(todo: Todo(title: titleString, note: noteString, deadlineDate: todoDate))
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .bottom)
                            .foregroundColor(isButtonActivated ? .green : .gray)
                    }.disabled(!isButtonActivated)
                }
            }
            
        
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView(todoModelList: TodoModelList())
    }
}
