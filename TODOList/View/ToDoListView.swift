import SwiftUI

struct ToDoListView: View {
    @StateObject private var viewModel = ToDoListViewModel()
    @State private var showingAddToDo = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.todos) { todo in
                    HStack {
                        Button(action: {
                            viewModel.toggleTodo(todo)
                        }) {
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(todo.isCompleted ? .green : .gray)
                        }
                        .buttonStyle(PlainButtonStyle())

                        Text(todo.title)
                            .strikethrough(todo.isCompleted)
                            .onTapGesture {
                                viewModel.toggleTodo(todo)
                            }
                    }
                }
                .onDelete(perform: viewModel.delete)
            }
            .navigationTitle("ToDo List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddToDo = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddToDo) {
                AddToDoView { newTitle in
                    viewModel.addTodo(title: newTitle)
                }
            }
        }
    }
}

#Preview {
    ToDoListView()
}
