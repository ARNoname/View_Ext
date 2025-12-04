import SwiftUI

struct FlipTransitionApp: ViewModifier,  @MainActor Animatable {
    var progress: CGFloat = 0
    
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .opacity(progress < 0 ? (-progress < 0.5 ? 1 : 0) : (progress < 0.5 ? 1 : 0))
            .rotation3DEffect(.degrees(progress * 180), axis: (x: 0, y: 1, z: 0))
    }
}

@MainActor
public extension AnyTransition {
    static let flip: AnyTransition = .modifier(active: FlipTransitionApp(progress: -1), identity: FlipTransitionApp())
    
    static let flipBack: AnyTransition = .modifier(active: FlipTransitionApp(progress: 1), identity: FlipTransitionApp())
}
