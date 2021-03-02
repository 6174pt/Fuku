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
    var stampArray=[UIImageView]()

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
        setSelectedButton()
        
    }
    
    @IBAction func selectedSecond(){
        imageIndex=2
        setSelectedButton()
        
    }

    @IBAction func selectedThird(){
        imageIndex=3
        setSelectedButton()
        
    }
    
    @IBAction func selectedFourth(){
        imageIndex=4
        setSelectedButton()
        
    }
    
    @IBAction func selectedFifth(){
        imageIndex=5
        setSelectedButton()
        
    }
    
    @IBAction func selectedSixth(){
        imageIndex=6
        setSelectedButton()
        
    }
    
    func setSelectedButton(){
        hidarimayu.layer.borderWidth=0
        migimayu.layer.borderWidth=0
        hidarime.layer.borderWidth=0
        migime.layer.borderWidth=0
        kuchi.layer.borderWidth=0
        hana.layer.borderWidth=0
        
        switch imageIndex {
    
    case 0:
        break
        
    case 1:
        hidarimayu.layer.borderWidth=2.0
        hidarimayu.layer.borderColor=UIColor.red.cgColor
        
    case 2:
        migimayu.layer.borderWidth=2.0
        migimayu.layer.borderColor=UIColor.red.cgColor
        
    case 3:
        hidarime.layer.borderWidth=2.0
        hidarime.layer.borderColor=UIColor.red.cgColor
        
    case 4:
        migime.layer.borderWidth=2.0
        migime.layer.borderColor=UIColor.red.cgColor
        
    case 5:
        kuchi.layer.borderWidth=2.0
        kuchi.layer.borderColor=UIColor.red.cgColor
        
    case 6:
        hana.layer.borderWidth=2.0
        hana.layer.borderColor=UIColor.red.cgColor
        
    default:
        break
        
        }
        
    }
    
    @IBAction func modoru(){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch=touches.first!
        let location:CGPoint=touch.location(in: self.view)
        
        haikeiImageView.image=nil
        
        if imageIndex != 0 {
            imageView=UIImageView(frame: CGRect(x: 0,y: 0,width: 40,height: 40))
            
            let image:UIImage=UIImage(named: imageNameArray[imageIndex - 1])!
            imageView.image=image
            
            imageView.center=CGPoint(x: location.x, y: location.y)
            
            self.view.addSubview(imageView)
            
            stampArray.append(imageView)
            
            switch imageIndex {
            
            case 0:
                break
                
            case 1:
                hidarimayu.isEnabled=false
                
            case 2:
                migimayu.isEnabled=false
                
            case 3:
                hidarime.isEnabled=false
                
            case 4:
                migime.isEnabled=false
                
            case 5:
                kuchi.isEnabled=false
                
            case 6:
                hana.isEnabled=false
                
            default:
                break
                
                
            }
            
            imageIndex=0
            
        }
        
        if !isAllSelected(){
            haikeiImageView.image=UIImage(named: "background")
        }
    }
    
    func isAllSelected()->Bool{
        if hidarimayu.isEnabled{
            return true
        }
        
        if migimayu.isEnabled{
            return true
        }
        
        if hidarime.isEnabled{
            return true
        }
        
        if migime.isEnabled{
            return true
        }
        
        if kuchi.isEnabled{
            return true
        }
        
        if hana.isEnabled{
            return true
        }
        return false
        
    }
    
    @IBAction func reset(){
        
        for view in stampArray{
            view.removeFromSuperview()
        }
        
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




