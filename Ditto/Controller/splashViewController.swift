//
//  splashViewController.swift
//  CarPool
//
//  Created by Rana on 5/20/17.
//  Copyright © 2017 appConcept. All rights reserved.
//

import UIKit
import SwiftyGif

class splashViewController: UIViewController {
    var window: UIWindow?
    @IBOutlet weak var GifImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gifmanager = SwiftyGifManager(memoryLimit:20)
        let gif = UIImage(gifName: "df0ad71d0da0d9dc89b4fbab658c96da.gif")
        self.GifImage.setGifImage(gif, manager: gifmanager, loopCount:2)
        
        Timer.scheduledTimer(timeInterval: 5 , target: self, selector: #selector(self.goToNextView), userInfo: nil, repeats: false)
    
    
    }


    func goToNextView(){
        let storyboard = UIStoryboard.init(name: "Auth", bundle: nil);
        let stationsVC : UIViewController?;
        stationsVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        stationsVC?.modalPresentationStyle = .custom
        self.window?.rootViewController = stationsVC;
        self.window?.makeKeyAndVisible();
        self.present(stationsVC!, animated: false, completion: nil)
    }

}
