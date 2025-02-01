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
}
