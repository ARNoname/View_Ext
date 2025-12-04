import SwiftUI

public struct ImageTrasitionApp: View {
    
    var imageOne: String
    var imageTwo: String
    var title: String? = nil
    var isSelected: Bool
    var action: () -> Void
    
    public  var body: some View {
        ButtonApp {
            action()
        } label: {
            HStack {
                IconView
                if let title = title {
                    Text(title)
                        .fontsApp(.medium,16)
                        .foregroundStyle(isSelected ? Color.red : Color.gray)
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
            case false:
                Image(imageTwo)
            }
        }
        .transitionEffect()
    }
}
