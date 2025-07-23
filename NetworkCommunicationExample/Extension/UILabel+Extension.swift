//
//  UILabel+Extension.swift
//  NetworkCommunicationExample
//
//  Created by 이상민 on 7/24/25.
//

import UIKit

extension UILabel{
    func asColor(targetString: String){
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText.lowercased() as NSString).range(of: targetString)
        attributedString.addAttributes([.foregroundColor: UIColor.orange, .font: UIFont.boldSystemFont(ofSize: 20)], range: range)
        self.attributedText = attributedString
    }
}
