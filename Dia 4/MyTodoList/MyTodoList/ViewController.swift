//
//  ViewController.swift
//  MyTodoList
//
//  Created by Ricardo Gonzalez on 11/4/15.
//  Copyright © 2015 PiñataSoftware. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    let todoList = TodoList()
    
    var selectedItem : String = ""
    
    @IBAction func buttonTap(sender: UIButton) {
        todoList.addItem(textField.text!)
        tableView.reloadData()
        print("El texto: \(todoList.items.count)")
        textField.text = ""
        self.textField?.resignFirstResponder()
    }
    
    //MARK: Metodos del View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "tareas")
        tableView.dataSource = todoList
        tableView.delegate = self
        tableView.allowsMultipleSelectionDuringEditing = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Metodos del UITableViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.textField?.resignFirstResponder()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.textField?.resignFirstResponder()
        selectedItem = todoList.items[indexPath.row]
        self.performSegueWithIdentifier("showItem", sender: self)
//        let detailViewController = UIViewController()
//        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "Eliminar"
    }
    
    //MARK: Para el navigation controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier! == "showItem"){
            let detailViewController = segue.destinationViewController as! DetailViewController
            detailViewController.item = self.selectedItem
        }
    }

}

