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

extension Date{
    func daysBetween(date: Date) -> Int {
        return Date.daysBetween(start: self, end: date)
    }
    
    static func daysBetween(start: Date, end: Date) -> Int {
        let calendar = Calendar.current
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: start)
        let date2 = calendar.startOfDay(for: end)
        
        let a = calendar.dateComponents([.day], from: date1, to: date2)
        return a.value(for: .day)!
    }
}
class Task{
    var id: String = UUID().uuidString
    var isImportant: Bool = false
    var isUrgent: Bool {
        return Date().daysBetween(date: deadLine) <= 3
    }
    var title: String
    var description: String
    var deadLine: Date
    var priorityColor: TaskPriorityColor {
        if isImportant && isUrgent{
            return .red
        }else if !isImportant && isUrgent{
            return .yellow
        }else if isImportant && !isUrgent{
            return .blue
        }
        return .green
    }
    init(isImportant: Bool, title: String, description: String, deadLine: Date) {
        self.id = UUID().uuidString
        self.isImportant = isImportant
        self.title = title
        self.description = description
        self.deadLine = deadLine
    }
    
}
extension Task: Equatable{
    static func == (lhs: Task, rhs: Task) -> Bool {
        lhs.title == rhs.title && lhs.description == rhs.description
    }
    
    
}
