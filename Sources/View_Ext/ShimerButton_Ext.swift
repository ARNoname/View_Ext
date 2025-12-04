import SwiftUI

public extension View {
    @ViewBuilder
    func shine(_ trigger: Bool, duration: CGFloat = 0.8, clipShape: some Shape = .rect, rightToLeft: Bool = false) -> some View {
        self
            .overlay {
                GeometryReader { geometry in
                    let size = geometry.size
                    let modeDuration = max(0.3, duration)
                    
                    ShineOverlayApp(
                        trigger: trigger,
                        size: size,
                        duration: modeDuration,
                        rightToLeft: rightToLeft
                    )
                }
            }
            .clipShape(clipShape)
    }
}

private struct ShineOverlayApp: View {
    let trigger: Bool
    let size: CGSize
    let duration: CGFloat
    let rightToLeft: Bool
    
    @State private var animationOffset: CGFloat = 0
    
    var body: some View {
        Rectangle()
            .fill(.linearGradient(
                colors: [
                    .clear,
                    .clear,
                    .white.opacity(0.1),
                    .white.opacity(0.5),
                    .white.opacity(1),
                    .white.opacity(0.5),
                    .white.opacity(0.1),
                    .clear,
                    .clear,
                ],
                startPoint: .leading,
                endPoint: .trailing
            ))
            .scaleEffect(y: 8)
            .offset(x: animationOffset)
            .rotationEffect(.degrees(45))
            .scaleEffect(x: rightToLeft ? -1 : 1)
            .onAppear {
                animationOffset = -size.width
            }
            .onChange(of: trigger) {  newValue in
                if newValue {
                    animationOffset = -size.width
                    
                    withAnimation(.linear(duration: duration)) {
                        animationOffset = size.width * 2
                    }
                }
            }
    }
}
