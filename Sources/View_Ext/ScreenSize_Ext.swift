import SwiftUI

public extension View {
    func screenSizeApp() -> CGSize{
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return window.screen.bounds.size
    }
}
