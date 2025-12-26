import SwiftUI

public struct SwipeCellApp<Content: View>: View {
    public var content: Content
    public var onDelete: () -> Void
    
    @State private var offset: CGFloat = 0
    @GestureState private var isDragging = false
    
    public init(@ViewBuilder content: () -> Content, onDelete: @escaping () -> Void) {
        self.content = content()
        self.onDelete = onDelete
    }
    
    public var body: some View {
        ZStack {
        
          ButtonApp(action: {
                onDelete()
            }) {
                Image(systemName: "trash")
                    .renderingMode(.template)
                    .foregroundStyle(Color.white)
                    .hAlig(.trailing, 39)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.red)
                    .clipShape(.rect(cornerRadius: 16))
                    .padding(2)
                    .padding(.horizontal, 16)
            }
            content
                .offset(x: offset)
                .simultaneousGesture(
                    DragGesture()
                        .updating($isDragging, body: { value, state, _ in
                            state = true
                        })
                        .onChanged { gesture in
                            if gesture.translation.width < 0 {
                                offset = gesture.translation.width
                            }
                        }
                        .onEnded { gesture in
                            if -gesture.translation.width > 100 {
                                offset = -100
                                
                                if -gesture.translation.width > 200 {
                                    onDelete()
                                }
                                
                            } else {
                                offset = 0
                            }
                        }
                )
        }
        .animation(.linear(duration: 0.2), value: offset)
    }
}

