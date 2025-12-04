import SwiftUI

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

public extension View {
    func cornerApp(_ radius: CGFloat, corners: UIRectCorner = .allCorners) -> some View {
        clipShape(RoundedCorn(radius: radius, corners: corners))
    }
}
