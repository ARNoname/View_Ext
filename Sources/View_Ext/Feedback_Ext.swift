import SwiftUI

@MainActor
public func feedbackApp() {
    let generator = UIImpactFeedbackGenerator(style: .medium)
       generator.impactOccurred()
}
