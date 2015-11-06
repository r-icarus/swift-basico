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
                Api.save(self.item!, todoList: self.todoList!, responseBlock: {(error) -> Void in
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        if let err = error{
                            print(err)
                            self.showError()
                            return
                        } else {
                            self.navigationController?.popViewControllerAnimated(true)
                            return
                        }
                    })
                })
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
        if self.datePicker.hidden {
            fadeInDatePicker()
        } else {
            fadeOutDatePicker()
        }
//        imageView.hidden = datePicker.hidden
//        datePicker.hidden = !datePicker.hidden
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
        addGestureRecognizerToImage()
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
    
    //MARK: Animaciones
    func fadeInDatePicker(){
        self.datePicker.alpha = 0
        self.datePicker.hidden = false
        UIView.animateWithDuration(1) { () -> Void in
            self.datePicker.alpha = 1
            self.imageView.alpha = 0
        }
    }
    
    func fadeOutDatePicker(){
        self.datePicker.alpha = 1
        self.datePicker.hidden = false
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.datePicker.alpha = 0
            self.imageView.alpha = 1
            }){ (completed) -> Void in
                if(completed){
                    self.datePicker.hidden = true
                }
        }
    }
    
    
    func addGestureRecognizerToImage(){
        let gr = UITapGestureRecognizer()
        gr.numberOfTapsRequired = 1
        gr.numberOfTouchesRequired = 1
        gr.addTarget(self, action: "rotate")
        imageView.addGestureRecognizer(gr)
        imageView.userInteractionEnabled = true
    }
    
    func rotate(){
        let animation = CABasicAnimation()
        animation.duration = 1
        animation.repeatCount = 2
        animation.toValue = M_PI * 2.0
        animation.keyPath = "transform.rotation.z"
        print("animando la imagen")
        self.imageView.layer.addAnimation(animation, forKey: "rotateImage")
    }
    
    
    //MARK: Web Service
    func showError(){
        let alert = UIAlertController(title: "Ups", message: "No pudimos guardar los cambios revisa tu conexión a internet", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default) { (act) -> Void in
            self.navigationController?.popViewControllerAnimated(true)
        }
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
