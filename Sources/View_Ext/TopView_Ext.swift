
import SwiftUI

public struct TopViewApp: View {
    
    public var imageLogo: String?
    public var imageLogoW: CGFloat = 123
    public var imageLogoH: CGFloat = 18
    public var title: String?
    public var weight: FontTypeApp = .bold
    public var size: CGFloat = 20
    public var fg: Color = .black
    public var bg: Color = .clear
    public var iconL: String?
    public var iconLColor: Color = .black
    public var iconR: String?
    public var iconRColor: Color = .black
    public var actionL: (() -> Void)?
    public var actionR: (() -> Void)?
    
    public var body: some View {
        ZStack {
            if let iconL, let actionL {
                ButtonApp { actionL() } label: {
                    Image(iconL)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(iconLColor)
                }
                .hAlig(.leading)
            }
            
            HStack {
                if let imageLogo {
                    Image(imageLogo)
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageLogoW, height: imageLogoH)
                }
                
                if let title {
                    Text(title)
                        .fontApp(weight, size)
                        .foregroundStyle(fg)
                }
            }
            .hAlig(.center)
            
            if let iconR, let actionR {
                ButtonApp { actionR() } label: {
                    Image(iconR)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(iconRColor)
                }
                .hAlig(.trailing)
            }
        }
        .frame(height: 44)
        .background(bg)
    }
}
