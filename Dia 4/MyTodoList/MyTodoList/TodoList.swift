//
//  TodoList.swift
//  MyTodoList
//
//  Created by Ricardo Gonzalez on 11/4/15.
//  Copyright © 2015 PiñataSoftware. All rights reserved.
//

import UIKit

class TodoList : NSObject, UITableViewDataSource {
    
    override init() {
        super.init()
        loadItems()
    }
    
    var items : [String] = []
    
    func addItem(item: String){
        items.append(item)
        saveItems()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tareas", forIndexPath: indexPath)
        let item = items[indexPath.row]
        cell.textLabel!.text = item
        return cell
    }
    
    //MARK. Editar y borrar
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == .Delete){
            items.removeAtIndex(indexPath.row)
            saveItems()
            tableView.reloadData()
        }
    }
    
    private let fileUrl : NSURL = {
        let fileManager = NSFileManager.defaultManager()
        let documentDirectoryURLs = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as Array
        let documentDirectoryURL = documentDirectoryURLs.first!
        print(documentDirectoryURL)
        return documentDirectoryURL.URLByAppendingPathComponent("todolist.items")
    }()
    
    func saveItems(){
        let itemsArray = items as NSArray
        if itemsArray.writeToURL(self.fileUrl, atomically: true){
            print("Guardado")
        }else{
            print("No guardado")
        }
    }
    
    func loadItems(){
        if let itemsArray = NSArray(contentsOfURL: self.fileUrl) as? [String]{
            self.items = itemsArray
        }
    }
}
