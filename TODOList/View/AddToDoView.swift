import SwiftUI

struct AddToDoView: View {
    @Environment(\.dismiss) var dismiss
    @State private var newToDoTitle: String = ""

    var onAdd: (String) -> Void

    var body: some View {
        NavigationView {
            Form {
                TextField("Add ToDo", text: $newToDoTitle)
            }
            .navigationTitle("Add New ToDo")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        onAdd(newToDoTitle)
                        dismiss()
                    }
                }
            }
        }
    }
}
