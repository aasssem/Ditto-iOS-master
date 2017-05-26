//
//  LoginViewController.swift
//  CarPool
//
//  Created by Rana on 4/5/17.
//  Copyright © 2017 appConcept. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FBSDKShareKit
import CHIPageControl
import SwiftyGif


class LoginViewController: UIViewController {

    
    var currentName:String?;
    var currentEmail:String?;
    var currentBirthDay:String?;
    var currentProfilePicture:String?;
    var currentPassword:String?;
    var scrollViewWidth:CGFloat?;
    var scrollViewHeight:CGFloat?;
    @IBOutlet var pageControls: [CHIBasePageControl]!
    @IBOutlet weak var imageSlider: UIScrollView!
    @IBOutlet weak var loginBtn: UIButton!
    
    var imageNo : CGFloat? = 0;

    let numberOfPages = 5;
    var m :CGFloat = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Shared.CustomButton(loginBtn,borderColor: UIColor.clear,borderWidth: 0);
        //ButtonRadius
        self.pageControls.forEach { (control) in
            control.numberOfPages = self.numberOfPages
        }
        //1
        self.imageSlider.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height)
       scrollViewWidth = self.imageSlider.frame.width
        scrollViewHeight = self.imageSlider.frame.height

        //3
        self.getGifs()
        
        //4
        self.imageSlider.contentSize = CGSize(width:self.imageSlider.frame.width * 5, height:self.imageSlider.frame.height)
        self.imageSlider.delegate = self
        //self.pageControls.currentPage = 0
    }
    

    func getGifs(){
        var gifImages = ["1.gif","2.gif","3.gif","4.gif","5.gif"]
        for x in gifImages{
            var img = UIImageView();
            img = UIImageView(frame: CGRect(x: self.scrollViewWidth! * self.m, y: 0, width: self.scrollViewWidth!, height: self.scrollViewHeight!))
            let gifmanager = SwiftyGifManager(memoryLimit:2000)
            let gif = UIImage(gifName: x)
            img.setGifImage(gif, manager: gifmanager)
            self.imageSlider.addSubview(img)
            self.m += 1 ;
        }
    }

    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        let loginManager = LoginManager()
        loginManager.loginBehavior = .native;
        loginManager.defaultAudience = .everyone;
        loginManager.logIn([.email,.publicProfile,.userFriends,FacebookCore.ReadPermission.custom("user_birthday")], viewController: self) { loginResult in
          //  PKHUD.sharedHUD.contentView = PKHUDProgressView(title: "Login".localized(), subtitle: "using Facebook".localized());
          //  PKHUD.sharedHUD.show();
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
               // Shared.HUD.hide();
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                
                debugPrint("Logged in with Facebook! \n grantedPermissions: \(grantedPermissions)  \n declinedPermissions:\(declinedPermissions) \n accessToken : \(accessToken)" )
                
                var fbRequestFriends: FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "/{friend-list-id}", parameters: [AnyHashable : Any]())
                
                fbRequestFriends.start { (connection, result, error) in
                    if error == nil && result != nil {
                        print("Request Friends result : \(result!)")
                    } else {
                        print("Error \(error)")
                    }
                }
                
                
                self.fetchProfile();
                
                
            }
        }

    }
    
    func fetchProfile(){
        let parameters = [ "fields" : "id,name,email,birthday,picture"]
        let request = GraphRequest(graphPath: "/me",
                                   parameters: parameters,
                                   httpMethod: .GET)
        request.start { _, result in
            switch result {
            case .success(let response):
                print("Graph Request Succeeded: \(response)")
                self.collectUserDate(response.dictionaryValue! as Dictionary<String, AnyObject>);
            case .failed(let error):
                print("Graph Request Failed: \(error)")
            }
        }
        
    }
    
    func  collectUserDate(_ UserData : Dictionary<String,AnyObject>) {
        if let birthday = UserData["birthday"] {
            currentBirthDay = birthday as? String;
        }
        else{
            currentBirthDay = nil;
        }
        
        if let name = UserData["name"] {
            currentName = name as? String;
        }
        else{
            currentName = nil;
        }
        
        if let email = UserData["email"] {
            
            currentEmail = email as? String;
        }
        else{
            currentEmail = nil;
        }
        
        if let password = UserData["id"] {
            currentPassword = password as? String;
        }
        else{
            currentPassword = nil;
        }
        
        if let pictureJson = UserData["picture"] as? Dictionary<String, AnyObject> {
            if let pictureJsonData = pictureJson["data"] as? Dictionary<String, AnyObject> {
                if let pictureUrl = pictureJsonData["url"] {
                    let url = "https://graph.facebook.com/\(currentPassword!)/picture?type=large&return_ssl_resources=1"
                    currentProfilePicture = url
                }
                else{
                    currentProfilePicture = nil;
                }
            }
        }
       // self.getUserFriends()
    }
    
//    func getUserFriends(){
//        let params = ["fields": "id, first_name, last_name, name, email, picture"]
//        let graphRequest = FBSDKGraphRequest(graphPath: "/\(currentPassword)/friends", parameters: params)
//        //let graphRequest = FBSDKGraphRequest(graphPath: "/me/friends", parameters: params)
//        let connection = FBSDKGraphRequestConnection()
//        connection.add(graphRequest, completionHandler: { (connection, result, error) in
//            if error == nil {
//                if let userData = result as? [String:Any] {
//                    print(userData)
//                }
//            } else {
//                print("Error Getting Friends \(error)");
//            }
//            
//        })
//        
//        connection.start()
//        
//    }
}
extension LoginViewController : UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        //dismiss(animated: true, completion: nil)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let total = scrollView.contentSize.width - scrollView.bounds.width
        let offset = scrollView.contentOffset.x
        let percent = Double(offset / total)
        
        let progress = percent * Double(self.numberOfPages - 1)
        
        self.pageControls.forEach { (control) in
            control.progress = progress
        }
    }

}
    

