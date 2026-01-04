import SwiftUI

public struct SwipeCellApp<Content: View>: View {
     var content: Content
     var onDelete: () -> Void
     var fgColor: Color
     var bgColor: Color
     var cornerRadius: CGFloat
    
    @State private var offset: CGFloat = 0
    @GestureState private var isDragging = false
    
    public init(
        @ViewBuilder content: () -> Content,
        onDelete: @escaping () -> Void,
        fgColor: Color = .white,
        bgColor: Color = .red,
        cornerRadius: CGFloat = 16
    ) {
        self.content = content()
        self.onDelete = onDelete
        self.fgColor = fgColor
        self.bgColor = bgColor
        self.cornerRadius = cornerRadius
    }
    
    public var body: some View {
        ZStack {
        
          ButtonApp(action: {
                onDelete()
            }) {
                Image(systemName: "trash")
                    .renderingMode(.template)
                    .foregroundStyle(fgColor)
                    .hAlig(.trailing, 39)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(bgColor)
                    .clipShape(.rect(cornerRadius: cornerRadius))
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

