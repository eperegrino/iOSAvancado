//
//  OnboardingViewController.swift
//  MyGames
//
//  Created by Eduardo Peregrino on 28/12/19.
//  Copyright © 2019 CESAR School. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    var dismissOnboarding: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        dismissOnboarding?()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
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
