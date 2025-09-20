import Foundation

class ToDoStorage {
    private let key = "todos_key"

    func save(_ todos: [ToDoItem]) {
        if let data = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    func load() -> [ToDoItem] {
        if let data = UserDefaults.standard.data(forKey: key),
           let todos = try? JSONDecoder().decode([ToDoItem].self, from: data) {
            return todos
        }
        return []
    }
}
