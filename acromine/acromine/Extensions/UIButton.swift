//
//  UIButton.swift
//  acromine
//
//  Created by Miguel on 26/11/21.
//

import UIKit

extension UIButton {

    func setStyle(background: UIColor, textButton: UIColor) {
        backgroundColor = background
        layer.cornerRadius = 5
        setTitleColor(textButton, for: .normal)
    }
    
    func setStyle2(background: UIColor, textButton: UIColor) {
        backgroundColor = background
        layer.cornerRadius = 5
        setTitleColor(textButton, for: .normal)
    }
    
    
    func setStyleBorder(background: UIColor, textButton: UIColor) {
        backgroundColor = background
        layer.cornerRadius = 5
        setTitleColor(textButton, for: .normal)
        
        layer.borderWidth = 1
        layer.borderColor = textButton.cgColor
        
    }

    func setStyleScore(background: UIColor, textButton: UIColor) {
          backgroundColor = background
          layer.cornerRadius = 5
          setTitleColor(textButton, for: .normal)
      }
}

