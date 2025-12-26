import SwiftUI

public struct CellApp: View {
    
    var title: String
    var iconL: String?
    var iconSysL: String?
    var fg: Color = .black
    var iconR: String?
    var iconSysR: String?
    var weight: FontTypeApp = .regular
    var size: CGFloat = 16
    var action: () -> Void
    
public  init(title: String, iconL: String? = nil, iconSysL: String? = nil, fg: Color, iconR: String? = nil, iconSysR: String? = nil, weight: FontTypeApp, size: CGFloat, action: @escaping () -> Void) {
        self.title = title
        self.iconL = iconL
        self.iconSysL = iconSysL
        self.fg = fg
        self.iconR = iconR
        self.iconSysR = iconSysR
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
                        .foregroundStyle(fg)
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                }
                
                if let iconSysL {
                    Image(systemName: iconSysL)
                        .renderingMode(.template)
                        .foregroundStyle(Color.black)
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
                        .foregroundStyle(Color.gray)
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                }
                
                if let iconSysR {
                    Image(systemName: iconSysR)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(Color.gray)
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                }
            }
        }
    }
}
