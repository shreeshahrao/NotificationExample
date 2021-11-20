//
//  SecondViewController.swift
//  NotificationExample
//
//  Created by Shreesha on 20/11/21.
//

import UIKit

class SecondViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
    }
    

    @IBAction func imperialPressed(_ sender: UIButton) {
      
        let name = Notification.Name(rawValue: darkNotificationKey)
        NotificationCenter.default.post(name: name , object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func rebelPressed(_ sender: Any) {
        let name = Notification.Name(rawValue: lightNotificationKey)
        NotificationCenter.default.post(name: name , object: nil)
        dismiss(animated: true, completion: nil)
 
    }
    

}
