//
//  Extension.swift
//  a Lodjinha
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(withURL: String) {
        guard let withURL = URL(string: withURL) else { return }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: withURL), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }

}

extension String {
    func htmlToString() -> NSAttributedString? {
        let modifiedFont = NSString(format:"<span style=\"font-family: '-apple-system', 'HelveticaNeue'; font-size: 14\">%@</span>" as NSString, self) as String
        
        guard let data = modifiedFont.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return nil }
        
        guard let string = try? NSMutableAttributedString(data: data,
                                                          options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
                                                          documentAttributes: nil) else { return nil }
        
        return string
    }
    
    func setTrace() -> NSMutableAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        
        return attributeString
    }
}
