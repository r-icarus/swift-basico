//
//  DetailViewController.swift
//  MyTodoList
//
//  Created by Ricardo Gonzalez on 11/5/15.
//  Copyright © 2015 PiñataSoftware. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var item: TodoItem?
    
    var todoList: TodoList?
    
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    //MARK: Datepicker
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func dateSelected(sender: UIDatePicker) {
        //print("Fecha seleccionada: \(sender.date)")
        dateLabel.text = formatDate(sender.date)
    }
    
    func formatDate(date: NSDate) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        return formatter.stringFromDate(date)
    }
    
    func parseDate(date: String) -> NSDate? {
        let parser = NSDateFormatter()
        parser.dateFormat = "dd/MM/yyyy HH:mm"
        return parser.dateFromString(date)
    }
    
    //MARK: Notifications
    @IBAction func addNotification(sender: UIBarButtonItem) {
        if let dateString = self.dateLabel.text {
            if let date = parseDate(dateString) {
                toggleDatePicker()
                self.item?.dueDate = date
                self.todoList?.saveItems()
                scheduleNotification(self.item!.todo!, date: date)
            }
        }
    }
    
    func scheduleNotification(message: String, date: NSDate){
        let localNotification = UILocalNotification()
        localNotification.fireDate = date
        localNotification.alertBody = message
        localNotification.alertTitle = "Recuerda esta tarea"
        localNotification.applicationIconBadgeNumber = 1
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    
    //MARK: ImagePicker
    @IBAction func addImage(sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imageView.image = image
        self.item?.image = image
        self.todoList?.saveItems()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func toggleDatePicker(){
        imageView.hidden = datePicker.hidden
        datePicker.hidden = !datePicker.hidden
    }
    
    //MARK: ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Tarea: \(item)")
        showItem()
        let tapGestureRecognizer = UITapGestureRecognizer()
        tapGestureRecognizer.numberOfTapsRequired = 1
        tapGestureRecognizer.numberOfTouchesRequired = 1
        tapGestureRecognizer.addTarget(self, action: "toggleDatePicker")
        dateLabel.addGestureRecognizer(tapGestureRecognizer)
        dateLabel.userInteractionEnabled = true
    }
    
    func showItem(){
        taskLabel.text = item?.todo
        if let date = item?.dueDate {
            self.dateLabel.text = formatDate(date)
        }
        if let img = item?.image {
            self.imageView.image = img
        }
    }
}
