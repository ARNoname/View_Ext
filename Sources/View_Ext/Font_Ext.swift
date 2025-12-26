
import SwiftUI

@MainActor
public enum FontTypes: String {
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
    
    var fontValue: String {
        "\(AppStaticValue.fontExt.capitalized)-\(self.rawValue.capitalized)"
    }
}

public extension View {
    func fontSys(_ type: FontTypes, _ size: CGFloat) -> some View {
        self.font(.system(size: size, weight: type.weight, design: .default))
    }
    
    func fontsApp(_ font: FontTypes, _ size: CGFloat) -> some View {
        self.font(.custom(font.fontValue, size: size))
    }
}

