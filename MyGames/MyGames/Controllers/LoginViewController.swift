//
//  LoginViewController.swift
//  MyGames
//
//  Created by Eduardo Peregrino on 11/01/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presentOnboarding()
        
        AppUtility.lockOrientation(.portrait)
    }
    
    private func presentOnboarding() {
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? OnboardingCollectionViewController {
            controller.dismissOnboarding = { [weak self] in
                self?.showAlert()
            }
            DispatchQueue.main.async { [weak self] in
                self?.present(controller, animated: true, completion: nil)
            }
        }
    }
    
    private func showAlert() {
        let alertController = UIAlertController(title: "Alert", message:
            "tutorial finished", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        
        if newCollection.verticalSizeClass == .compact {
            //dismiss(animated: true, completion: nil)
            
            //let viewController = LoginViewControllerLandscape(nibName: "LoginViewControllerLandscape", bundle: nil)
            //present(viewController, animated: true, completion: nil)
            
            let storyboard = UIStoryboard(name: "Landscape", bundle: nil)
            if let controller = storyboard.instantiateInitialViewController() as? LoginViewControllerLandscape {
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
