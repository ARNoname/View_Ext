import SwiftUI
import UIKit

@MainActor
public struct TextColorApp {

    public static func colorString(text: String = "",
                    rangeOne: String = "",
                    rangeOneColor: UIColor = .red,
                    rangeTwo: String? = nil,
                    rangeTwoColor: UIColor? = nil,
                    fontWeight: FontTypeApp = .bold,
                    size: CGFloat = 16) -> AttributedString {
    
        var attributedString = AttributedString(text)
    
        if let range = attributedString.range(of: rangeOne) {
            attributedString[range].foregroundColor = rangeOneColor
            attributedString[range].font = UIFont(name: fontWeight.fontValue(font: StaticValueApp.fontExt), size: size)
        }
        
        if let rangeTwo = rangeTwo {
            if let range = attributedString.range(of: rangeTwo) {
                attributedString[range].foregroundColor = rangeTwoColor
                attributedString[range].font = UIFont(name: fontWeight.fontValue(font: StaticValueApp.fontExt), size: size)
            }
        }
        
       return attributedString
    }
}
