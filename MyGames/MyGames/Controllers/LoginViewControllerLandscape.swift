//
//  LoginViewControllerLandscape.swift
//  MyGames
//
//  Created by Eduardo Peregrino on 11/01/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class LoginViewControllerLandscape: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        
        if newCollection.verticalSizeClass == .regular {
            dismiss(animated: true, completion: nil)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let controller = storyboard.instantiateInitialViewController() as? LoginViewController {
                DispatchQueue.main.async { [weak self] in
                    self?.present(controller, animated: true, completion: nil)
                }
            }
        }
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
