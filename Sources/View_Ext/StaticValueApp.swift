import SwiftUI

@MainActor
public struct StaticValueApp: Sendable {
    public static var bgColors: Color = Color.white
    public static var fontExt: String = ""
    public static var backSwipeGesture: Bool = false
}


