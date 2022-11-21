import UIKit

extension UIView {
    
    var allSuperviews: [UIView] {
        superview.map { [$0] + $0.allSuperviews } ?? []
    }
    
    func commonAncestor(with views: [UIView]) -> UIView? {
        var superviews = [self] + allSuperviews
        for view in views {
            superviews = superviews.commonSuffix(with: [view] + view.allSuperviews)
            guard !superviews.isEmpty else { return nil }
        }
        return superviews.first
    }
    
    func commonAncestor(with view: UIView, _ views: UIView...) -> UIView? {
        commonAncestor(with: [view] + views)
    }
}
