import Foundation
import SwiftUI

public extension View {
    func onBackSwipe(perform action: @escaping () -> Void) -> some View {
        simultaneousGesture( DragGesture()
            .onEnded({ value in
                if value.startLocation.x < 10 && value.translation.width > 80 {
                    action()
                }
            }))
    }
}

extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        if backSwipeGesture {
            interactivePopGestureRecognizer?.delegate = self
        }
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard backSwipeGesture else { return true }
        return viewControllers.count > 1
    }
}
