//
//  TaskViewModel.swift
//  To-Do
//
//  Created by CCS038 on 01/02/26.
//

import Foundation

@Observable
class TaskViewModel {
    let tasksKey = "saved_tasks"
    
    var tasks: [Task] = [] {
        didSet {
            saveTasks()
        }
    }
    
    func saveTasks() {
        guard let encodedData = try? JSONEncoder().encode(tasks) else {
            return
        }
        UserDefaults.standard.set(encodedData, forKey: tasksKey)
    }
    
    func loadTasks() {
        guard let data = UserDefaults.standard.data(forKey: tasksKey) else {
            return
        }
        guard let decodedData = try? JSONDecoder().decode([Task].self, from: data) else {
            return
        }
        tasks = decodedData
    }
}
