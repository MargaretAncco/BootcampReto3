//
//  Task.swift
//  reto3
//
//  Created by Margaret Alexia Ancco Calloapaza on 2/12/22.
//

import Foundation

enum TaskPriorityColor {
    case red
    case yellow
    case blue
    case green
}

class Task{
    var isImportant: Bool = false
    var isUrgent: Bool {
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: Date())
        let date2 = calendar.startOfDay(for: deadLine)
        if let daysBeforeCount = calendar.dateComponents([.day], from: date1, to: date2).day{
            return daysBeforeCount <= 3
        }
        return false
    }
    var title: String
    var description: String
    var deadLine: Date
    var priorityColor: TaskPriorityColor {
        if isImportant && isUrgent{
            return .red
        }else if isImportant && !isUrgent{
            return .yellow
        }else if !isImportant && isUrgent{
            return .blue
        }
        return .green
    }
    init(isImportant: Bool, title: String, description: String, deadLine: Date) {
        self.isImportant = isImportant
        self.title = title
        self.description = description
        self.deadLine = deadLine
    }
    
    
}
