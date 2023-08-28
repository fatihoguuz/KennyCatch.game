//
//  ViewController2.swift
//  kennyCatch
//
//  Created by Fatih Oğuz on 28.08.2023.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        self.imageView.center.y -= view.bounds.height
    }
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5, delay: 0.4, animations: {
            self.imageView.center.y += self.view.bounds.height
        } )
    }
    
    override func viewDidLoad() {
        
        
        
        
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         @IBAction func startButton(_ sender: Any) {
             performSegue(withIdentifier: "startButton2", sender: nil)
             
         */
        
    }
    
    @IBAction func startButton(_ sender: Any) {
        performSegue(withIdentifier: "startButton2", sender: nil)
    }
    
    }
  
        
    
    

