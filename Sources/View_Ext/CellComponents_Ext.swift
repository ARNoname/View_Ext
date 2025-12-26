import SwiftUI

public struct CellApp: View {
    
    public var title: String
    public var iconL: String?
    public var iconSysL: String?
    public var fg: Color = .black
    public var iconR: String?
    public var iconSysR: String?
    public var weight: FontTypeApp = .regular
    public var size: CGFloat = 16
    public var action: () -> Void
    
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
