//
//  UIView+Extensions.swift
//  Donuts
//
//  Created by Diggo Silva on 31/01/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach({ addSubview($0) })
    }
    
    func buildLabel(text: String = "", textColor: UIColor = .black, font: UIFont, numberOfLines: Int = 1) -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = text
        lbl.textColor = textColor
        lbl.font = font
        lbl.numberOfLines = numberOfLines
        return lbl
    }
    
    func createStack(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis = .vertical, distribution: UIStackView.Distribution = .fillProportionally) -> UIStackView {
        let sv = UIStackView(arrangedSubviews: arrangedSubviews)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = axis
        sv.distribution = distribution
        sv.alignment = .center
        return sv
    }
}
