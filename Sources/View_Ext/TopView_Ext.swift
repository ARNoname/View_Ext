
import SwiftUI

public struct TopViewApp: View {
    var title: String
    var weight: FontTypes = .bold
    var size: CGFloat = 20
    var fg: Color = .black
    var bg: Color = .white
    var imageL: String?
    var imageR: String?
    var logoImage: String?
    var actionL: (() -> Void)?
    var actionR: (() -> Void)?
    
public var body: some View {
        ZStack {
            if let imageL, let actionL {
                ButtonApp { actionL() } label: {
                    Image(imageL)
                        .renderingMode(.template)
                        .foregroundStyle(Color.secondary)
                }
                .hAlig(.leading)
            }
            
            HStack {
                if let logoImage {
                    Image(logoImage)
                }
                Text(title)
                    .fontsApp(weight, size)
                    .foregroundStyle(fg)
            }
            .hAlig(.center)
            
            if let imageR, let actionR {
                ButtonApp { actionR() } label: {
                    Image(imageR)
                        .renderingMode(.template)
                        .foregroundStyle(Color.black)
                }
                .hAlig(.trailing)
            }
        }
        .frame(height: 44)
        .background(bg)
    }
}
