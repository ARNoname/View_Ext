import SwiftUI

public struct CellApp: View {
    
    var title: String
    var iconL: ImageResource?
    var iconSysL: String?
    var iconColorL: Color
    var fg: Color
    var iconR: ImageResource?
    var iconSysR: String?
    var iconColorR: Color
    var weight: FontTypeApp
    var size: CGFloat
    var action: () -> Void
    
    public init(
        title: String,
        iconL: ImageResource? = nil,
        iconSysL: String? = nil,
        iconColorL: Color = Color.black,
        fg: Color = .black,
        iconR: ImageResource? = nil,
        iconSysR: String? = nil,
        iconColorR: Color = Color.gray,
        weight: FontTypeApp = .regular,
        size: CGFloat = 18,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.iconL = iconL
        self.iconSysL = iconSysL
        self.iconColorL = iconColorL
        self.fg = fg
        self.iconR = iconR
        self.iconSysR = iconSysR
        self.iconColorR = iconColorR
        self.weight = weight
        self.size = size
        self.action = action
    }
    
    public  var body: some View {
        ButtonApp {
            action()
        } label: {
            HStack(spacing: 12) {
                if let iconL {
                    Image(iconL)
                        .renderingMode(.template)
                        .foregroundStyle(iconColorL)
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                }
                
                if let iconSysL {
                    Image(systemName: iconSysL)
                        .renderingMode(.template)
                        .foregroundStyle(iconColorL)
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                }
                
                Text(title)
                    .foregroundStyle(fg)
                    .fontApp(weight, size)
                
                Spacer()
                
                if let iconR {
                    Image(iconR)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(iconColorR)
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                }
                
                if let iconSysR {
                    Image(systemName: iconSysR)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(iconColorR)
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                }
            }
        }
    }
}

#Preview {
    CellApp(
        title: "Hello",
        iconSysL: "trash",
        fg: .red,
        iconSysR: "house",
        weight: .medium,
        size: 18,
        action: {}
    )
}
