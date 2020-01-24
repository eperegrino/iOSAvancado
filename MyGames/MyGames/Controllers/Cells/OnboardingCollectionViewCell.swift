//
//  OnboardingCollectionViewCell.swift
//  MyGames
//
//  Created by Eduardo Peregrino on 16/01/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var ivOnboardingCollection: UIImageView!
    @IBOutlet weak var lb1OnboardingCollection: UILabel!
    @IBOutlet weak var lb2OnboardingCollection: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func prepare() {
        lb1OnboardingCollection.text = "Teste 1"
        lb2OnboardingCollection.text = "Teste 2"
        ivOnboardingCollection.image = UIImage(named: "onboading_image")
    }
}
