import SwiftUI

@available(iOS 16.4, *)
public extension View {
    func sheetHight(_ hight: CGFloat, _ radius: CGFloat = 20) -> some View {
        self.presentationDetents([.height(hight)])
            .presentationCornerRadius(radius)
    }
}








