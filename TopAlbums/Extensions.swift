//
//  Extensions.swift
//  TopAlbums
//
//  Created by Miladin Kovacevic on 1/18/22.
//

import UIKit

extension UILabel {
    public func fontAndAlignment(size: Double, alignment: NSTextAlignment) {
        self.font = UIFont.systemFont(ofSize: size)
        self.textAlignment = alignment
        self.textColor = .black
    }
}
