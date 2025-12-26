import SwiftUI

public extension View {
   func frameApp(
        alignment: Alignment = .leading,
        bg: Color = Color(hex: "F5F5F5"),
        isStroke: Bool = false,
        colorStroke: Color = .secondary.opacity(0.5),
        radius: CGFloat = 16
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
