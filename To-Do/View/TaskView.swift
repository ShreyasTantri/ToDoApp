//
//  TaskView.swift
//  To-Do
//
//  Created by CCS038 on 01/02/26.
//

import SwiftUI

struct TaskView: View {
    @State var viewModel: TaskViewModel
    @State private var isShowingSheet = false
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(viewModel.tasks) { task in
                    HStack {
                        Text(task.title)
                        Spacer()
                        Text(task.priority)
                            .font(.caption)
                            .padding(6)
                            .background(task.priorityColor)
                            .clipShape(Capsule())
                    }
                }
                .onDelete() { indexSet in
                    viewModel.deleteTask(at: indexSet)
                }
                .onMove() { indices, newOffset in
                    viewModel.moveTask(from: indices, to: newOffset)
                }
            }
            .onAppear() {
                viewModel.loadTasks()
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isShowingSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            }
            .sheet(isPresented: $isShowingSheet) {
                AddTaskView { newTask in
                    viewModel.tasks.append(newTask)
                }
            }
        }
        
    }
}

#Preview {
    TaskView(viewModel: TaskViewModel())
}
