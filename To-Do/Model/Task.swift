//
//  ToDo.swift
//  To-Do
//
//  Created by CCS038 on 01/02/26.
//

import Foundation
import SwiftUI

struct Task: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var priority: String
    
    var priorityColor: Color {
        switch priority {
        case "High": return .red.opacity(0.5)
        case "Low": return .green.opacity(0.5)
        case "Medium": return .orange.opacity(0.5)
        default: return .blue.opacity(0.5)
        }
    }
}
