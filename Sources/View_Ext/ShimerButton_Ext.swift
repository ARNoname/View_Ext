import SwiftUI

private struct ShineOverlayApp: View {
    let trigger: Bool
    let size: CGSize
    let duration: CGFloat
    let rightToLeft: Bool
    let color: Color
    
    @State private var animationOffset: CGFloat = 0
    
    var body: some View {
        Rectangle()
            .fill(.linearGradient(
                colors: [
                    .clear,
                    .clear,
                    color.opacity(0.1),
                    color.opacity(0.5),
                    color.opacity(1),
                    color.opacity(0.5),
                    color.opacity(0.1),
                    .clear,
                    .clear,
                ],
                startPoint: .leading,
                endPoint: .trailing
            ))
            .scaleEffect(y: 8)
            .offset(x: animationOffset)
            .rotationEffect(.degrees(0))
            .scaleEffect(x: rightToLeft ? -1 : 1)
            .onAppear {
                animationOffset = -size.width
            }
            .onChange(of: trigger) {oldValue, newValue in
                if newValue {
                    animationOffset = -size.width
                    
                    withAnimation(.linear(duration: duration)) {
                        animationOffset = size.width * 2
                    }
                }
            }
    }
}

public extension View {
    @ViewBuilder func shineApp(
        trigger: Bool,
        duration: CGFloat = 0.8,
        clipShape: some Shape = .rect,
        rightToLeft: Bool = false,
        color: Color = .white) -> some View {
         self
            .overlay {
                GeometryReader { geometry in
                    let size = geometry.size
                    let modeDuration = max(0.3, duration)
                    
                    ShineOverlayApp(
                        trigger: trigger,
                        size: size,
                        duration: modeDuration,
                        rightToLeft: rightToLeft,
                        color: color
                    )
                }
            }
            .clipShape(
                clipShape
            )
    }
}

/*
 
 // MARK: - Start Shimmer
 
 static  func startShimmerTimer() {
     Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
         DispatchQueue.main.async {
             shine = true
         }
        
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
             shine = false
         }
     }
 }
 
 // MARK: - View Example: .shine
 
 ZStack {
   RoundedRectangle(cornerRadius: 18)
   .fill(Color.clear)
   .shine(shine, duration: 1, clipShape: .capsule)
 
  HStack(spacing: 8) {
    Image(.shield)
    Text("Local shared")
     .font(.medium, 14)
     .foregroundStyle(Color.white)
  }
 }
 .frame(width: 270, height: 36)
 .background(Color.greenColors.opacity(0.1))
 .background(.ultraThinMaterial.opacity(0.1))
 .clipShape(.rect(cornerRadius: 18))
 .overlay {
    RoundedRectangle(cornerRadius: 18)
     .stroke(Color.greenColors.opacity(0.2), lineWidth: 1)
 }
 */
