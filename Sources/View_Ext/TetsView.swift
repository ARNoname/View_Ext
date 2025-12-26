import SwiftUI

struct TetsView: View {
    @State var isSelected: Bool = false
    var body: some View {
        ZStack {
            Color.blue.opacity(0.3).ignoresSafeArea()
            VStack {
                Text("Hello, World!")
              
            }
        }
    }
}

#Preview {
    TetsView()
}
