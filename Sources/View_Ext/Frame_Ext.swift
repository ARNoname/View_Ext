import SwiftUI

public extension View {
   func frameApp(
        _ alignment: Alignment = .leading,
        _ bg: Color = Color(hex: "F5F5F5"),
        _ isStroke: Bool = false,
        _ colorStroke: Color = .secondary.opacity(0.5),
        _ radius: CGFloat = 16
    ) -> some View  {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
            .padding(.vertical, 16)
            .padding(.horizontal, 20)
            .background(bg)
            .clipShape(.rect(cornerRadius: radius))
            .overlay {
                if isStroke {
                    RoundedRectangle(cornerRadius: radius)
                        .stroke(colorStroke, lineWidth: 1)
                }
            }
    }
}
