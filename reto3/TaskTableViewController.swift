//
//  TaskTableViewController.swift
//  reto3
//
//  Created by Margaret Alexia Ancco Calloapaza on 2/12/22.
//

import UIKit

class TaskTableViewController: UITableViewController {
    @IBOutlet var taskTableView: UITableView!
    
    var taskList = [Task(isImportant: true, title: "Comer", description: "Comer mi almuerzo", deadLine: Date())]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.register(UITableViewCell.self, forCellReuseIdentifier: "taskCell")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskTableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = taskList[indexPath.row]
        var tintColor: UIColor
        switch(task.priorityColor){
            case .red:
                tintColor = .red
            case .yellow:
                tintColor = .yellow
            case .blue:
                tintColor = .blue
            case .green:
                tintColor = .green
        }
        cell.textLabel?.text = task.title
        let image = UIImage(systemName: "circle.fill")
        cell.imageView?.image = image
        cell.imageView?.tintColor = tintColor
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NewTaskViewController{
            destination.delegate = self
        }
    }
}

extension TaskTableViewController : NewTaskViewDelegate{
    func newTaskViewController(_ viewController: NewTaskViewController, didCreateTask newTask: Task) {
        taskList.append(newTask)
        taskTableView.reloadData()
    }
    func newTaskViewController(_ viewController: NewTaskViewController, didDeleteTask oldTask: Task) {
        for (index, value) in taskList.enumerated(){
            if oldTask == value{
                taskList.remove(at: index)
            }
        }
        
    }
}
