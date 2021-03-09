//
//  SecondViewController.swift
//  Stamp
//
//  Created by Honoka Nishiyama on 2021/03/09.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var button:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 200)  // 1
                button.center = self.view.center  // 2
                
                button.backgroundColor = .cyan  // 3
                button.setTitleColor(UIColor.white, for: UIControl.State.normal)  // 4
         
                button.layer.borderWidth = 4  // 5
                button.layer.borderColor = UIColor.cyan.cgColor  // 6
         
                button.layer.cornerRadius = 10  // 7
                
                button.layer.shadowOffset = CGSize(width: 3, height: 3 )  // 8
                button.layer.shadowOpacity = 0.5  // 9
                button.layer.shadowRadius = 10  // 10
                button.layer.shadowColor = UIColor.gray.cgColor  // 11
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
