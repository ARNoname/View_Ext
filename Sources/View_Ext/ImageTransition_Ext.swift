import SwiftUI

public struct ImageTrasitionApp: View {
    
    public var imageOne: String
    public var imageTwo: String
    public var title: String?
    public var titleWeigth: FontTypeApp = .medium
    public var titleSize: CGFloat = 16
    public var titleSelecteColor: Color = .red
    public var isSelected: Bool
    public var action: () -> Void
    
    public  var body: some View {
        ButtonApp {
            action()
        } label: {
            HStack {
                IconView
                if let title {
                    Text(title)
                        .fontApp(titleWeigth, titleSize)
                        .foregroundStyle(isSelected ? titleSelecteColor : Color.gray)
                }
            }
        }
    }
    
    @ViewBuilder
    var IconView: some View {
        Group {
            switch isSelected {
            case true:
                Image(imageOne)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            case false:
                Image(imageTwo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
        }
        .transition(.scale)
    }
}
