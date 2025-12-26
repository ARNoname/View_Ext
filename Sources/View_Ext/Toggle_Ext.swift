import SwiftUI

public struct ToggleApp: View {
    
    @State private var isConnect: Bool = false
    
    var scaleEffect: CGFloat = 1.0
    var fgisActiveOn: Color  = .white
    var fgisActiveOff: Color = .red
    var bgisActiveOn: Color  = .green
    var bgisActiveOff: Color = .red
    
    public var action: () -> Void
    
    public var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 24, height: 24)
                .hAlig(isConnect ? .trailing : .leading, 2)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(isConnect ? "ON" : "OFF")
                    .fontApp(.medium, 10)
                    .foregroundStyle(isConnect ? fgisActiveOn : fgisActiveOff)
            }
            .hAlig(isConnect ? .leading : .trailing, 6)
        }
        .frame(width: 56, height: 28)
        .background(isConnect ? bgisActiveOn : bgisActiveOff.opacity(0.5))
        .clipShape(.capsule)
        .animation(.spring(duration: 0.3), value: isConnect)
        .scaleEffect(scaleEffect)
        .onTapGesture {
            feedbackApp()
            action()
            isConnect.toggle()
        }
    }
}

