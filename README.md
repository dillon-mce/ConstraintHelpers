# ConstraintHelpers

Some constraint helpers to make build UI programmatically a little easier to read and write.

## Examples:

Use `addConstrainedSubview(_:)` to add a subview and set `translatesAutoresizingMaskIntoContstraints` to `false` at the same time. Helpful if you want to write your own constraints instead of the any of the helpers:
```swift
let view1 = UIView()
let view2 = UIView()
view1.addConstrainedSubview(view2)

// Write your own constraints here.
```

Use `constrainToSuperView(_:)` to add the view as a subview to another view with the given constraints:
```swift
let view1 = UIView()
let view2 = UIView()

// 20 points from all sides
view2.constrainToSuperView(view1,
                           top: 20,
                           bottom: 20,
                           leading: 20,
                           trailing: 20)
                           
// Centered, with a given height and width
view2.constrainToSuperView(view1,
                           centerX: 0,
                           centerY: 0,
                           height: 200,
                           width: 200)
```
