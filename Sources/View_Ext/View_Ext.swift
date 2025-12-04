// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI


public extension View {
    func screenSize () -> CGSize{
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return window.screen.bounds.size
    }
    
    @available(iOS 16.4, *)
    func sheetHight(_ hight: CGFloat, _ radius: CGFloat = 20) -> some View {
        self.presentationDetents([.height(hight)])
            .presentationCornerRadius(radius)
    }
    
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
    
    func cornerApp(_ radius: CGFloat, corners: UIRectCorner = .allCorners) -> some View {
        clipShape(RoundedCorn(radius: radius, corners: corners))
    }
    
    
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

 struct RoundedCorn: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}


@MainActor
public func feedbackSC() {
    let generator = UIImpactFeedbackGenerator(style: .medium)
       generator.impactOccurred()
}

public extension Color {
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0

        if scanner.scanHexInt64(&rgbValue) {
            let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgbValue & 0x0000FF) / 255.0
            self.init(red: red, green: green, blue: blue)
            return
        }

        self.init(red: 1.0, green: 1.0, blue: 1.0)
    }
}

