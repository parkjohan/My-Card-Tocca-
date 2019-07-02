//
//  RoundedShadowButton.swift
//  My Card (Tocca)
//
//  Created by Johan Park on 7/1/19.
//  Copyright © 2019 Johan Park. All rights reserved.
//

import UIKit

class RoundedShadowButton: UIButton {
    override func awakeFromNib() {
        let shadowRadius: CGFloat = 12.0
        let shadowOpacity: Float = 0.5
        let shadowYOffset = 0.0
        let shadowXOffset = 0.0
        let shadowColor = UIColor.gray.cgColor
        let cornerRadius: CGFloat = 20.0
        
        layer.cornerRadius = cornerRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = CGSize(width: shadowXOffset, height: shadowYOffset)
        layer.shadowColor = shadowColor
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
        clipsToBounds = false
        
    }
}
