import SwiftUI

public extension View {
    func sheetHightApp(_ hight: CGFloat, _ radius: CGFloat = 20) -> some View {
        self.presentationDetents([.height(hight)])
            .presentationCornerRadius(radius)
    }
}








