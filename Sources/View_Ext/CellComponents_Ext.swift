import SwiftUI

public struct CellApp: View {
    
    var title: String
    var iconL: String?
    var iconSysL: String?
    var fg: Color = .black
    var iconR: String?
    var iconSysR: String?
    var weight: FontTypes = .regular
    var size: CGFloat = 16
    var action: () -> Void
    
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
                    .fontsApp(weight, size)
                
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
