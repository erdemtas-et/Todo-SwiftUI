import SwiftUI
import Combine

struct AddTodoView: View {
   
    @Environment(\.presentationMode) var presentationMode
    @State var todoModelList: TodoModelList
    @State var todoFromContentView: Todo?
    @State var titleString: String = ""
    @State var noteString: String = ""
    @State private var todoDate: Date = .now
    @State var todoColor: Color = .gray
    @State var isButtonActivated = false
    
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
        }
        .onAppear {
            if let todo = todoFromContentView {
                titleString = todo.title
                noteString = todo.note
                todoDate = todo.deadlineDate
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    if let todo = todoFromContentView {
                        let updatedTodo = Todo(title: titleString, note: noteString, deadlineDate: todoDate)
                        todoModelList.updateTodo(oldTodo: todo, newTodo: updatedTodo)
                    } else {
                        let newTodo = Todo(title: titleString, note: noteString, deadlineDate: todoDate)
                        todoModelList.addTodo(todo: newTodo)
                    }
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
