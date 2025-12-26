
import SwiftUI

@MainActor
public enum FontTypeApp: String {
    case black
    case bold
    case semibold
    case medium
    case regular
    
    var weight: Font.Weight {
        switch self {
        case .black:    return .black
        case .bold:     return .bold
        case .semibold: return .semibold
        case .medium:   return .medium
        case .regular:  return .regular
        }
    }
    
    func fontValue(font: String) -> String {
        "\(font.capitalized)-\(self.rawValue.capitalized)"
    }
}

public extension View {
    func fontSys(_ type: FontTypeApp, _ size: CGFloat) -> some View {
        self.font(.system(size: size, weight: type.weight, design: .default))
    }
    
    func fontApp(_ font: FontTypeApp, _ size: CGFloat, fontName: String = AppStaticValue.fontExt) -> some View {
        self.font(.custom(font.fontValue(font: fontName), size: size))
    }
}


