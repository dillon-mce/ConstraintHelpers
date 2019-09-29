# ConstraintHelpers

Some constraint helpers to make build UI programmatically a little easier to read and write.

## Examples:

Use `addConstrainedSubview(_:)` to add a subview and set `translatesAutoresizingMaskIntoContstraints` to `false` at the same time. Helpful if you want to write your own constraints or if you want to constrain a view to its sibling:
```swift
let view1 = UIView()
let view2 = UIView()
view1.addConstrainedSubview(view2)

// Write your own constraints here.
// Or use constrainToSibling(_:)
```

Use `constrainToSuperView(_:)` to add the view as a subview to another view with the given constraints:
```swift
let view1 = UIView()
view1.backgroundColor = .systemBlue
let view2 = UIView()
view2.backgroundColor = .systemRed

// 20 points from all sides
view2.constrainToSuperView(view1,
                           top: 20,
                           bottom: 20,
                           leading: 20,
                           trailing: 20)
```
![Constrained 20 points on all sides](/Resources/Images/2019-09-29-twenty-points.png)

```swift
let view1 = UIView()
view1.backgroundColor = .systemBlue
let view2 = UIView()
view2.backgroundColor = .systemRed
                           
// Centered, with  half height and 80% width of safe area
view2.constrainToSuperView(view1,
                           safeArea: true,
                           centerX: 0,
                           centerY: 0,
                           equalHeight: 0.5,
                           equalWidth: 0.8)
```
![Constrained centered with half height and eighty percent width](/Resources/Images/2019-09-29-centered.png)

Use `constrainToSiblingView(_:)` to constrain one view to another that is already in the same view hierarchy:
```swift
let view1 = UIView()
view1.backgroundColor = .systemBlue
let view2 = UIView()
view2.backgroundColor = .systemRed
let view3 = UIView()
view3.backgroundColor = .systemYellow

view2.constrainToSuperView(view,
                           safeArea: true,
                           top: 20,
                           leading: 20,
                           trailing: 20,
                           height: 40)

// Constrained 8 points below view2, centered x and equal width, and a height of 200
// Add it as a constrained subview of view1 first, so they are in the same view hierarchy
view1.addConstrainedSubview(view3)
view3.constrainToSiblingView(view2,
                             below: 8,
                             centerX: 0,
                             equalWidth: 1,
                             height: 200)

```
![Constrained one to the other](/Resources/Images/2019-09-29-below.png)
