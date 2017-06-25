//
//  AddTaskViewController.swift
//  CoreData_Sample
//
//  Created by 坂本のぞみ on 2017/06/24.
//  Copyright © 2017年 g15938sn. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var categorySugumentedControl: UISegmentedControl!
    
    var taskCategory:String="ToDo"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func categoryChose(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0: taskCategory="ToDo"
        case 1: taskCategory="Shopping"
        case 2: taskCaregory="Assignment"
        default: taskCategory="ToDo"
            
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
    }

    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true,completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
