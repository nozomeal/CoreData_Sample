//
//  ViewController.swift
//  CoreData_Sample
//
//  Created by 坂本のぞみ on 2017/06/22.
//  Copyright © 2017年 g15938sn. All rights reserved.
//

import UIKit
import CoreData


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
        taskTableView.dataSource=self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //CoreDaraからデータをfetch(fetch:持ってくる)
        getData()
        //taskTableViewを再読み込み
        taskTableView.reloadData()
        
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
    func  tableView(_ tableView:UITableView,numberOfRowsInSection section: Int)->Int{
        return taskToShow[taskCategories[section]]!.count
    }
    
    func tableView(_ tableView:UITableView,cellForRowAt indexPath:IndexPath)->UITableViewCell{
        let cell=UITableViewCell()
        
        let sectionData=taskToShow[taskCategories[indexPath.section]]
        let cellData=sectionData?[indexPath.row]
        
        cell.textlabel?.text="\(cellData)"
        return cell
    }
    
    func getData(){
        //データ保存時と同時にcontextにを定義
        let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            //CoreDataからデータをfetchしてきてtaskに格納
            let fetchRequest:NSFetchRequest<Task>=Task.fetchRequest()
            tasks = try context.fetch(fetchRequest)
            
            //taskToShow配列をからにする(同じデータを復習表示しないため)
            for key in taskToShow.keys{
                taskToShow[key]=[]
            }
            //先ほどfetchしデータをtaskToShowに格納
            for task in tasks{
                taskToShow[task.category!]?.append(task.name!)
            }
        
        }catch{
            print("fetching failed.")
        }
    }
    
    
    
    
    
    
    
    
    
    

}

