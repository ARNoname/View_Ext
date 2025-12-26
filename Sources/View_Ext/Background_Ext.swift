import SwiftUI

struct BackgroundApp: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(StaticValueApp.bgColors)
    }
}

public extension View {
    func globalBackground() -> some View {
        self.modifier(BackgroundApp())
    }
}
