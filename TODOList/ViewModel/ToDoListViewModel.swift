import Foundation

class ToDoListViewModel: ObservableObject {
    @Published var todos: [ToDoItem] = []
    private let storage = ToDoStorage()
    
    init() {
        todos = storage.load()
    }
    
    func addTodo(title: String) {
        guard !title.isEmpty else { return }
        todos.append(ToDoItem(title: title))
        save()
    }
    
    func toggleTodo(_ todo: ToDoItem) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isCompleted.toggle()
            save()
        }
    }
    
    func delete(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
        save()
    }
    
    private func save() {
        storage.save(todos)
    }
}
