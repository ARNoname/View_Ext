
import SwiftUI

public struct TopViewApp: View {
    var imageLogo: String?
    var imageLogoW: CGFloat = 123
    var imageLogoH: CGFloat = 18
    var title: String?
    var weight: FontTypeApp = .bold
    var size: CGFloat = 20
    var fg: Color = .black
    var bg: Color = .clear
    var iconL: String?
    var iconLColor: Color = .black
    var iconR: String?
    var iconRColor: Color = .black
    var actionL: (() -> Void)?
    var actionR: (() -> Void)?
  
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
