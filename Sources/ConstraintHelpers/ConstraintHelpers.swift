#if canImport(UIKit)
import UIKit

#endif

public extension UIView {

    /// Adds a subview to be constrained progammatically. Also removes the view from its parent, if it has one.
    ///
    /// - Parameter view: The `UIView` to be added as a subview
    func addConstrainedSubview(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.removeFromSuperview()
        self.addSubview(subview)
    }

    /// Adds the view it is called on to the given view, with an option to use the superview's safe area, and optionally constrains it to each anchor that is given a value. **It is possible to define conflicting constraints, beware.**
    ///
    /// - Parameters:
    ///   - superview: the superview
    ///   - safeArea: boolean reflecting whether safeAreaLayoutGuide should be used or not. Defaults to false and is safe to use on any OS target
    ///   - top: if not nil, sets the topAnchor equal to the superview's topAnchor, with a constant of the value
    ///   - bottom: if not nil, sets the bottomAnchor equal to the superview's bottomAnchor, with a constant of the value
    ///   - leading: if not nil, sets the leadingAnchor equal to the superview's leadingAnchor, with a constant of the value
    ///   - trailing: if not nil, sets the trailingAnchor equal to the superview's trailingAnchor, with a constant of the value
    ///   - centerX: if not nil, sets the centerXAnchor equal to the superview's centerXAnchor, with a constant of the value
    ///   - centerY: if not nil, sets the centeryAnchor equal to the superview's centeryAnchor, with a constant of the value
    ///   - equalHeight: if not nil, sets the heightAnchor equal to the superview's heightAnchor, with a multiplier of the value
    ///   - equalWidth: if not nil, sets the widthAnchor equal to the superview's widthAnchor, with a multiplier of the value
    ///   - height: if not nil, sets the heightAnchor equal to a constant of the value
    ///   - width: if not nil, sets the widthAnchor equal to a constant of the value
    ///   - fallbackTop: if not nil and safeArea is not available, added to the top constraint constant
    ///   - fallbackBottom: if not nil and safeArea is not available, added to the bottom constraint constant
    func constrainToSuperView(_ superView: UIView, safeArea: Bool = false, top: CGFloat? = nil, bottom: CGFloat? = nil, leading: CGFloat? = nil, trailing: CGFloat? = nil, centerX: CGFloat? = nil, centerY: CGFloat? = nil, equalHeight: CGFloat? = nil, equalWidth: CGFloat? = nil, height: CGFloat? = nil, width: CGFloat? = nil, fallbackTop: CGFloat? = nil, fallbackBottom: CGFloat? = nil) {

        superView.addConstrainedSubview(self)

        var newConstraints: [NSLayoutConstraint] = []

        if var top = top {
            let topAnchor: NSLayoutYAxisAnchor

            // Get the safe area anchor if it is available and requested
            if #available(iOS 11.0, *), safeArea {
                topAnchor = superView.safeAreaLayoutGuide.topAnchor
            } else {
                topAnchor = superView.topAnchor
                top += fallbackTop ?? 0
            }

            newConstraints.append(self.topAnchor.constraint(equalTo: topAnchor, constant: top))
        }

        if var bottom = bottom {
            let bottomAnchor: NSLayoutYAxisAnchor

            // Get the safe area anchor if it is available and requested
            if #available(iOS 11.0, *), safeArea {
                bottomAnchor = superView.safeAreaLayoutGuide.bottomAnchor
            } else {
                bottomAnchor = superView.bottomAnchor
                bottom += fallbackBottom ?? 0
            }

