# ActionScript Collision Detection Bug
This repository demonstrates a common error in ActionScript 3 collision detection and provides a solution.
The bug arises from incorrect usage of `getBounds()` when objects reside within different display list hierarchies.
The `getBounds()` method returns a rectangle relative to the object's parent. Comparing bounds from objects with different parents will result in inaccurate collision detection.
The solution involves using localToGlobal() and globalToLocal() to transform coordinates into a common coordinate space before comparison.
