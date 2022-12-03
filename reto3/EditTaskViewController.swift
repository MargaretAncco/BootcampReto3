//
//  EditTaskViewController.swift
//  reto3
//
//  Created by Margaret Alexia Ancco Calloapaza on 2/12/22.
//

import UIKit

protocol EditTaskViewDelegate{
    func editTaskViewDelegate(_ viewController: EditTaskViewController, didEditTask editedTask: Task)
    func editTaskViewDelegate(_ viewController: EditTaskViewController, didDeleteTask deletedTask: Task)
}

class EditTaskViewController: UIViewController {
    var task:Task!
    var delegate: EditTaskViewDelegate!
    let alertaMessageWritten = UIAlertController(title: "Error", message: "Debe colocar un titulo", preferredStyle: .alert)
    let actionOk = UIAlertAction(title:"ok", style: .default){(_) in
    }

    @IBAction func saveEditedTask(_ sender: Any) {
        let deadLine = deadLineDatePicker.date
        let title = titleTextField.text
        let description = descriotionTextField.text
        let isImportant = isImportantSegmentedControl.selectedSegmentIndex == 0
        
        guard let t = title, !t.isEmpty else {
            alertaMessageWritten.message = "Debe colocar un titulo"
            alertaMessageWritten.addAction(actionOk)
            present(alertaMessageWritten, animated: true, completion: nil)
            
            return
            
        }
        guard let d = description, !d.isEmpty else {
            alertaMessageWritten.message = "Debe colocar una descripcion"
            alertaMessageWritten.addAction(actionOk)
            present(alertaMessageWritten, animated: true, completion: nil)
            return
            
        }
        let editedTask = Task(isImportant: isImportant, title: t, description: d, deadLine: deadLine)
        editedTask.id = task.id
        delegate.editTaskViewDelegate(self, didEditTask: editedTask)
        dismiss(animated: true)
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isImportantSegmentedControl: UISegmentedControl!
    @IBOutlet weak var deadLineDatePicker: UIDatePicker!
    @IBOutlet weak var descriotionTextField: UITextField!
    
    @IBAction func deleteTask(_ sender: Any) {
        delegate.editTaskViewDelegate(self, didDeleteTask: task)
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = task.title
        descriotionTextField.text = task.description
        let index = task.isImportant ? 0 : 1
        isImportantSegmentedControl.selectedSegmentIndex = index
        deadLineDatePicker.date = task.deadLine
        deadLineDatePicker.minimumDate = Date()
        print (task.title)
        print (task.description)
        print (task.deadLine)
        print ("importante\(task.isImportant)")
        print ("urgente \(task.isUrgent)")

    }

}
