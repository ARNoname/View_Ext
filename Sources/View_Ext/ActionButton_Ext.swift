import SwiftUI

public struct ActioButtonApp: View {

    var title: String
    var icon: ImageResource?
    var systemImage: String?
    var iconColor: Color
    var isStroke: Bool?
    var strokeColor: Color
    var fgColor: Color
    var bgColor: Color
    var cornerRadius: CGFloat
    var action: () -> Void
    
    public init(
        title: String,
        icon: ImageResource? = nil,
        systemImage: String? = nil,
        iconColor: Color = .white,
        isStroke: Bool? = nil,
        strokeColor: Color = .black,
        fgColor: Color = .black,
        bgColor: Color = .blue,
        cornerRadius: CGFloat = 12,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.systemImage = systemImage
        self.iconColor = iconColor
        self.isStroke = isStroke
        self.strokeColor = strokeColor
        self.fgColor = fgColor
        self.bgColor = bgColor
        self.cornerRadius = cornerRadius
        self.action = action
    }
    
    
public var body: some View {
        ButtonApp(action: {
            withAnimation(.easeInOut(duration: 0.3)) {
                action()
            }
        }, label: {
            HStack(spacing:10) {
                if let systemImage {
                    Image(systemName: systemImage)
                        .resizable()
                        .scaledToFill()
                        .foregroundStyle(iconColor)
                        .frame(width: 24, height: 24)
                }
                
                if let icon {
                    Image(icon)
                        .resizable()
                        .scaledToFill()
                        .foregroundStyle(iconColor)
                        .frame(width: 24, height: 24)
                }
                
                Text(title)
                    .fontApp(.semibold, 16)
                    .frame(height: 50)
                    .foregroundStyle(fgColor)
                
            }
            .frame(maxWidth: .infinity)
            .background(bgColor)
            .clipShape(.rect(cornerRadius: cornerRadius))
            .overlay {
                if isStroke != nil {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(strokeColor, lineWidth: 1)
                }
            }
        })
    }
}

