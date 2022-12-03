//
//  NewTaskViewController.swift
//  reto3
//
//  Created by Margaret Alexia Ancco Calloapaza on 2/12/22.
//

import UIKit
protocol NewTaskViewDelegate{
    func newTaskViewController(_ viewController: NewTaskViewController, didCreateTask newTask: Task)
    func newTaskViewController(_ viewController: NewTaskViewController, didDeleteTask oldTask: Task)
    
}

class NewTaskViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UITextField!
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var isImportantSegmentedControl: UISegmentedControl!
    var delegate: NewTaskViewDelegate!
    @IBOutlet weak var deadLineDatePicker: UIDatePicker!
    @IBAction func close(_ sender: Any) {
            dismiss(animated: true)
    }
    
    let alertaMessageWritten = UIAlertController(title: "Error", message: "Debe colocar un titulo", preferredStyle: .alert)
    let actionOk = UIAlertAction(title:"ok", style: .default){(_) in
    }
    
    @IBAction func addTask(_ sender: Any) {
        let deadLine = deadLineDatePicker.date
        let title = titleLabel.text
        let description = descriptionLabel.text
        let isImportant = isImportantSegmentedControl.selectedSegmentIndex == 0
        
        guard let t = title, !t.isEmpty else {
            alertaMessageWritten.addAction(actionOk)
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
        
        let task = Task(isImportant: isImportant, title: t, description: d, deadLine: deadLine)
        delegate?.newTaskViewController(self, didCreateTask: task)
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
