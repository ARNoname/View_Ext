
import SwiftUI

public struct TopViewApp: View {
    
    var imageLogo: ImageResource?
    var imageLogoW: CGFloat
    var imageLogoH: CGFloat
    var title: String?
    var weight: FontTypeApp
    var size: CGFloat
    var fg: Color
    var bg: Color
    var iconL: ImageResource?
    var iconLColor: Color
    var iconR: ImageResource?
    var iconRColor: Color
    var actionL: (() -> Void)?
    var actionR: (() -> Void)?
    
    public init(
        imageLogo: ImageResource? = nil,
        imageLogoW: CGFloat = 123,
        imageLogoH: CGFloat = 18,
        title: String? = nil,
        weight: FontTypeApp = .bold,
        size: CGFloat = 20,
        fg: Color = .black,
        bg: Color = .clear,
        iconL: ImageResource? = nil,
        iconLColor: Color = .black,
        iconR: ImageResource? = nil,
        iconRColor: Color = .black,
        actionL: (() -> Void)? = nil,
        actionR: (() -> Void)? = nil) {
        self.imageLogo = imageLogo
        self.imageLogoW = imageLogoW
        self.imageLogoH = imageLogoH
        self.title = title
        self.weight = weight
        self.size = size
        self.fg = fg
        self.bg = bg
        self.iconL = iconL
        self.iconLColor = iconLColor
        self.iconR = iconR
        self.iconRColor = iconRColor
        self.actionL = actionL
        self.actionR = actionR
    }
    
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
