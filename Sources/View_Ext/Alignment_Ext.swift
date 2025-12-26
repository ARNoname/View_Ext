import SwiftUI

public extension View {
    
    func hAlig(_ alignment: Alignment, _ padding: CGFloat? = 0) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
            .padding(.horizontal, padding)
    }
    
    func vAlig(_ alignment: Alignment, _ padding: CGFloat? = 0) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
            .padding(.vertical, padding)
    }
    
}
