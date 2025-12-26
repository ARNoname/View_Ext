
import SwiftUI

public struct ButtonApp<Label: View>: View {
    var role: ButtonRole?
    let action: () -> Void
    let label: () -> Label
    
public init(role: ButtonRole? = .none, action: @escaping () -> Void, label: @escaping () -> Label) {
        self.role = role
        self.action = action
        self.label = label
    }
    
 public var body: some View {
        Button(role: role, action: {
            feedbackApp()
            action()
        }, label: {
            label()
        })
    }
}

public extension ButtonApp where Label == Text {
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
