
import SwiftUI

public struct ButtonApp<Label: View>: View {
    var role: ButtonRole? = .none
    let action: () -> Void
    let label: () -> Label
    
 public var body: some View {
        Button(role: role, action: {
            feedbackApp()
            action()
        }, label: {
            label()
        })
    }
}

extension ButtonApp where Label == Text {
    init(_ role: ButtonRole, _ titleKey: LocalizedStringKey, action: @escaping () -> Void) {
         self.action = action
         self.label = { Text(titleKey) }
         self.role = role
     }
     
     init<S>(_ role: ButtonRole ,_ title: S, action: @escaping () -> Void) where S : StringProtocol {
         self.action = action
         self.label = { Text(title) }
         self.role = role
     }
}
