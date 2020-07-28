//
//  CompleteToDoViewController.swift
//  ToDoList
//
//  Created by Linda Weng on 7/27/20.
//  Copyright © 2020 Linda Weng. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    var selectedToDo: ToDoCD?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var importanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = selectedToDo?.name
        if let important = selectedToDo?.important {
            if important {
                importanceLabel.text! = "Importance: ❗️"
            } else {
                importanceLabel.text = ""
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func completeTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theToDo = selectedToDo {
              context.delete(theToDo)
              navigationController?.popViewController(animated: true)
            }
        }
    }
    
}
