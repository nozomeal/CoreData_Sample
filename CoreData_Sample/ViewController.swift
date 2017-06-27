//
//  ViewController.swift
//  CoreData_Sample
//
//  Created by 坂本のぞみ on 2017/06/22.
//  Copyright © 2017年 g15938sn. All rights reserved.
//

import UIKit


//CoreDataからデータを持ってきてtableViewに表示させる
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var taskTableView: UITableView!
    
    var tasks:[Task]=[]
    var taskToShow:[String:[String]]=["ToDo":[], "Shopping":[], "Assignment":[]]
    var taskCategories:[String]=["ToDo","Shopping","Assignment"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        taskTableView.delegate=self
        taskTableView.datasurce=self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //tableViewDataSource
    //taskCategories[]に格納されている文字列がTableViewのセッションになる
    func numberOfSections(in tableView:UITableView)->Int{
        return taskCategories.count
        
    }
    func tableView(_ tableView:UITableView, titleForHeaderInSection section: Int)->String?{
        return taskCategories[section]
    }
    
    //taskToShowにカテゴリー(taskToShowのキーとなっている)ごとのnameが格納される
    func  tableView(_ tableView:UITabelView,numberOfRowsInSection section: Int)->Int{
        return taskToShow[taskCategories[section]]!.count
    }
    
    func tableView(_ tableView:UITableView,cellForRowAt indexPath:IndexPath)->UITableViewCell{
        let cell=TableViewCell()
        
        let sectionData=taskToShow[taskCategories[indexPath.section]]
        let cellData=sectionData?[indexpath.row]
        
        cell.textlabel="\(cellData)"
        return cell
    }
    

}

