import SwiftUI

public struct ImageTrasitionApp: View {
    
    var imageOne: ImageResource
    var imageTwo: ImageResource
    var title: String?
    var titleWeigth: FontTypeApp
    var titleSize: CGFloat
    var titleSelecteColor: Color
    var isSelected: Bool
    var action: () -> Void
    
    public init(
        imageOne: ImageResource,
        imageTwo: ImageResource,
        title: String? = nil,
        titleWeigth: FontTypeApp = .medium,
        titleSize: CGFloat = 16,
        titleSelecteColor: Color = .red,
        isSelected: Bool = false,
        action: @escaping () -> Void) {
            self.imageOne = imageOne
            self.imageTwo = imageTwo
            self.title = title
            self.titleWeigth = titleWeigth
            self.titleSize = titleSize
            self.titleSelecteColor = titleSelecteColor
            self.isSelected = isSelected
            self.action = action
            
        }
    
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
