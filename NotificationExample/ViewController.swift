

import UIKit

let lightNotificationKey = "co.shreesha.light"
let darkNotificationKey = "co.shreesha.dark"


class ViewController: UIViewController {
    
    @IBOutlet weak var firstScreenImage: UIImageView!
    
    @IBOutlet weak var firstScreenLabel: UILabel!
    
    let light = Notification.Name(rawValue: lightNotificationKey)
    let dark  = Notification.Name(rawValue: darkNotificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        createObservers()
    }
    
    func createObservers() {
        //Light
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateCharacterImage(notification:)), name: light, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateText(notification:)), name: light, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateBackground(notification:)), name: light, object: nil)
        
        //dark
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateCharacterImage(notification:)), name: dark, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateText(notification:)), name: dark, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateBackground(notification:)), name: dark, object: nil)
    
    
    }
    
    @objc func updateCharacterImage(notification: NSNotification)
    {
        let isLight = notification.name == light
        let image = isLight ? UIImage(named: "Luke")! : UIImage(named: "Vader")!
        print(image)
        firstScreenImage.image = image

    }
    
    @objc func updateText(notification: NSNotification) {
        let isLight = notification.name == light
        let strText = isLight ? "Luke SkyWalker" : "Vader"
        print(strText)
        firstScreenLabel.text = strText
        
    }
    
    @objc func updateBackground(notification: NSNotification) {
        let isLight = notification.name == light
        let color = isLight ? UIColor.cyan : UIColor.red
        print(color)
        self.view.backgroundColor = color
        
    }
    @IBAction func anotherScreen(_ sender: UIButton) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondScreen") as! SecondViewController
        present(secondVC, animated: true, completion: nil)
     
    }
    
}

