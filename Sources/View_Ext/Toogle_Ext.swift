import SwiftUI

public struct ToogleApp: View {
    
    @State var scaleEffect: CGFloat = 1.0
    @State var isConnect: Bool = false
    var fgisActiveOn: Color = Color.white
    var fgisActiveOff: Color = Color.red
    var bgisActiveOn: Color = Color.green
    var bgisActiveOff: Color = Color.red
    @Binding var isEnableAllCategories: Bool
    var action: () -> Void
    
public var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 24, height: 24)
                .hAlig(.leading, isEnableAllCategories ? 30 : 2)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(isEnableAllCategories ? "ON" : "OFF")
                    .fontsApp(.medium, 10)
                    .foregroundStyle(isEnableAllCategories ? fgisActiveOn : fgisActiveOff)
            }
            .hAlig(.trailing, isEnableAllCategories ? 35 : 6)
        }
        .frame(width: 56, height: 28)
        .background(isEnableAllCategories ? bgisActiveOn : bgisActiveOff.opacity(0.5))
        .clipShape(.capsule)
        .animation(.easeInOut(duration: 0.3), value: isEnableAllCategories)
        .scaleEffect(scaleEffect)
        .onTapGesture {
            action()
            feedbackApp()
        }
    }
}
