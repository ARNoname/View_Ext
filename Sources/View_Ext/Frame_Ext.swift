import SwiftUI

public extension View {
   func frameApp(
        alignment: Alignment = .leading,
        bg: Color = Color(hex: "F5F5F5"),
        isStroke: Bool = false,
        lineWidth: CGFloat = 1,
        colorStroke: Color = .secondary.opacity(0.5),
        radius: CGFloat = 16,
        paddingV: CGFloat = 16,
        paddingH: CGFloat = 20
    ) -> some View  {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
            .padding(.vertical, paddingV)
            .padding(.horizontal, paddingH)
            .background(bg)
            .clipShape(.rect(cornerRadius: radius))
            .overlay {
                if isStroke {
                    RoundedRectangle(cornerRadius: radius)
                        .stroke(colorStroke, lineWidth: lineWidth)
                }
            }
    }
}
