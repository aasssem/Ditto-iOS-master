//
//  signUpViewController.swift
//  Ditto
//
//  Created by Rana on 5/25/17.
//  Copyright © 2017 appConcept. All rights reserved.
//

import UIKit

class signUpViewController: UIViewController {
    
    @IBOutlet weak var femaleGenderBtn: UIButton!
    @IBOutlet weak var maleGenderBtn: UIButton!
    @IBOutlet weak var profilePicBtn: UIButton!
    
    @IBOutlet weak var improveProfileBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    
    @IBAction func maleGenderSelectTapped(_ sender: UIButton) {
        maleGenderBtn.setBackgroundImage(#imageLiteral(resourceName: "mGenderIconSelect"), for: UIControlState.normal)
        femaleGenderBtn.setBackgroundImage(#imageLiteral(resourceName: "fGenderIconDeselect"), for: UIControlState.normal)
    }

    @IBAction func femaleGenderSelectTapped(_ sender: UIButton) {
        maleGenderBtn.setBackgroundImage(#imageLiteral(resourceName: "mGenderIconDeselect"), for: UIControlState.normal)
        femaleGenderBtn.setBackgroundImage(#imageLiteral(resourceName: "fGenderIconSelect"), for: UIControlState.normal)
    }
    
    @IBAction func profilePicBtnTapped(_ sender: UIButton) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(myPickerController, animated: true, completion: nil);
        
    }
    
    @IBAction func improveProfileBtnTapped(_ sender: UIButton) {
        var isOpen = true;
        if isOpen{
            improveProfileBtn.setBackgroundImage(#imageLiteral(resourceName: "signup_more_opened"), for: UIControlState.normal)
        }
    }
    
    

}
extension signUpViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image =  info[UIImagePickerControllerOriginalImage] as? UIImage{
            let newImage = Shared.Image.scaleImage(image,width:200)

              profilePicBtn.setBackgroundImage(newImage, for: UIControlState.normal)
            
        }
        
        
        self.dismiss(animated: true, completion: nil)
    }
}
