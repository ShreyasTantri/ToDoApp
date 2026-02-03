//
//  ToDo.swift
//  To-Do
//
//  Created by CCS038 on 01/02/26.
//

import Foundation

struct Task: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var priority: String
}
