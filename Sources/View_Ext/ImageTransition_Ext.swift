import SwiftUI

public struct ImageTrasitionApp: View {
    
    var imageOne: String
    var imageTwo: String
    var title: String?
    var titleWeigth: FontTypeApp = .medium
    var titleSize: CGFloat = 16
    var titleSelecteColor: Color = .red
    var isSelected: Bool
    var action: () -> Void
    
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
