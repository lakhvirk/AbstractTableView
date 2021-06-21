//
//  UIView.swift
//  AbstractTableView
//
//  Created by Lakhwinder Singh on 2021-06-20.
//

import UIKit

public extension UIView {
    
    /*
     Turn off avoidHSafeArea to allow margins from left and right. Default is true
     Turn off avoidVSafeArea to allow margins from top and bottom. Default is false
     By Default, it only get margins from top and bottom safe area.
     */
    func fillToSuperView(_ avoidHSafeArea: Bool = true, avoidVSafeArea: Bool = false) {
        if let safeSV = superview {
            translatesAutoresizingMaskIntoConstraints = false
            let margins = safeSV.layoutMarginsGuide

            leadingAnchor.constraint(equalTo: avoidHSafeArea ? safeSV.leadingAnchor : margins.leadingAnchor, constant: 0).isActive = true
            trailingAnchor.constraint(equalTo: avoidHSafeArea ? safeSV.trailingAnchor : margins.trailingAnchor, constant: 0).isActive = true
            topAnchor.constraint(equalTo: avoidVSafeArea ? safeSV.topAnchor : margins.topAnchor, constant: 0).isActive = true
            bottomAnchor.constraint(equalTo: avoidVSafeArea ? safeSV.bottomAnchor : margins.bottomAnchor, constant: 0).isActive = true
        }
    }
}
