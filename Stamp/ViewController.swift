//
//  ViewController.swift
//  Stamp
//
//  Created by Honoka Nishiyama on 2021/01/05.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var imageNameArray:[String]=["hidarimayu","migimayu","hidarime","migime","kuchi","hana",]
    var imageIndex:Int=0
    @IBOutlet var haikeiImageView :UIImageView!
    var imageView:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var hidarimayu:UIButton!
    @IBOutlet var migimayu:UIButton!
    @IBOutlet var hidarime:UIButton!
    @IBOutlet var migime:UIButton!
    @IBOutlet var kuchi:UIButton!
    @IBOutlet var hana:UIButton!
    
    
    @IBAction func selectedFirst(){
        imageIndex=1
        
    }
    
    @IBAction func selectedSecond(){
        imageIndex=2
        
    }

    @IBAction func selectedThird(){
        imageIndex=3
        
    }
    
    @IBAction func selectedFourth(){
        imageIndex=4
        
    }
    
    @IBAction func selectedFifth(){
        imageIndex=5
        
    }
    
    @IBAction func selectedSixth(){
        imageIndex=6
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch=touches.first!
        let location:CGPoint=touch.location(in: self.view)
        
        if imageIndex != 0 {
            imageView=UIImageView(frame: CGRect(x: 0,y: 0,width: 40,height: 40))
            
            let image:UIImage=UIImage(named: imageNameArray[imageIndex - 1])!
            imageView.image=image
            
            imageView.center=CGPoint(x: location.x, y: location.y)
            
            self.view.addSubview(imageView)
            
            switch imageIndex {
            
            case 0:break
                
            case 1:hidarimayu.isEnabled=false
                
            case 2:migimayu.isEnabled=false
                
            case 3:hidarime.isEnabled=false
                
            case 4:migime.isEnabled=false
                
            case 5:kuchi.isEnabled=false
                
            case 6:hana.isEnabled=false
                
            default:break
                
                
            }
            
        }
    }
    
    @IBAction func back(){
        self.imageView.removeFromSuperview()
        
    }
    
    
    @IBAction func selectbackground(){
        let imagePickerController:UIImagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType=UIImagePickerController.SourceType.photoLibrary
        imagePickerController.delegate=self
        imagePickerController.allowsEditing=true
        
        self.present(imagePickerController, animated: true, completion: nil)
        
        func imagePiclerController(_ picker:UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey :Any]){
            
            let image = info[.originalImage] as? UIImage
            haikeiImageView.image = image
            self.dismiss(animated: true, completion: nil)
        }
        
        
        
    }

    @IBAction func save(){
        let rect:CGRect = CGRect(x: 0, y: 30, width: 320, height: 380)
        UIGraphicsBeginImageContext(rect.size)
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let capture = UIGraphicsGetImageFromCurrentImageContext()
        UIImageWriteToSavedPhotosAlbum(capture!, nil, nil, nil)
        
        
        
    }


}




