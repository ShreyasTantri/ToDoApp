//
//  AddTaskView.swift
//  To-Do
//
//  Created by CCS038 on 03/02/26.
//

import SwiftUI

struct AddTaskView: View {
    @State private var title = ""
    @State private var priority = "Medium"

    @Environment(\.dismiss) var dismiss

    let priorities = ["High", "Medium", "Low"]
    var onAdd: (Task) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Task Title", text: $title)
                
                Picker("Priority", selection: $priority) {
                    ForEach(priorities, id: \.self) { p in
                        Text(p)
                    }
                    .pickerStyle(.navigationLink)
                }
            }
        }
        .navigationTitle("Add Task")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    let newTask = Task(title: title, priority: priority)
                    onAdd(newTask)
                    dismiss()
                }
                .disabled(title.isEmpty)
            }
        }
    }
}

#Preview {
    // We give the preview a "fake" function that does nothing
    // just so it stays happy and renders the screen.
    AddTaskView { newTask in
        print("Preview added: \(newTask.title)")
    }
}
