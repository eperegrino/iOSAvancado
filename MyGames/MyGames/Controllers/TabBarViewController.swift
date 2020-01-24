//
//  TabBarViewController.swift
//  MyGames
//
//  Created by Eduardo Peregrino on 28/12/19.
//  Copyright © 2019 CESAR School. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppUtility.lockOrientation(.portrait)
    }
    
    /*override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }*/
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        
        /*if newCollection.verticalSizeClass == .compact {
            dismiss(animated: true, completion: nil)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let controller = storyboard.instantiateInitialViewController() as? LoginViewControllerLandscape {
                DispatchQueue.main.async { [weak self] in
                    self?.present(controller, animated: true, completion: nil)
                }
            }
        }*/
    }
}
