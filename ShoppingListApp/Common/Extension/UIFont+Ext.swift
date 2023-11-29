//
//  UIFont+Ext.swift
//  ShoppingListApp
//
//  Created by Kaan Uzman on 30/11/23.
//

import Foundation
import UIKit

extension UIFont {
    var boldVersion: UIFont {
        /// Return the original font if the bold version is not created
        guard let descriptor = fontDescriptor.withSymbolicTraits(.traitBold) else {
            return self
        }

        /// Create and return  bold version
        return UIFont(descriptor: descriptor, size: .zero) /// .zero is keep to orjinal size
    }
}