            newConstraints.append(bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: bottom))
        }

        if let leading = leading {
            let leadingAnchor: NSLayoutXAxisAnchor

            // Get the safe area anchor if it is available and requested
            if #available(iOS 11.0, *), safeArea {
                leadingAnchor = superView.safeAreaLayoutGuide.leadingAnchor
            } else {
                leadingAnchor = superView.leadingAnchor
            }

            newConstraints.append(self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leading))
        }

        if let trailing = trailing {
            let trailingAnchor: NSLayoutXAxisAnchor

            // Get the safe area anchor if it is available and requested
            if #available(iOS 11.0, *), safeArea {
                trailingAnchor = superView.safeAreaLayoutGuide.trailingAnchor
            } else {
                trailingAnchor = superView.trailingAnchor
            }

            newConstraints.append(trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: trailing))
        }

        if let centerX = centerX {
            newConstraints.append(self.centerXAnchor.constraint(equalTo: superView.centerXAnchor, constant: centerX))
        }

        if let centerY = centerY {
            newConstraints.append(self.centerYAnchor.constraint(equalTo: superView.centerYAnchor, constant: centerY))
        }

        if let equalHeight = equalHeight {
            let heightAnchor: NSLayoutDimension

            // Get the safe area anchor if it is available and requested
            if #available(iOS 11.0, *), safeArea {
                heightAnchor = superView.safeAreaLayoutGuide.heightAnchor
            } else {
                heightAnchor = superView.heightAnchor
            }

            newConstraints.append(self.heightAnchor.constraint(equalTo: heightAnchor, multiplier: equalHeight))
        }

        if let equalWidth = equalWidth {
            let widthAnchor: NSLayoutDimension

            // Get the safe area anchor if it is available and requested
            if #available(iOS 11.0, *), safeArea {
                widthAnchor = superView.safeAreaLayoutGuide.widthAnchor
            } else {
                widthAnchor = superView.widthAnchor
            }

            newConstraints.append(self.widthAnchor.constraint(equalTo: widthAnchor, multiplier: equalWidth))
        }

        NSLayoutConstraint.activate(newConstraints)

        self.constrainSelf(height: height, width: width)

    }

    /// Constrains the view it is called on to the given view with the non nil anchors and the given offsets. **Must be siblings in the view hierarchy before calling this method. It is possible to define conflicting constraints, beware.**
    ///
    /// - Parameters:
    ///   - siblingview: the sibling view
    ///   - top: if not nil, sets the topAnchor equal to the siblingview's topAnchor, with a constant of the value
    ///   - bottom: if not nil, sets the bottomAnchor equal to the siblingview's bottomAnchor, with a constant of the value
    ///   - leading: if not nil, sets the leadingAnchor equal to the siblingview's leadingAnchor, with a constant of the value
    ///   - trailing: if not nil, sets the trailingAnchor equal to the siblingview's trailingAnchor, with a constant of the value
    ///   - above: if not nil, sets the bottomAnchor equal to the siblingview's topAnchor, with a constant of the value
    ///   - below: if not nil, sets the topAnchor equal to the siblingview's bottomAnchor, with a constant of the value
    ///   - before: if not nil, sets the trailingAnchor equal to the siblingview's leadingAnchor, with a constant of the value
    ///   - behind: if not nil, sets the leadingAnchor equal to the siblingview's trailingAnchor, with a constant of the value
    ///   - centerX: if not nil, sets the centerXAnchor equal to the siblingview's centerXAnchor, with a constant of the value
    ///   - centerY: if not nil, sets the centerYAnchor equal to the siblingview's centerYAnchor, with a constant of the value
    ///   - equalHeight: if not nil, sets the heightAnchor equal to the siblingview's heightAnchor, with a multiplier of the value
    ///   - equalWidth: if not nil, sets the widthAnchor equal to the siblingview's widthAnchor, with a multiplier of the value
    ///   - height: if not nil, sets the heightAnchor equal to a constant of the value
    ///   - width: if not nil, sets the widthAnchor equal to a constant of the value
    func constrainToSiblingView(_ siblingview: UIView, top: CGFloat? = nil, bottom: CGFloat? = nil, leading: CGFloat? = nil, trailing: CGFloat? = nil, above: CGFloat? = nil, below: CGFloat? = nil, before: CGFloat? = nil, behind: CGFloat? = nil, centerX: CGFloat? = nil, centerY: CGFloat? = nil, equalHeight: CGFloat? = nil, equalWidth: CGFloat? = nil, height: CGFloat? = nil, width: CGFloat? = nil) {

        self.translatesAutoresizingMaskIntoConstraints = false
        siblingview.translatesAutoresizingMaskIntoConstraints = false

        var newConstraints: [NSLayoutConstraint] = []

        if let top = top {
            newConstraints.append(self.topAnchor.constraint(equalTo: siblingview.topAnchor, constant: top))
        }

        if let bottom = bottom {
            newConstraints.append(siblingview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: bottom))
        }

        if let leading = leading {
            newConstraints.append(self.leadingAnchor.constraint(equalTo: siblingview.leadingAnchor, constant: leading))
        }

        if let trailing = trailing {
            newConstraints.append(siblingview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: trailing))
        }

        if let above = above {
            newConstraints.append(siblingview.topAnchor.constraint(equalTo: self.bottomAnchor, constant: above))
        }

        if let below = below {
            newConstraints.append(self.topAnchor.constraint(equalTo: siblingview.bottomAnchor, constant: below))
        }

        if let before = before {
            newConstraints.append(siblingview.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: before))
        }

        if let behind = behind {
            newConstraints.append(self.leadingAnchor.constraint(equalTo: siblingview.trailingAnchor, constant: behind))
        }

        if let centerX = centerX {
            newConstraints.append(self.centerXAnchor.constraint(equalTo: siblingview.centerXAnchor, constant: centerX))
        }

        if let centerY = centerY {
            newConstraints.append(self.centerYAnchor.constraint(equalTo: siblingview.centerYAnchor, constant: centerY))
        }

        if let equalHeight = equalHeight {
            newConstraints.append(self.heightAnchor.constraint(equalTo: siblingview.heightAnchor, multiplier: equalHeight))
        }

        if let equalWidth = equalWidth {
            newConstraints.append(self.widthAnchor.constraint(equalTo: siblingview.widthAnchor, multiplier: equalWidth))
        }

        NSLayoutConstraint.activate(newConstraints)

        self.constrainSelf(height: height, width: width)

    }

    /// Constrains the view it is called on to the given height, width, and or aspect ratio. **It is possible to define conflicting constraints, beware.**
    ///
    /// - Parameters:
    ///   - height: if not nil, sets the heightAnchor equal to a constant of the value
    ///   - width: if not nil, sets the widthAnchor equal to a constant of the value
    ///   - aspectHeight: if not nil, sets the widthAnchor equal to the heightAnchor with a multiplier of the value
    ///   - aspectWidth: if not nil, sets the heightAnchor equal to the widthAnchor with a multiplier of the value
    func constrainSelf(height: CGFloat? = nil, width: CGFloat? = nil, aspectHeight: CGFloat? = nil, aspectWidth: CGFloat? = nil) {

        self.translatesAutoresizingMaskIntoConstraints = false

        var newConstraints: [NSLayoutConstraint] = []

        if let width = width {
            newConstraints.append(self.widthAnchor.constraint(equalToConstant: width))
        }

        if let height = height {
            newConstraints.append(self.heightAnchor.constraint(equalToConstant: height))
        }

        if let aspect = aspectHeight {
            newConstraints.append(self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: aspect))
        }

        if let aspect = aspectWidth {
            newConstraints.append(self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: aspect))
        }

        NSLayoutConstraint.activate(newConstraints)
    }

    /// Adds the view it is called on to the given view and constrains it to fill it, with an option to use the view's safe area. **It is possible to define conflicting constraints, beware.**
    ///
    /// - Parameters:
    ///   - view: the view to fill
    ///   - safeArea: boolean reflecting whether safeAreaLayoutGuide should be used or not. Defaults to false and is safe to use on any OS target
    func constrainToFill(_ view: UIView, safeArea: Bool = false) {
        self.constrainToSuperView(view, safeArea: safeArea, top: 0, bottom: 0, leading: 0, trailing: 0)
    }

    /// Adds the view it is called on to the given view and constrains it to center inside of it, with options to set the height and width. **It is possible to define conflicting constraints, beware.**
    ///
    /// - Parameters:
    ///   - view: the view to center in
    ///   - height: if not nil, sets the heightAnchor equal to a constant of the value
    ///   - width: if not nil, sets the widthAnchor equal to a constant of the value
    func constrainToCenterIn(_ view: UIView, height: CGFloat? = nil, width: CGFloat? = nil) {
        self.constrainToSuperView(view, centerX: 0, centerY: 0, height: height, width: width)
    }
}
