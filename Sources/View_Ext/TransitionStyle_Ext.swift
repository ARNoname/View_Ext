
import SwiftUI

struct TransitionCombinedApp: ViewModifier {
    var animation: Animation
    var combined: AnyTransition
    func body(content: Content) -> some View {
        content
            .transition(
                .asymmetric(
                    insertion: .push(from: .trailing),
                    removal: .push(from: .leading)
                )
                .combined(with: combined)
                .animation(animation)
            )
    }
}

struct TransitionOnboardApp: ViewModifier {
    var animation: Animation
    func body(content: Content) -> some View {
        content
            .transition(
                .asymmetric(
                    insertion: .push(from: .trailing),
                    removal: .push(from: .leading)
                )
                .animation(animation)
            )
    }
}

struct TransitionSlideApp: ViewModifier {
    var animation: Animation
    var isTrailing: Bool
    func body(content: Content) -> some View {
        content
            .if(isTrailing) {value in
                value
                    .transition(.move(edge: isTrailing == true ? .trailing : .leading).animation(animation))
            }
    }
}

public extension View {
    func transitionCombined(_ animation: Animation = .spring(response: 0.6, dampingFraction: 0.6), combined: AnyTransition = .scale) -> some View {
        self.modifier(TransitionCombinedApp(animation: animation, combined: combined))
    }
    
    func transitionOnboard(_ animation: Animation = .spring(duration: 0.5)) -> some View {
        self.modifier(TransitionOnboardApp(animation: animation))
    }
    
    func transitionSlide(_ animation: Animation = .linear(duration: 0.25), isTrailing: Bool = true) -> some View {
        self.modifier(TransitionSlideApp(animation: animation, isTrailing: isTrailing))
    }
}

